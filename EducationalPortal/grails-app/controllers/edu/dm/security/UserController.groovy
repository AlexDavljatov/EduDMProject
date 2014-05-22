package edu.dm.security

import edu.dm.course.Course
import edu.dm.course.component.quiz.Quiz
import edu.dm.party.Party
import edu.dm.score.Score
import edu.dm.score.user.course.UserCourseScore
import edu.dm.score.user.material.UserMaterialScore
import edu.dm.score.user.quiz.UserQuizScore
import org.apache.log4j.Logger
import org.apache.shiro.SecurityUtils
import org.apache.shiro.crypto.hash.Sha256Hash

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * UserController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class UserController {
    private static Logger log = Logger.getLogger(this)

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def userCourseService

    def finalScore() {
        def user = User.findByUsername(SecurityUtils.getSubject().principal)
        def course = Course.findById(Long.valueOf(params.course_id))
		def fscore = UserCourseScore.findByCourseAndUser(course, user)
        def score = userCourseService.computeFinalScore(course, user)
        [course: course, score: score, fscore: fscore?.finalScore]
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userInstanceCount: User.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def recommendedCourses() {
/*
        for (def course : courses) {
//            log.debug("==>" + course.id + "==="  + course.name)
            def participants = course.participants;
            def users = []
            participants.each { users.add(it.user) }
//            for (Party party : participants)
//                users.add(party.user)
            for (def u : users) {
                def userCourseScore = UserCourseScore.findOrCreateByCourseAndUser(course, u)
                def quizesCount = 0
                def materialsCount = 0
                for (def lecture : course.lectures) {
                    userCourseScore.quizesCount = 0
                    userCourseScore.materialsCount = 0
                    for (def quiz : lecture.quizes) {
                        userCourseScore.quizesCount += UserQuizScore.countByQuizAndUser(quiz, user)
                    }
                    quizesCount += lecture.quizes.size()
                    for (def material : lecture.materials) {
                        userCourseScore.materialsCount += UserMaterialScore.countByMaterialAndUser(material, user)
                    }
                    materialsCount += lecture.materials.size()
                }
//                userCourseScore.score = quizesCount ? (1D*userCourseScore.quizesCount).div(quizesCount) : 0 +
//                        materialsCount ? (1D*userCourseScore.materialsCount).div(materialsCount) : 0
                userCourseScore.score = quizesCount ? (1D * userCourseScore.quizesCount).div(quizesCount) : 0 +
                        materialsCount ? (1D * userCourseScore.materialsCount).div(materialsCount) : 0
//                log.debug("quizCount = ${quizesCount}, materialsCount = ${materialsCount}, quiz = ${userCourseScore.quizesCount}, materials = ${userCourseScore.materialsCount}, score = ${userCourseScore.score}")
                userCourseScore.save flush: true
            }
//            log.debug('<==')
        }*/
        def user = User.findByUsername(SecurityUtils.getSubject().principal)
        def courseIDs = userCourseService.userBasedRecommendations(user)
        def recommendedCourses = Course.findAllByIdInList(courseIDs)
        [courses: recommendedCourses]
    }
    @Transactional
    def refresh() {
        for (def course : Course.findAll()) {
            def users = []
            course.participants.each { users.add(it.user) }

            for (def u : users) {
                def score = 0D
                for (def lecture : course.lectures) {
                    def tScore = 0D
                    def uqScores = UserQuizScore.findAllByUserAndQuizInList(u, lecture.quizes.asList())
                    def umScores = UserQuizScore.findAllByUserAndQuizInList(u, lecture.materials.asList())
                    uqScores.each {tScore += it.score}
                    umScores.each {tScore += it.score}
                    def componentsCount = lecture.quizes.size() + lecture.materials.size()
                    tScore = componentsCount ? tScore/componentsCount : 0
                    score += tScore
                }
                def ucScore = UserCourseScore.findOrCreateByCourseAndUser(course, u)
                ucScore.score = score
                ucScore.save flush: true
            }
        }
        redirect(controller: 'user', action: 'list')
    }

    //TODO: service: get user by principal
    @Transactional
    def submitSolution() {
        def user = User.findByUsername(SecurityUtils.getSubject().principal)
        def quiz = Quiz.findById(Long.valueOf(params.quiz_id))
        def score = UserQuizScore.findByUserAndQuiz(user, quiz) ?
            UserQuizScore.findByUserAndQuiz(user, quiz) :
            new UserQuizScore(user: user, quiz: quiz, attempts: [])
        score.attempt(params.attempt)
        user.userQuizScores.add(score)
        user.save flush: true
        score.save flush: true
//        course.subscribers.add(user)
//        course.save flush:true
        redirect(controller: 'course', action: 'list')
    }

    //TODO: service: get user by principal
    @Transactional
    def enrollCourse() {
        log.error('enroll')
        log.debug(params)
        def user = User.findByUsername(SecurityUtils.getSubject().principal)
        def course = Course.findById(Long.valueOf(params.course_id))
        user.courses.add(course)
        user.save flush: true
        def party = Party.findOrCreateWhere(user: user, course: course)
        course.participants.add(party)
        course.save flush: true
        log.error(user)
        log.error(course)
        log.error(user.courses)
        log.error("" + party.user + " " + party.course)
//        course.subscribers.add(user)
//        course.save flush:true
        redirect(controller: 'course', action: 'list')
    }

    //TODO: additional security check
    @Transactional
    def register() {
        log.debug(params)
        def user = new User(username: params.username,
                passwordHash: new Sha256Hash(params.password).toHex(),
                email: params.email, firstName: params.firstName, lastName: params.lastName)
        user.addToRoles(Role.findByName("student"))
        user.save flush: true
        log.debug user
        redirect(controller: 'user', action: 'index')
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'create'
            return
        }

        userInstance.passwordHash = new Sha256Hash(userInstance.passwordHash).toHex()

        userInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userInstance.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'edit'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInstance.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

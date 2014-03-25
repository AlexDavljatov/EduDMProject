package edu.dm.security

import edu.dm.course.Course
import edu.dm.course.component.quiz.Quiz
import edu.dm.score.Score
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

    //TODO: service: get user by principal
    @Transactional
    def submitSolution() {
        def user = User.findByUsername(SecurityUtils.getSubject().principal)
        def quiz = Quiz.findById(Long.valueOf(params.quiz_id))
        def score = Score.findByUserAndQuiz(user, quiz) ? Score.findByUserAndQuiz(user, quiz) : new Score(user: user, quiz: quiz, attempts: [])
        score.attempts.add(params.attempt)
        user.scores.add(score)
        user.save flush: true
        score.save flush: true
//        course.subscribers.add(user)
//        course.save flush:true
        redirect(controller: 'course', action: 'list')
    }

    //TODO: service: get user by principal
    @Transactional
    def enrollCourse() {
        def user = User.findByUsername(SecurityUtils.getSubject().principal)
        def course = Course.findById(Long.valueOf(params.course_id))
        user.courses.add(course)
        user.save flush: true
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
        user.addToPermissions("*:*")
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

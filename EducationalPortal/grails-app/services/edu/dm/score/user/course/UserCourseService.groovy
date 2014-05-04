package edu.dm.score.user.course

import edu.dm.course.Course
import edu.dm.party.Party
import edu.dm.score.user.material.UserMaterialScore
import edu.dm.score.user.quiz.UserQuizScore
import edu.dm.security.User
import org.apache.log4j.Logger
import org.springframework.transaction.annotation.Transactional
import weka.core.Attribute
import weka.core.DenseInstance
import weka.core.Instance
import weka.core.Instances

/**
 * UserCourseService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional(readOnly = true)
class UserCourseService {

    private static Logger log = Logger.getLogger(this)

    def regressionService
    def clusterizationService
    def recommendationService
    def mahoutIntegrationDBService

    def computeFinalScore(Course course, User user) {
        def attributes = course.attributes()
        Attribute finalScoreAttribute = new Attribute("finalScore")
        attributes.add(finalScoreAttribute)
        Instances data = new Instances('User#' + user.id + "_Course#" + course.id, attributes, 0)
        def map = new HashMap<String, Integer>()
        for (int i = 0; i < attributes.size(); i++)
            map.put(attributes.get(i).name(), i)
        def values
        def parties = course.participants
        def users = []
        for (def party : parties)
            users.add(party.user)
        def userIndex = 0
        def missingValues
        for (int i = 0; i < users.size(); i++) {
            missingValues = new ArrayList<Integer>()
            def anotherUser = users[i]
            if (anotherUser == user) userIndex = i
            values = new double[data.numAttributes()]
            for (def lecture : course.lectures) {
                for (def quiz : lecture.quizes) {
                    def userQuizScore = UserQuizScore.findByUserAndQuiz(anotherUser, quiz)
                    int attrIndex = map.get('q' + quiz.id)
                    userQuizScore ? values[attrIndex] = userQuizScore.score : missingValues.add(attrIndex)
                }
                for (def material : lecture.materials) {
                    def userMaterialScore = UserMaterialScore.findAllByUserAndMaterial(anotherUser, material)
                    int attrIndex = map.get('m' + material.id)
                    userMaterialScore ? values[map.get('m' + material.id)] = userMaterialScore.score : missingValues.add(attrIndex)
                }
            }
            def userCourse = UserCourseScore.findByUserAndCourse(anotherUser, course)
            int attrIndex = map.get('finalScore')
            userCourse ? values[attrIndex] = userCourse.finalScore : missingValues.add(attrIndex)
            Instance inst = new DenseInstance(1.0, values)
            for (Integer j : missingValues)
                inst.setMissing(j)
            data.add(inst)
        }
        Instance currentInst = data.get(userIndex)
        return regressionService.doLinearRegression(data, currentInst)
    }

    def findKClusters(Course course, int clustersCount) {
        clustersCount = 5
        def attributes = course.attributes()
        Attribute finalScoreAttribute = new Attribute("finalScore")
        attributes.add(finalScoreAttribute)
        Instances data = new Instances('Course#' + course.id, attributes, 0)
//        def map = new HashMap<String, Integer>()
        def map = [:]
        attributes.eachWithIndex { Attribute entry, int i -> map[entry.name()] = i}
//        for (int i = 0; i < attributes.size(); i++)
//            map.put(attributes.get(i).name(), i)
        def values
//        def parties = course.participants
        def users = []
//        for (def party : parties)
//            users.add(party.user)
        course.participants.each {users.add(it.user)}
        def missingValues
        for (int i = 0; i < users.size(); i++) {
            missingValues = new ArrayList<Integer>()
            def anotherUser = users[i]
            values = new double[data.numAttributes()]
            for (def lecture : course.lectures) {
                for (def quiz : lecture.quizes) {
                    def userQuizScore = UserQuizScore.findByUserAndQuiz(anotherUser, quiz)
                    int attrIndex = map.get('q' + quiz.id)
                    userQuizScore ? values[attrIndex] = userQuizScore.score : missingValues.add(attrIndex)
                }
                for (def material : lecture.materials) {
                    def userMaterialScore = UserMaterialScore.findAllByUserAndMaterial(anotherUser, material)
                    int attrIndex = map.get('m' + material.id)
                    userMaterialScore ? values[map.get('m' + material.id)] = userMaterialScore.score : missingValues.add(attrIndex)
                }
            }
            def userCourse = UserCourseScore.findByUserAndCourse(anotherUser, course)
            int attrIndex = map.get('finalScore')
            userCourse ? values[attrIndex] = userCourse.finalScore : missingValues.add(attrIndex)
            Instance inst = new DenseInstance(1.0, values)
            for (Integer j : missingValues)
                inst.setMissing(j)
            data.add(inst)
        }
        return clusterizationService.doCluster(data, clustersCount)
    }

    @Transactional
    def userBasedRecommendations(User user) {
        /*def courses = Course.findAll()
        for (def course : courses) {
            def participants = course.participants;
            def users = new ArrayList<User>()
            for (Party party : participants)
                users.add(party.user)
            for (def u : users) {
                log.debug(u.class.name)
                log.debug(course.class.name)
                def userCourseScore = UserCourseScore.findOrCreateByCourseAndUser(course,  u)
//                if (!userCourseScore) userCourseScore = new UserCourseScore(course: course, user: u)
                def quizesCount = 0
                def materialsCount = 0
                for (def lecture : course.lectures) {
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
                double score = quizesCount ? (1D*userCourseScore.quizesCount).div(quizesCount) : 0 +
                        materialsCount ? (1D*userCourseScore.materialsCount).div(materialsCount) : 0
//                userCourseScore.save flush: true
                userCourseScore.update(quizesCount, materialsCount, score)
            }
        }*/
        def recommendations = recommendationService.doUserBasedRecommendations(
                mahoutIntegrationDBService.getMySqlDataModel(
                        'user_course_score', 'user_id', 'course_id', 'score'
                ), (int) user.id
        )
        /*def courses = []
        recommendations.each {
            def pair = [:]
            pair[it.itemID] = it.value
            courses.add(pair)
        }
        return courses*/
        def courses = []
        recommendations.each {
            courses.add(it.itemID)
        }
        log.debug("courses " + courses)
        log.debug("recommendations" + recommendations)
        return courses
    }
}

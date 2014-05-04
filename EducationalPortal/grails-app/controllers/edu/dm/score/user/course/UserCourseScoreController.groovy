package edu.dm.score.user.course

import edu.dm.course.Course
import edu.dm.security.User
import org.apache.log4j.Logger
import org.apache.shiro.SecurityUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * UserCourseScoreController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class UserCourseScoreController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserCourseScore.list(params), model:[userCourseScoreInstanceCount: UserCourseScore.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserCourseScore.list(params), model:[userCourseScoreInstanceCount: UserCourseScore.count()]
    }

    def show(UserCourseScore userCourseScoreInstance) {
        respond userCourseScoreInstance
    }

    def create() {
        respond new UserCourseScore(params)
    }

    @Transactional
    def save(UserCourseScore userCourseScoreInstance) {
        if (userCourseScoreInstance == null) {
            notFound()
            return
        }

        if (userCourseScoreInstance.hasErrors()) {
            respond userCourseScoreInstance.errors, view:'create'
            return
        }

        userCourseScoreInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userCourseScoreInstance.label', default: 'UserCourseScore'), userCourseScoreInstance.id])
                redirect userCourseScoreInstance
            }
            '*' { respond userCourseScoreInstance, [status: CREATED] }
        }
    }

    def edit(UserCourseScore userCourseScoreInstance) {
        respond userCourseScoreInstance
    }

    @Transactional
    def update(UserCourseScore userCourseScoreInstance) {
        if (userCourseScoreInstance == null) {
            notFound()
            return
        }

        if (userCourseScoreInstance.hasErrors()) {
            respond userCourseScoreInstance.errors, view:'edit'
            return
        }

        userCourseScoreInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserCourseScore.label', default: 'UserCourseScore'), userCourseScoreInstance.id])
                redirect userCourseScoreInstance
            }
            '*'{ respond userCourseScoreInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserCourseScore userCourseScoreInstance) {

        if (userCourseScoreInstance == null) {
            notFound()
            return
        }

        userCourseScoreInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserCourseScore.label', default: 'UserCourseScore'), userCourseScoreInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userCourseScoreInstance.label', default: 'UserCourseScore'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

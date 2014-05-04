package edu.dm.score.user.quiz


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * UserQuizScoreController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class UserQuizScoreController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserQuizScore.list(params), model:[userQuizScoreInstanceCount: UserQuizScore.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserQuizScore.list(params), model:[userQuizScoreInstanceCount: UserQuizScore.count()]
    }

    def show(UserQuizScore userQuizScoreInstance) {
        respond userQuizScoreInstance
    }

    def create() {
        respond new UserQuizScore(params)
    }

    @Transactional
    def save(UserQuizScore userQuizScoreInstance) {
        if (userQuizScoreInstance == null) {
            notFound()
            return
        }

        if (userQuizScoreInstance.hasErrors()) {
            respond userQuizScoreInstance.errors, view:'create'
            return
        }

        userQuizScoreInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userQuizScoreInstance.label', default: 'UserQuizScore'), userQuizScoreInstance.id])
                redirect userQuizScoreInstance
            }
            '*' { respond userQuizScoreInstance, [status: CREATED] }
        }
    }

    def edit(UserQuizScore userQuizScoreInstance) {
        respond userQuizScoreInstance
    }

    @Transactional
    def update(UserQuizScore userQuizScoreInstance) {
        if (userQuizScoreInstance == null) {
            notFound()
            return
        }

        if (userQuizScoreInstance.hasErrors()) {
            respond userQuizScoreInstance.errors, view:'edit'
            return
        }

        userQuizScoreInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserQuizScore.label', default: 'UserQuizScore'), userQuizScoreInstance.id])
                redirect userQuizScoreInstance
            }
            '*'{ respond userQuizScoreInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserQuizScore userQuizScoreInstance) {

        if (userQuizScoreInstance == null) {
            notFound()
            return
        }

        userQuizScoreInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserQuizScore.label', default: 'UserQuizScore'), userQuizScoreInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userQuizScoreInstance.label', default: 'UserQuizScore'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

package edu.dm.course.component.quiz

import edu.dm.course.component.Component
import edu.dm.security.User
import org.apache.shiro.SecurityUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * QuizController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class QuizController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Quiz.list(params), model:[quizInstanceCount: Quiz.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Quiz.list(params), model:[quizInstanceCount: Quiz.count()]
    }

    def show(Quiz quizInstance) {
        respond quizInstance
    }

    def create() {
        respond new Quiz(params)
    }

    @Transactional
    def save(Quiz quizInstance) {
        if (quizInstance == null) {
            notFound()
            return
        }

        if (quizInstance.hasErrors()) {
            respond quizInstance.errors, view:'create'
            return
        }

        def user = User.findByUsername(SecurityUtils.getSubject().principal)
        user.myComponents.add(quizInstance)
        log.debug(user)
        user.save flush:true
        quizInstance.author = user


//        log.debug(componentInstance.author)

        quizInstance.save flush:true


        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'quizInstance.label', default: 'Quiz'), quizInstance.id])
                redirect quizInstance
            }
            '*' { respond quizInstance, [status: CREATED] }
        }
    }

    def edit(Quiz quizInstance) {
        respond quizInstance
    }

    @Transactional
    def update(Quiz quizInstance) {
        if (quizInstance == null) {
            notFound()
            return
        }

        if (quizInstance.hasErrors()) {
            respond quizInstance.errors, view:'edit'
            return
        }

        quizInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Quiz.label', default: 'Quiz'), quizInstance.id])
                redirect quizInstance
            }
            '*'{ respond quizInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Quiz quizInstance) {

        if (quizInstance == null) {
            notFound()
            return
        }

        quizInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Quiz.label', default: 'Quiz'), quizInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'quizInstance.label', default: 'Quiz'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

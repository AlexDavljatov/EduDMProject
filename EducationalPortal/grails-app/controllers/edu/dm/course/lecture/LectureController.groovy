package edu.dm.course.lecture

import edu.dm.security.User
import org.apache.shiro.SecurityUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * LectureController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class LectureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Lecture.list(params), model:[lectureInstanceCount: Lecture.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Lecture.list(params), model:[lectureInstanceCount: Lecture.count()]
    }

    def show(Lecture lectureInstance) {
        respond lectureInstance
    }

    def create() {
        respond new Lecture(params)
    }

    @Transactional
    def save(Lecture lectureInstance) {
        if (lectureInstance == null) {
            notFound()
            return
        }

        def user = User.findByUsername(SecurityUtils.getSubject().principal)
        user.myLectures.add(lectureInstance)
        lectureInstance.author = user
        user.save flush: true


        if (lectureInstance.hasErrors()) {
            respond lectureInstance.errors, view:'create'
            return
        }

        lectureInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'lectureInstance.label', default: 'Lecture'), lectureInstance.id])
                redirect lectureInstance
            }
            '*' { respond lectureInstance, [status: CREATED] }
        }
    }

    def edit(Lecture lectureInstance) {
        respond lectureInstance
    }

    @Transactional
    def update(Lecture lectureInstance) {
        if (lectureInstance == null) {
            notFound()
            return
        }

        if (lectureInstance.hasErrors()) {
            respond lectureInstance.errors, view:'edit'
            return
        }

        lectureInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Lecture.label', default: 'Lecture'), lectureInstance.id])
                redirect lectureInstance
            }
            '*'{ respond lectureInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Lecture lectureInstance) {

        if (lectureInstance == null) {
            notFound()
            return
        }

        lectureInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Lecture.label', default: 'Lecture'), lectureInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'lectureInstance.label', default: 'Lecture'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

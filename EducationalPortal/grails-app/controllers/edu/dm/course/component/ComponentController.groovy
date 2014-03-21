package edu.dm.course.component

import org.apache.shiro.SecurityUtils
import org.apache.shiro.session.Session
import org.apache.shiro.subject.Subject

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ComponentController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ComponentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Component.list(params), model:[componentInstanceCount: Component.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Component.list(params), model:[componentInstanceCount: Component.count()]
    }

    def show(Component componentInstance) {
        respond componentInstance
    }

    def create() {
        respond new Component(params)
    }

    def upload() {
        def f = request.getFile('myFile')
        def path = params["fileName"]
        println params
        if (f.empty) {
            flash.message = 'file cannot be empty'
            render(view: 'uploadForm')
            return
        }
//        println  (SecurityUtils.subject?.principal)
        println System.getProperty("java.io.tmpdir") + path + "." + f.getOriginalFilename().split()
        f.transferTo(new File(System.getProperty("java.io.tmpdir") + path + "." + f.getContentType().split("/")[1]))
        redirect(action: "list")
    }

    @Transactional
    def save(Component componentInstance) {
        if (componentInstance == null) {
            notFound()
            return
        }

        if (componentInstance.hasErrors()) {
            respond componentInstance.errors, view:'create'
            return
        }

        componentInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'componentInstance.label', default: 'Component'), componentInstance.id])
                redirect componentInstance
            }
            '*' { respond componentInstance, [status: CREATED] }
        }
    }

    def edit(Component componentInstance) {
        respond componentInstance
    }

    @Transactional
    def update(Component componentInstance) {
        if (componentInstance == null) {
            notFound()
            return
        }

        if (componentInstance.hasErrors()) {
            respond componentInstance.errors, view:'edit'
            return
        }

        componentInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Component.label', default: 'Component'), componentInstance.id])
                redirect componentInstance
            }
            '*'{ respond componentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Component componentInstance) {

        if (componentInstance == null) {
            notFound()
            return
        }

        componentInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Component.label', default: 'Component'), componentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'componentInstance.label', default: 'Component'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

package edu.dm.course.component.material

import edu.dm.course.component.Component
import edu.dm.security.User
import org.apache.log4j.Logger
import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * MaterialController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class MaterialController {

//    private Logger log = Logger.getLogger(this)

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Material.list(params), model:[materialInstanceCount: Material.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Material.list(params), model:[materialInstanceCount: Material.count()]
    }

    def show(Material materialInstance) {
        respond materialInstance
    }

    def create() {
        respond new Material(params)
    }

    //TODO: exception handling
    @Transactional
    def upload() {

        def f = request.getFile('myFile')
        def curComp = Component.findById(Long.valueOf(params.comp_id))
        def compName = curComp.name

        Subject currentUser = SecurityUtils.getSubject();

        if (f.empty) {
            flash.message = 'file cannot be empty'
            render(view: 'uploadForm')
            return
        }
//        println  (SecurityUtils.subject?.principal)
//        println f.getContentType()
        String contentPath = System.getProperty("java.io.tmpdir") + currentUser.principal + '_' + compName + "." + f.getContentType().toString().split("/")[1]
//        log.debug contentPath
        f.transferTo(new File(contentPath))
        curComp.contentPath = contentPath
        curComp.save flush: true
        redirect(controller: "material",  action: "list")
    }

    @Transactional
    def save(Material materialInstance) {
        if (materialInstance == null) {
            notFound()
            return
        }

        if (materialInstance.hasErrors()) {
            respond materialInstance.errors, view:'create'
            return
        }

        def user = User.findByUsername(SecurityUtils.getSubject().principal)
        user.myMaterilas.add(materialInstance)
//        log.debug(user)
        user.save flush:true
        materialInstance.author = user


//        log.debug(componentInstance.author)

        materialInstance.save flush:true


        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'materialInstance.label', default: 'Material'), materialInstance.id])
                redirect materialInstance
            }
            '*' { respond materialInstance, [status: CREATED] }
        }
    }

    def edit(Material materialInstance) {
        respond materialInstance
    }

    @Transactional
    def update(Material materialInstance) {
        if (materialInstance == null) {
            notFound()
            return
        }

        if (materialInstance.hasErrors()) {
            respond materialInstance.errors, view:'edit'
            return
        }

        materialInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Material.label', default: 'Material'), materialInstance.id])
                redirect materialInstance
            }
            '*'{ respond materialInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Material materialInstance) {

        if (materialInstance == null) {
            notFound()
            return
        }

        materialInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Material.label', default: 'Material'), materialInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialInstance.label', default: 'Material'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

package uploadingstoringmedia

import org.springframework.web.multipart.MultipartFile

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UploaderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Uploader.list(params), model: [uploaderInstanceCount: Uploader.count()]
    }

    def show(Uploader uploaderInstance) {
        respond uploaderInstance
    }

    def create() {
        respond new Uploader(params)
    }

    @Transactional
    def save(Uploader uploaderInstance) {
        if (uploaderInstance == null) {
            notFound()
            return
        }

        if (uploaderInstance.hasErrors()) {
            respond uploaderInstance.errors, view: 'create'
            return
        }

        uploaderInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'uploaderInstance.label', default: 'Uploader'), uploaderInstance.id])
                redirect uploaderInstance
            }
            '*' { respond uploaderInstance, [status: CREATED] }
        }
    }

    def edit(Uploader uploaderInstance) {
        respond uploaderInstance
    }

    @Transactional
    def update(Uploader uploaderInstance) {
        if (uploaderInstance == null) {
            notFound()
            return
        }

        if (uploaderInstance.hasErrors()) {
            respond uploaderInstance.errors, view: 'edit'
            return
        }

        uploaderInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Uploader.label', default: 'Uploader'), uploaderInstance.id])
                redirect uploaderInstance
            }
            '*' { respond uploaderInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Uploader uploaderInstance) {

        if (uploaderInstance == null) {
            notFound()
            return
        }

        uploaderInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Uploader.label', default: 'Uploader'), uploaderInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'uploaderInstance.label', default: 'Uploader'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def upload() {
        MultipartFile f = request.getFile('myFile')
        if (f.empty) {
            flash.message = 'file cannot be empty'
            render(view: 'uploadForm')
            return
        }
        println(f.originalFilename + " <> " + f.name + " <> " + System.getProperty("java.io.tmpdir"))
        f.transferTo(new File(System.getProperty("java.io.tmpdir") + f.originalFilename))
        response.sendError(200, 'Done')
    }
}

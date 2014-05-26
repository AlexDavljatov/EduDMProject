package edu.dm.course

import edu.dm.security.User
import org.apache.shiro.SecurityUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * CourseController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class CourseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def userCourseService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Course.list(params), model: [courseInstanceCount: Course.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Course.list(params), model: [courseInstanceCount: Course.count()]
    }

    def show(Course courseInstance) {
        respond courseInstance
    }

    def create() {
        respond new Course(params)
    }

    def clusterize(){
//    	render userCourseService.findKClusters(Course.findById(Long.valueOf(params.course_id)), 3).clusterResultsToString()
        [clusters_desc: 
			userCourseService.findKClusters(Course.findById(Long.valueOf(params.course_id)), 3).clusterResultsToString()]
    }

    @Transactional
    def save(Course courseInstance) {
        if (courseInstance == null) {
            notFound()
            return
        }

        def user = User.findByUsername(SecurityUtils.getSubject().principal)
        user.myCourses.add(courseInstance)
        courseInstance.author = user
        user.save flush: true

        if (courseInstance.hasErrors()) {
            respond courseInstance.errors, view: 'create'
            return
        }


        courseInstance.save flush: true


        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseInstance.label', default: 'Course'), courseInstance.id])
                redirect courseInstance
            }
            '*' { respond courseInstance, [status: CREATED] }
        }
    }

    def edit(Course courseInstance) {
        respond courseInstance
    }

    @Transactional
    def update(Course courseInstance) {
        if (courseInstance == null) {
            notFound()
            return
        }

        if (courseInstance.hasErrors()) {
            respond courseInstance.errors, view: 'edit'
            return
        }

        courseInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Course.label', default: 'Course'), courseInstance.id])
                redirect courseInstance
            }
            '*' { respond courseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Course courseInstance) {

        if (courseInstance == null) {
            notFound()
            return
        }

        courseInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Course.label', default: 'Course'), courseInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseInstance.label', default: 'Course'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

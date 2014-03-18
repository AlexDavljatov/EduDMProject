package com

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.MultipartFile

class UploaderController {

    @Secured(['ROLE_ADMIN'])
    def upload() {
        println (request instanceof MultipartHttpServletRequest)
        def f = request.getFile('myFile')
        if (f.empty) {
            flash.message = 'file cannot be empty'
            render(view: 'uploadForm')
            return
        }

//        f.transferTo(new File('/some/local/dir/myfile.txt'))
        println 'success'
        response.sendError(200, 'Done')
    }
}

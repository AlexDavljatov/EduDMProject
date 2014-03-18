package edu.dm.upload

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured(['ROLE_ADMIN'])
class UploadController {

    def upload() {
        if(request instanceof MultipartHttpServletRequest)
        {
            MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
            CommonsMultipartFile f = (CommonsMultipartFile) mpr.getFile("myFile");
            if(!f.empty)
                println 'success'
            else
                println 'failure'
        }
        else
            println 'request is not of type MultipartHttpServletRequest'
            println request.inputStream
        response.sendError(200, 'Done')
    }
}

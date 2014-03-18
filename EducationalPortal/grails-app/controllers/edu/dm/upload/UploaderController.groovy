package edu.dm.upload

import org.springframework.web.multipart.MultipartFile

/**
 * UploaderController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UploaderController {
//	def index = { }

    def upload() {
        def f = request.getFile('myFile')
        if (f.empty) {
            flash.message = 'file cannot be empty'
            render(view: 'uploadForm')
            return
        }
//        f.transferTo(new File('/some/local/dir/myfile.txt'))
        response.sendError(200, 'Done')
    }
}

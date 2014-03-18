package edu.dm.testFeatures

import grails.plugin.springsecurity.annotation.Secured
/**
 * SecureController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class SecureController {

//	def index = { }
    @Secured(['ROLE_ADMIN'])
    def index() {
        render 'Secure access only'
    }
}

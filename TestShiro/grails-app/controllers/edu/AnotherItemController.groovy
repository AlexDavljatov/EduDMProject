package edu

import org.apache.shiro.SecurityUtils
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.subject.Subject

class AnotherItemController {

    def index() {}

    def createCustom() {
//        new Item(params).save flush: true
        Subject currentUser = SecurityUtils.getSubject();
        println currentUser
        println 'principal: ' + currentUser.principal
        println 'principals: ' + currentUser.principals
        println 'properties: ' + currentUser.getProperties()
        println 'attributes: ' + currentUser.getSession().attributeKeys
//        println(params)
//        println(params.username + " " + params.password)
        def user = new User(username: params.username,
                passwordHash: new Sha256Hash(params.password).toHex(),
                email: params.email)
        user.addToPermissions("*:*")
        user.save flush:true
        println(user)
//        println( new User(username: "user123", passwordHash: new Sha256Hash("password").toHex()))
        redirect(controller: 'item', action: 'index')
    }
}

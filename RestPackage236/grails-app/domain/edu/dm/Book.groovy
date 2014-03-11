package edu.dm

import grails.rest.Resource

@Resource (uri='/books')
class Book {

    String title

    static constraints = {
    }
}

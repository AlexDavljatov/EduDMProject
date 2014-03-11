package edu.edudm

import grails.rest.*

//@Resource(uri='/books')
class Book {
    static mapWith = "REST"
    static mapping = {
        endpoint "/books"
        format "xml"
    }
    String title

    static constraints = { title blank:false }
}

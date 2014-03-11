package rest236

import grails.rest.Resource

@Resource(uri='/books')
class Book {

    String title

    static constraints = {
    }
}

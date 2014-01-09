package mongoandhibernate

class Person {
    static mapWith = "mongo"

    String name
    String surname


    static constraints = {
        name (blank: false)
        surname (blank: false)
    }
}

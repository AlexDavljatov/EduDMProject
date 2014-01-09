package mongoandhibernate

class Pet {

    String type
    String name



    static constraints = {
        type (blank: false)
        name (blank: false)
    }
}

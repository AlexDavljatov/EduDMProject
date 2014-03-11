import edu.dm.Book

class BootStrap {

    def init = { servletContext ->
        new Book(title:"The Stand").save()
        new Book(title:"The Shining").save()
    }
    def destroy = {
    }
}

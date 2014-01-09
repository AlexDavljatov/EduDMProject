package mongoandhibernate

class User {

    String login
    String password
    String email
    Role role

    static constraints = {
        login size: 5..15, blank: false, unique: true
        password size: 5..15, blank: false
        email email: true, blank: false, unique: true
    }
}

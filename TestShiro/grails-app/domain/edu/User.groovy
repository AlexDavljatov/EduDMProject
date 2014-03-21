package edu

class User {
    String username
    String passwordHash
    String email

    static hasMany = [roles: Role, permissions: String]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
    }
}

package edu.dm.security
class ShiroUser {
    String username
    String passwordHash
	String email
	String firstName
	String lastName
	
    static hasMany = [ roles: ShiroRole, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
    }
}

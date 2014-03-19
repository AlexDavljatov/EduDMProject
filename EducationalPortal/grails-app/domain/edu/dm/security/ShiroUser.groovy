package edu.dm.security

import edu.dm.course.Course
import edu.dm.course.component.Component

class ShiroUser {
    String username
    String passwordHash
	String email
	String firstName
	String lastName
	
    static hasMany = [ roles: ShiroRole, permissions: String, courses: Course, components: Component ]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
        email email: true, blank: false
        firstName blank: false
        lastName blank: false
    }
}

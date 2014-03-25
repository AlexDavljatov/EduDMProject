package edu.dm.security

import edu.dm.course.Course
import edu.dm.course.component.Component
import edu.dm.course.component.material.Material
import edu.dm.course.component.quiz.Quiz
import edu.dm.score.Score

class User {
    String username
    String passwordHash
    String email
    String firstName
    String lastName
    String aboutMe

//    static hasMany = [ roles: Role, permissions: String, myCourses: Course, courses: Course, myQuizes: Quiz, myMaterials: Material ]
    static hasMany = [
            roles: Role,
            permissions: String,
            myCourses: Course,
            courses: Course,
            myComponents: Component,
            scores: Score
    ]

    static constraints = {
        username nullable: false, blank: false, unique: true, size: 6..18
        email email: true, blank: false
        firstName blank: false
        lastName blank: false
        passwordHash blank: false
        aboutMe nullable: true
    }

    @Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${username}";
	}
}

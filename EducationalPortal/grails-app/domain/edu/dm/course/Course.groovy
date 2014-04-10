package edu.dm.course

import edu.dm.course.component.Component
import edu.dm.course.component.material.Material
import edu.dm.course.component.quiz.Quiz
import edu.dm.security.User

class Course {
    static hasMany = [quizes: Quiz, materials: Material]
//    static hasMany = [components: Component]
    static belongsTo = [author: User]

    String name
    String description

    static constraints = {
        name nullable: false, blank: false, unique: true
        description nullable: true
    }

    @Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${name}";
	}
}

package edu.dm.course.component

import edu.dm.course.Course
import edu.dm.security.User

abstract class Component {
    static belongsTo = [author: User]

    String name
    String description
    static mapping = {
        tablePerHierarchy false
    }

    static constraints = {
        name unique: true
        description nullable: true
        author nullable: true
    }

    @Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${name}";
	}
}

package edu.dm.course

import edu.dm.course.component.Component

class Course {
    static hasMany = [components: Component]
    String name
}

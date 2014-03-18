package edu.dm.course.component

import edu.dm.course.Course

class Component {
    static belongsTo = Course
    static hasMany = [courses:Course]

    String name
    ComponentType type

}

package edu.dm.course.component

import edu.dm.course.Course

class Component {
//    static belongsTo = Course

    static constraints = {
        name unique: true
    }

    String name
    String contentPath
    ComponentType type
}

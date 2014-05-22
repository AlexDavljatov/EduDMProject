package edu.dm.course

import edu.dm.course.component.Component
import edu.dm.course.component.material.Material
import edu.dm.course.component.quiz.Quiz
import edu.dm.course.lecture.Lecture
import edu.dm.party.Party
import edu.dm.security.User
import weka.core.Attribute

class Course {
    static hasMany = [lectures: Lecture, categories: String, participants: Party]
    static belongsTo = [author: User]



    String name
    String description

    static constraints = {
        name nullable: false, blank: false, unique: true
        description nullable: true
        categories nullable: true
        participants nullable: true
        author nullable: true
    }

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${name}";
    }

    def attributes(){
        def attributes = new ArrayList<Attribute>()
        for (def lecture: lectures){
            for (def quiz: lecture.quizes){
                attributes.add(new Attribute('q' + quiz.id))
            }
            for (def material: lecture.materials){
                attributes.add(new Attribute('m' + material.id))
            }
        }
        return attributes
    }
}

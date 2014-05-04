package edu.dm.score.user.quiz

import edu.dm.course.component.quiz.Quiz
import edu.dm.security.User

/**
 * UserQuizScore
 * A domain class describes the data object and it's mapping to the database
 */
class UserQuizScore {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 

    List attempts = []

    static belongsTo = [user: User]
    static hasMany = [attempts: String]
    Quiz quiz
    double score = 0

    static mapping = {
    }

    static constraints = {
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${user.username}_quiz#${quiz.id}";
    }

    void attempt(String attempt){
        int n = attempts.size()
        double result = attempt.equalsIgnoreCase(quiz.solution) ? 1.0 : 0.0
        score = (result + score * n) / (n + 1)
        attempts.add(attempt)
    }
}

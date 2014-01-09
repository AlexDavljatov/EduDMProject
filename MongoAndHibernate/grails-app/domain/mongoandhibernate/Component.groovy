package mongoandhibernate

class Component {
    static belongsTo = Course
    static hasMany = [courses:Course]

    String name
    ComponentType type

}

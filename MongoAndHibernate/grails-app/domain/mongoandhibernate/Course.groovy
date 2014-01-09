package mongoandhibernate

class Course {
    static hasMany = [components: Component]
    String name
}

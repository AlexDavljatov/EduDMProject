package tekdays

class Sponsor {
    String name
    String website
    String description
    byte[] logo
    String toString(){
        name
    }
    static hasMany=[events:TekEvent, sponsorships: Sponsorship]
    static belongsTo=TekEvent

    static constraints = {
        name(blank:false)
        website(blank:false)
        description(nullable:true, maxSize:5000)
        logo(nullable:true, maxSize:1000000)
        sponsorships(nullable:true)
    }
}

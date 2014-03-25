import edu.dm.security.User
import org.apache.log4j.Logger
import org.apache.shiro.crypto.hash.Sha256Hash;




class BootStrap {


    def init = { servletContext ->
        def user =
            new User(username: "user123", passwordHash: new Sha256Hash("password").toHex(),
                    firstName: "aaa", lastName: "bbb", email: "aa@aa.aa")
        user.addToPermissions("*:*")
        try {
            user.save flush: true
        } catch (Exception e) {
            println(e.getMessage())
        }
        println(user)
    }
    def destroy = {
    }
}

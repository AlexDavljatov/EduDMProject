import edu.User
import org.apache.shiro.crypto.hash.Sha256Hash

class BootStrap {

    def init = { servletContext ->
        def user = new User(username: "user123", passwordHash: new Sha256Hash("password").toHex(), email: "aaa")
        user.addToPermissions("*:*")
        user.save()
    }
    def destroy = {
    }
}

import org.apache.shiro.crypto.hash.Sha256Hash;

import edu.dm.security.ShiroUser;



class BootStrap {

    def init = { servletContext ->
        def user =
            new ShiroUser(username: "user123", passwordHash: new Sha256Hash("password").toHex(), firstName: "aaa", lastName: "bbb", email: "aa@aa.aa")
        user.addToPermissions("*:*")
        user.save()
    }
    def destroy = {
    }
}

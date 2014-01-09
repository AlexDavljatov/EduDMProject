import org.apache.shiro.crypto.hash.Sha256Hash

class BootStrap {

    def init = { servletContext ->
        def user = new ShiroUser(username: "user", passwordHash: new Sha256Hash("password").toHex())
        user.addToPermissions("*:*")
        user.save()

        def user1 = new ShiroUser(username: "user1", passwordHash: new Sha256Hash("password").toHex())
        user1.addToPermissions("book:show, create, save")
        user1.save()

        def user2 = new ShiroUser(username: "user2", passwordHash: new Sha256Hash("password").toHex())
        user2.addToPermissions("book:show")
        user2.save()

    }
    def destroy = {
    }
}

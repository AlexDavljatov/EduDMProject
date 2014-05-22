import edu.dm.course.Course
import edu.dm.course.component.quiz.Quiz
import edu.dm.course.lecture.Lecture
import edu.dm.party.Party
import edu.dm.score.user.course.UserCourseScore
import edu.dm.score.user.quiz.UserQuizScore
import edu.dm.security.Role
import edu.dm.security.User
import org.apache.shiro.crypto.hash.Sha256Hash;




class BootStrap {


	def init = { servletContext ->
		def anonymRole = new Role(name: "anonym")
		anonymRole.addToPermissions("course:index,list,show")
		anonymRole.addToPermissions("component:index,list,show")
		anonymRole.addToPermissions("course:index,list,show")
		anonymRole.addToPermissions("lecture:index,list,show")
		anonymRole.addToPermissions("material:index,list,show")
		anonymRole.addToPermissions("quiz:index,list,show")
		anonymRole.addToPermissions("score:*")
		anonymRole.addToPermissions("signUp:*")
		anonymRole.addToPermissions("uploader:*")
		anonymRole.addToPermissions("auth:*")
		anonymRole.addToPermissions("home:*")
		


		def adminRole = new Role(name: "admin")
		adminRole.addToPermissions("*:*")
		adminRole.save()

		def mentorRole = new Role(name: "mentor")
		mentorRole.addToPermissions("course:*")
		mentorRole.addToPermissions("quiz:*")
		mentorRole.addToPermissions("material:*")
		mentorRole.addToPermissions("user:index,list,show")
		mentorRole.save()


		def studentRole = new Role(name: "student")
		studentRole.save()

		def admin = new User(username: "administrator", passwordHash: new Sha256Hash("password").toHex(),
		firstName: "administrator", lastName: "administrator", email: "admin@aa.aa")
		admin.addToRoles(adminRole)
		admin.save flush: true

		def mentor = new User(username: "mentor", passwordHash: new Sha256Hash("password").toHex(),
		firstName: "mentor", lastName: "mentor", email: "mentor@aa.aa")
		mentor.addToRoles(anonymRole)
		mentor.addToRoles(mentorRole)
		mentor.save flush: true

		for (i in 1..10) {
			def user = new User(username: "user_${i}", passwordHash: new Sha256Hash("password").toHex(),
			firstName: "aaa${i}", lastName: "bbb${i}", email: "aa${i}@aa.aa")
			user.addToRoles(studentRole)
			user.addToRoles(anonymRole)
			user.save flush: true
		}

		for (i in 1..10) {
			def quiz = new Quiz(name: "quiz${i}", description: 'quiz', problem: '2+2=?', solution: '4')
			quiz.save flush: true
		}

		//        def lecture = new Lecture(name: 'Test', quizes: Quiz.findAllByIdNotInList([1L, 3L, 5L, 7L, 9L]))
		def lecture = new Lecture(name: 'Test', quizes: Quiz.findAll())
		lecture.save flush: true
		//        def lecture1 = new Lecture(name: 'Test', quizes: Quiz.findAllByIdNotInList([0L, 2L, 4L, 6L, 8L, 10L]))
		//        lecture1.save flush: true
		for (i in 1..10) {
			def course
			course = new Course(name: "Test${i}", description: 'do math', lectures: [lecture])
			course.participants = []
			course.save flush: true
		}

		for (def u : User.findAll()) {
			for (def q : Quiz.findAll()) {
				def uq = new UserQuizScore(user: u, quiz: q)
				uq.save flush: true
				if (u.id % 2 == 1 && q.id % 2 == 1) {
					uq.attempt('4')
				} else {
					uq.attempt('4')
					uq.attempt('5')
					uq.attempt('5')
					uq.attempt('5')
				}
				uq.save flush: true
			}
		}
		for (def u : User.findAll()) {
			for (def c : Course.findAll()) {
				if (u.id * c.id <= 4) continue
					def uc = new UserCourseScore(user: u, course: c, finalScore: 5, score: 5)
				uc.save flush: true
			}
		}
		for (def c : Course.findAll()) {
			for (def u : User.findAll()) {
				if (u.id * c.id <= 4) continue
					def p = new Party(user: u, course: c)
				p.save flush: true
				c.participants.add(p)
			}
			c.save flush: true
		}

	}
	def destroy = {
	}
}

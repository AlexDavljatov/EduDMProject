package edu.dm.score.user.quiz



import grails.test.mixin.*
import spock.lang.*

@TestFor(UserQuizScoreController)
@Mock(UserQuizScore)
class UserQuizScoreControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.userQuizScoreInstanceList
            model.userQuizScoreInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.userQuizScoreInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def userQuizScore = new UserQuizScore()
            userQuizScore.validate()
            controller.save(userQuizScore)

        then:"The create view is rendered again with the correct model"
            model.userQuizScoreInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            userQuizScore = new UserQuizScore(params)

            controller.save(userQuizScore)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/userQuizScore/show/1'
            controller.flash.message != null
            UserQuizScore.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def userQuizScore = new UserQuizScore(params)
            controller.show(userQuizScore)

        then:"A model is populated containing the domain instance"
            model.userQuizScoreInstance == userQuizScore
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def userQuizScore = new UserQuizScore(params)
            controller.edit(userQuizScore)

        then:"A model is populated containing the domain instance"
            model.userQuizScoreInstance == userQuizScore
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/userQuizScore/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def userQuizScore = new UserQuizScore()
            userQuizScore.validate()
            controller.update(userQuizScore)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.userQuizScoreInstance == userQuizScore

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            userQuizScore = new UserQuizScore(params).save(flush: true)
            controller.update(userQuizScore)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/userQuizScore/show/$userQuizScore.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/userQuizScore/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def userQuizScore = new UserQuizScore(params).save(flush: true)

        then:"It exists"
            UserQuizScore.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(userQuizScore)

        then:"The instance is deleted"
            UserQuizScore.count() == 0
            response.redirectedUrl == '/userQuizScore/index'
            flash.message != null
    }
}

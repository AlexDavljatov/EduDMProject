<%@ page import="edu.dm.course.component.quiz.Quiz" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<section id="show-quiz" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="quiz.name.label" default="Name"/></td>

            <td valign="top" class="value">${fieldValue(bean: quizInstance, field: "name")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="quiz.description.label" default="Description"/></td>

            <td valign="top" class="value">${fieldValue(bean: quizInstance, field: "description")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="quiz.author.label" default="Author"/></td>

            <td valign="top" class="value"><g:link controller="user" action="show"
                                                   id="${quizInstance?.author?.id}">${quizInstance?.author?.encodeAsHTML()}</g:link></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="quiz.problem.label" default="Problem"/></td>

            <td valign="top" class="value">${fieldValue(bean: quizInstance, field: "problem")}</td>

        </tr>
        %{--

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="quiz.solution.label" default="Solution" /></td>

                        <td valign="top" class="value">${fieldValue(bean: quizInstance, field: "solution")}</td>

                    </tr>
        --}%
        <tr class="prop">
            <g:form controller="user" action="submitSolution">
                <td valign="top" class="name"><g:message code="quiz.solution.label" default="Solution?"/></td>
                <td valign="top" style="text-align: left;" class="value">
                    <input type="text" name="attempt" value=""/>
                    <input type="hidden" name="quiz_id" value="${fieldValue(bean: quizInstance, field: "id")}"/>
                </td>
                <td>
                    <div class="form-actions margin-top-medium">
                        <g:submitButton name="create" class="btn btn-primary"
                                        value="${message(code: 'default.button.enroll.label', default: 'Submit solution')}"/>

                    </div>
                </td>
            </g:form>

        </tr>

        </tbody>
    </table>
</section>

</body>

</html>

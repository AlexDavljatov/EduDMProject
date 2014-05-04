<%@ page import="edu.dm.security.User" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<section id="show-user" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.username.label" default="Username"/></td>

            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.email.label" default="Email"/></td>

            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.firstName.label" default="First Name"/></td>

            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "firstName")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.lastName.label" default="Last Name"/></td>

            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "lastName")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.passwordHash.label" default="Password Hash"/></td>

            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "passwordHash")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.aboutMe.label" default="About Me"/></td>

            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "aboutMe")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.courses.label" default="Courses"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userInstance.courses}" var="c">
                        <li><g:link controller="course" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.myCourses.label" default="My Courses"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userInstance.myCourses}" var="m">
                        <li><g:link controller="course" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.myLectures.label" default="My Lectures"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userInstance.myLectures}" var="m">
                        <li><g:link controller="lecture" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.myMaterilas.label" default="My Materilas"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userInstance.myMaterilas}" var="m">
                        <li><g:link controller="material" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.myQuizes.label" default="My Quizes"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userInstance.myQuizes}" var="m">
                        <li><g:link controller="quiz" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.permissions.label" default="Permissions"/></td>

            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "permissions")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.roles.label" default="Roles"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userInstance.roles}" var="r">
                        <li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.userCourseScores.label"
                                                     default="User Course Scores"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userInstance.userCourseScores}" var="u">
                        <li><g:link controller="userCourseScore" action="show"
                                    id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.userMaterialScores.label"
                                                     default="User Material Scores"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userInstance.userMaterialScores}" var="u">
                        <li><g:link controller="userMaterialScore" action="show"
                                    id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.userQuizScores.label" default="User Quiz Scores"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userInstance.userQuizScores}" var="u">
                        <li><g:link controller="userQuizScore" action="show"
                                    id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        </tbody>
    </table>
    <g:form controller="user" action="refresh">
        <div class="form-actions margin-top-medium">
            <g:submitButton name="create" class="btn btn-primary"
                            value="${message(code: 'default.button.enroll.label', default: 'Refresh results')}"/>

        </div>
    </g:form>

    <g:form controller="user" action="recommendedCourses">
        <div class="form-actions margin-top-medium">
            <g:submitButton name="create" class="btn btn-primary"
                            value="${message(code: 'default.button.enroll.label', default: 'Get recommendations')}"/>

        </div>
    </g:form>

</section>

</body>

</html>

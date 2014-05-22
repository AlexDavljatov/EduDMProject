
<%@ page import="edu.dm.course.Course" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-course" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="course.name.label" default="Name" /></td>

            <td valign="top" class="value">${course.name}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="course.description.label" default="Description" /></td>

            <td valign="top" class="value">${course.description}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="course.categories.label" default="Categories" /></td>

            <td valign="top" class="value">${course.categories}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="course.author.label" default="Author" /></td>

            <td valign="top" class="value"><g:link controller="user" action="show" id="${course?.author?.encodeAsHTML()}">${course?.author?.getUsername()}</g:link></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="course.lectures.label" default="Lectures" /></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${course.lectures}" var="l">
                        <li><g:link controller="lecture" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="course.author.label" default="Final Score" /></td>

            <td valign="top" class="value">${fscore}</td>

        </tr>
        <tr class="prop">
            <td valign="top" class="name"><g:message code="course.author.label" default="Predicted Score" /></td>

            <td valign="top" class="value">${score}</td>

        </tr>
        </tbody>
    </table>
</section>

</body>

</html>

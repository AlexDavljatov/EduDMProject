
<%@ page import="edu.dm.course.Course" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-course" class="first">

    <table class="table table-bordered margin-top-medium">
        <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'course.name.label', default: 'Name')}" />

            <g:sortableColumn property="description" title="${message(code: 'course.description.label', default: 'Description')}" />

            <th><g:message code="course.author.label" default="Author" /></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${courses}" status="i" var="courseInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" id="${courseInstance.id}">${fieldValue(bean: courseInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: courseInstance, field: "description")}</td>

                <td>${fieldValue(bean: courseInstance, field: "author")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div>
        <bs:paginate total="${courses.size()}" />
    </div>
</section>

</body>

</html>

<%@ page import="edu.dm.course.component.Component" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'component.label', default: 'Component')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<section id="show-component" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="component.name.label" default="Name"/></td>

            <td valign="top" class="value">${fieldValue(bean: componentInstance, field: "name")}</td>

        </tr>

        </tbody>
    </table>

</section>

</body>

</html>

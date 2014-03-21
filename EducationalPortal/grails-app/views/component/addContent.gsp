
<%@ page import="edu.dm.course.component.Component" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <g:set var="entityName" value="${message(code: 'component.label', default: 'Component')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-component" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="component.name.label" default="Name" /></td>
            <td valign="top" class="value">${fieldValue(bean: componentInstance, field: "name")}</td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="component.contentPath.label" default="Content Path" /></td>
            <td valign="top" class="value">${fieldValue(bean: componentInstance, field: "contentPath")}</td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="component.type.label" default="Type" /></td>
            <td valign="top" class="value">${componentInstance?.type?.encodeAsHTML()}</td>
        </tr>

        </tbody>
    </table>

    <g:uploadForm action="upload">
        <input type="file" name="myFile"/>
        <input type="hidden" name="fileName" value="${fieldValue(bean: componentInstance, field: "name")}"/>

        <div class="form-actions margin-top-medium">
            <g:submitButton name="create" class="btn btn-primary"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>

        </div>
    </g:uploadForm>
</section>

</body>

</html>

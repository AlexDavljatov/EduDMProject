<%@ page import="edu.dm.security.Role" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<section id="show-role" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="role.name.label" default="Name"/></td>

            <td valign="top" class="value">${fieldValue(bean: roleInstance, field: "name")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="role.permissions.label" default="Permissions"/></td>

            <td valign="top" class="value">${fieldValue(bean: roleInstance, field: "permissions")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="role.users.label" default="Users"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${roleInstance.users}" var="u">
                        <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        </tbody>
    </table>
</section>

</body>

</html>

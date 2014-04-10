
<%@ page import="edu.dm.security.User" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-user" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.username.label" default="Username" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.firstName.label" default="First Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "firstName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.lastName.label" default="Last Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "lastName")}</td>
				
			</tr>

%{--
        <tr class="prop">
				<td valign="top" class="name"><g:message code="user.myComponents.label" default="Components" /></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                <g:each in="${userInstance.myComponents}" var="c">
                    <li><g:link controller="component" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                </g:each>
                </ul>
            </td>

        </tr>
--}%
        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.myMaterials.label" default="Materials" /></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userInstance.myMaterials}" var="c">
                        <li><g:link controller="material" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="user.myQuizes.label" default="Quizes" /></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userInstance.myQuizes}" var="c">
                        <li><g:link controller="quiz" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>


        <tr class="prop">
				<td valign="top" class="name"><g:message code="user.courses.label" default="Courses" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${userInstance.courses}" var="c">
						<li><g:link controller="course" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.passwordHash.label" default="Password Hash" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "passwordHash")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.permissions.label" default="Permissions" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "permissions")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.roles.label" default="Roles" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${userInstance.roles}" var="r">
						<li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>

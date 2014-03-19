
<%@ page import="edu.dm.security.ShiroUser" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'shiroUser.label', default: 'ShiroUser')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-shiroUser" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroUser.username.label" default="Username" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shiroUserInstance, field: "username")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroUser.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shiroUserInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroUser.firstName.label" default="First Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shiroUserInstance, field: "firstName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroUser.lastName.label" default="Last Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shiroUserInstance, field: "lastName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroUser.components.label" default="Components" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${shiroUserInstance.components}" var="c">
						<li><g:link controller="component" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroUser.courses.label" default="Courses" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${shiroUserInstance.courses}" var="c">
						<li><g:link controller="course" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroUser.passwordHash.label" default="Password Hash" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shiroUserInstance, field: "passwordHash")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroUser.permissions.label" default="Permissions" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shiroUserInstance, field: "permissions")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroUser.roles.label" default="Roles" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${shiroUserInstance.roles}" var="r">
						<li><g:link controller="shiroRole" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>

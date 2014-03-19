
<%@ page import="edu.dm.security.ShiroRole" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'shiroRole.label', default: 'ShiroRole')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-shiroRole" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroRole.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shiroRoleInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroRole.permissions.label" default="Permissions" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shiroRoleInstance, field: "permissions")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shiroRole.users.label" default="Users" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${shiroRoleInstance.users}" var="u">
						<li><g:link controller="shiroUser" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>

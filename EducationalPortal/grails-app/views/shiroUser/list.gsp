
<%@ page import="edu.dm.security.ShiroUser" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'shiroUser.label', default: 'ShiroUser')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-shiroUser" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="username" title="${message(code: 'shiroUser.username.label', default: 'Username')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'shiroUser.email.label', default: 'Email')}" />
			
				<g:sortableColumn property="firstName" title="${message(code: 'shiroUser.firstName.label', default: 'First Name')}" />
			
				<g:sortableColumn property="lastName" title="${message(code: 'shiroUser.lastName.label', default: 'Last Name')}" />
			
				<g:sortableColumn property="passwordHash" title="${message(code: 'shiroUser.passwordHash.label', default: 'Password Hash')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${shiroUserInstanceList}" status="i" var="shiroUserInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${shiroUserInstance.id}">${fieldValue(bean: shiroUserInstance, field: "username")}</g:link></td>
			
				<td>${fieldValue(bean: shiroUserInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: shiroUserInstance, field: "firstName")}</td>
			
				<td>${fieldValue(bean: shiroUserInstance, field: "lastName")}</td>
			
				<td>${fieldValue(bean: shiroUserInstance, field: "passwordHash")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${shiroUserInstanceCount}" />
	</div>
</section>

</body>

</html>

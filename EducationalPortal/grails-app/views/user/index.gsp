
<%@ page import="edu.dm.security.User" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-user" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />
			
				<g:sortableColumn property="firstName" title="${message(code: 'user.firstName.label', default: 'First Name')}" />
			
				<g:sortableColumn property="lastName" title="${message(code: 'user.lastName.label', default: 'Last Name')}" />
			
				<g:sortableColumn property="passwordHash" title="${message(code: 'user.passwordHash.label', default: 'Password Hash')}" />
			
				<g:sortableColumn property="aboutMe" title="${message(code: 'user.aboutMe.label', default: 'About Me')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${userInstanceList}" status="i" var="userInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
			
				<td>${fieldValue(bean: userInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: userInstance, field: "firstName")}</td>
			
				<td>${fieldValue(bean: userInstance, field: "lastName")}</td>
			
				<td>${fieldValue(bean: userInstance, field: "passwordHash")}</td>
			
				<td>${fieldValue(bean: userInstance, field: "aboutMe")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${userInstanceCount}" />
	</div>
</section>

</body>

</html>

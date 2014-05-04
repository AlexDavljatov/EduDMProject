
<%@ page import="edu.dm.score.user.quiz.UserQuizScore" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userQuizScore.label', default: 'UserQuizScore')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-userQuizScore" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userQuizScore.attempts.label" default="Attempts" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userQuizScoreInstance, field: "attempts")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userQuizScore.quiz.label" default="Quiz" /></td>
				
				<td valign="top" class="value"><g:link controller="quiz" action="show" id="${userQuizScoreInstance?.quiz?.id}">${userQuizScoreInstance?.quiz?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userQuizScore.score.label" default="Score" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userQuizScoreInstance, field: "score")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userQuizScore.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${userQuizScoreInstance?.user?.id}">${userQuizScoreInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>

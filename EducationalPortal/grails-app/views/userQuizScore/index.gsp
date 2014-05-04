
<%@ page import="edu.dm.score.user.quiz.UserQuizScore" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userQuizScore.label', default: 'UserQuizScore')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-userQuizScore" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="userQuizScore.quiz.label" default="Quiz" /></th>
			
				<g:sortableColumn property="score" title="${message(code: 'userQuizScore.score.label', default: 'Score')}" />
			
				<th><g:message code="userQuizScore.user.label" default="User" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${userQuizScoreInstanceList}" status="i" var="userQuizScoreInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${userQuizScoreInstance.id}">${fieldValue(bean: userQuizScoreInstance, field: "quiz")}</g:link></td>
			
				<td>${fieldValue(bean: userQuizScoreInstance, field: "score")}</td>
			
				<td>${fieldValue(bean: userQuizScoreInstance, field: "user")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${userQuizScoreInstanceCount}" />
	</div>
</section>

</body>

</html>

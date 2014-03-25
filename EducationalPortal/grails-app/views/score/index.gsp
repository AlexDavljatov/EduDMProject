
<%@ page import="edu.dm.score.Score" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'score.label', default: 'Score')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-score" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="score.quiz.label" default="Quiz" /></th>
			
				<th><g:message code="score.user.label" default="User" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${scoreInstanceList}" status="i" var="scoreInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${scoreInstance.id}">${fieldValue(bean: scoreInstance, field: "quiz")}</g:link></td>
			
				<td>${fieldValue(bean: scoreInstance, field: "user")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${scoreInstanceCount}" />
	</div>
</section>

</body>

</html>

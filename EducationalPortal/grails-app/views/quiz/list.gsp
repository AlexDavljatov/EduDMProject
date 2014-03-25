
<%@ page import="edu.dm.course.component.quiz.Quiz" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-quiz" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'quiz.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'quiz.description.label', default: 'Description')}" />
			
				<th><g:message code="quiz.author.label" default="Author" /></th>
			
				<g:sortableColumn property="problem" title="${message(code: 'quiz.problem.label', default: 'Problem')}" />
			
				<g:sortableColumn property="solution" title="${message(code: 'quiz.solution.label', default: 'Solution')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${quizInstanceList}" status="i" var="quizInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${quizInstance.id}">${fieldValue(bean: quizInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: quizInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: quizInstance, field: "author")}</td>
			
				<td>${fieldValue(bean: quizInstance, field: "problem")}</td>
			
				<td>${fieldValue(bean: quizInstance, field: "solution")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${quizInstanceCount}" />
	</div>
</section>

</body>

</html>

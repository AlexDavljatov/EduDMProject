
<%@ page import="edu.dm.score.user.course.UserCourseScore" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userCourseScore.label', default: 'UserCourseScore')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-userCourseScore" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="userCourseScore.course.label" default="Course" /></th>
			
				<g:sortableColumn property="finalScore" title="${message(code: 'userCourseScore.finalScore.label', default: 'Final Score')}" />
			
				<g:sortableColumn property="score" title="${message(code: 'userCourseScore.score.label', default: 'Score')}" />
			
				<th><g:message code="userCourseScore.user.label" default="User" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${userCourseScoreInstanceList}" status="i" var="userCourseScoreInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${userCourseScoreInstance.id}">${fieldValue(bean: userCourseScoreInstance, field: "course")}</g:link></td>
			
				<td>${fieldValue(bean: userCourseScoreInstance, field: "finalScore")}</td>
			
				<td>${fieldValue(bean: userCourseScoreInstance, field: "score")}</td>
			
				<td>${fieldValue(bean: userCourseScoreInstance, field: "user")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${userCourseScoreInstanceCount}" />
	</div>
</section>

</body>

</html>

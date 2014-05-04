
<%@ page import="edu.dm.score.user.course.UserCourseScore" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userCourseScore.label', default: 'UserCourseScore')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-userCourseScore" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userCourseScore.course.label" default="Course" /></td>
				
				<td valign="top" class="value"><g:link controller="course" action="show" id="${userCourseScoreInstance?.course?.id}">${userCourseScoreInstance?.course?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userCourseScore.finalScore.label" default="Final Score" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userCourseScoreInstance, field: "finalScore")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userCourseScore.score.label" default="Score" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userCourseScoreInstance, field: "score")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userCourseScore.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${userCourseScoreInstance?.user?.id}">${userCourseScoreInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
		</tbody>
	</table>
</section>

</body>

</html>

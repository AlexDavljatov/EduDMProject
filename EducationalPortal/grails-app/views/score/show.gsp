
<%@ page import="edu.dm.score.Score" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'score.label', default: 'Score')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-score" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="score.quiz.label" default="Quiz" /></td>
				
				<td valign="top" class="value"><g:link controller="quiz" action="show" id="${scoreInstance?.quiz?.id}">${scoreInstance?.quiz?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="score.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${scoreInstance?.user?.id}">${scoreInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="score.attempts.label" default="Attempts" /></td>

                <td valign="top" class="value">${fieldValue(bean: scoreInstance, field: "attempts")}</td>

            </tr>

		</tbody>
	</table>
</section>

</body>

</html>

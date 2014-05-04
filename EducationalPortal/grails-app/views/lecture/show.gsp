
<%@ page import="edu.dm.course.lecture.Lecture" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'lecture.label', default: 'Lecture')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-lecture" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="lecture.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: lectureInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="lecture.topics.label" default="Topics" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: lectureInstance, field: "topics")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="lecture.author.label" default="Author" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${lectureInstance?.author?.id}">${lectureInstance?.author?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="lecture.materials.label" default="Materials" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${lectureInstance.materials}" var="m">
						<li><g:link controller="material" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="lecture.quizes.label" default="Quizes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${lectureInstance.quizes}" var="q">
						<li><g:link controller="quiz" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>

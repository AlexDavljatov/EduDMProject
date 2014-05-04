
<%@ page import="edu.dm.course.lecture.Lecture" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'lecture.label', default: 'Lecture')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-lecture" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'lecture.name.label', default: 'Name')}" />
			
				<th><g:message code="lecture.author.label" default="Author" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${lectureInstanceList}" status="i" var="lectureInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${lectureInstance.id}">${fieldValue(bean: lectureInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: lectureInstance, field: "author")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${lectureInstanceCount}" />
	</div>
</section>

</body>

</html>

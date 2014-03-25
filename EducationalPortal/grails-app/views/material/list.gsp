
<%@ page import="edu.dm.course.component.material.Material" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'material.label', default: 'Material')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-material" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'material.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'material.description.label', default: 'Description')}" />
			
				<th><g:message code="material.author.label" default="Author" /></th>
			
				<g:sortableColumn property="contentPath" title="${message(code: 'material.contentPath.label', default: 'Content Path')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${materialInstanceList}" status="i" var="materialInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${materialInstance.id}">${fieldValue(bean: materialInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: materialInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: materialInstance, field: "author")}</td>
			
				<td>${fieldValue(bean: materialInstance, field: "contentPath")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${materialInstanceCount}" />
	</div>
</section>

</body>

</html>

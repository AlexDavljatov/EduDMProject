
<%@ page import="edu.dm.course.component.Component" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'component.label', default: 'Component')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-component" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'component.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="contentPath" title="${message(code: 'component.contentPath.label', default: 'Content Path')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'component.type.label', default: 'Type')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${componentInstanceList}" status="i" var="componentInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${componentInstance.id}">${fieldValue(bean: componentInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: componentInstance, field: "contentPath")}</td>
			
				<td>${fieldValue(bean: componentInstance, field: "type")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${componentInstanceCount}" />
	</div>
</section>

</body>

</html>

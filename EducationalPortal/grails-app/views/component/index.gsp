
<%@ page import="edu.dm.course.component.Component" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'component.label', default: 'Component')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-component" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'component.name.label', default: 'Name')}" />
			

			</tr>
		</thead>
		<tbody>
		<g:each in="${componentInstanceList}" status="i" var="componentInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${componentInstance.id}">${fieldValue(bean: componentInstance, field: "name")}</g:link></td>
			
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

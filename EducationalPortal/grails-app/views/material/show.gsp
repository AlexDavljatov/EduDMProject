
<%@ page import="edu.dm.course.component.material.Material" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'material.label', default: 'Material')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-material" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="material.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: materialInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="material.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: materialInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="material.author.label" default="Author" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${materialInstance?.author?.id}">${materialInstance?.author?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="material.contentPath.label" default="Content Path" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: materialInstance, field: "contentPath")}</td>
				
			</tr>
		

		</tbody>
	</table>

    <g:uploadForm controller="material" action="upload">
        <input type="file" name="myFile"/>
        <input type="hidden" name="comp_id" value="${fieldValue(bean: materialInstance, field: "id")}"/>

        <div class="form-actions margin-top-medium">
            <g:submitButton name="create" class="btn btn-primary"
                            value="${message(code: 'default.button.create.label', default: 'Upload content')}"/>

        </div>
    </g:uploadForm>

</section>


</body>

</html>

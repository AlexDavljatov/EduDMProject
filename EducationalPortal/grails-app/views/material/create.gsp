<%@ page import="edu.dm.course.component.material.Material"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'material.label', default: 'Material')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>

<body>

	<section id="create-material" class="first">

		<g:hasErrors bean="${materialInstance}">
			<div class="alert alert-danger">
				<g:renderErrors bean="${materialInstance}" as="list" />
			</div>
		</g:hasErrors>


		<g:form action="save" class="form-horizontal" role="form">
			<g:render template="form" />

			<div
				class="${hasErrors(bean: materialInstance, field: 'videoId', 'error')} ">
				<label for="videoId" class="control-label"><g:message
						code="material.videoId.label" default="Video identificator" /></label>
				<div>
					<g:textField class="form-control" name="videoId"
						value="${materialInstance?.videoId}" />
					<span class="help-inline">
						${hasErrors(bean: materialInstance, field: 'videoId', 'error')}
					</span>
				</div>
			</div>

			<div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-primary"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
				<button class="btn" type="reset">
					<g:message code="default.button.reset.label" default="Reset" />
				</button>
			</div>
		</g:form>

	</section>

</body>

</html>

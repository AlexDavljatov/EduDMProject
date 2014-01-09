<%@ page import="mongoandhibernate.Component" %>



<div class="fieldcontain ${hasErrors(bean: componentInstance, field: 'courses', 'error')} ">
	<label for="courses">
		<g:message code="component.courses.label" default="Courses" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: componentInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="component.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${componentInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: componentInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="component.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${mongoandhibernate.ComponentType?.values()}" keys="${mongoandhibernate.ComponentType.values()*.name()}" required="" value="${componentInstance?.type?.name()}"/>
</div>


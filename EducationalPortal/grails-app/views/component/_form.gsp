<%@ page import="edu.dm.course.component.Component" %>



			<div class="${hasErrors(bean: componentInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="component.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${componentInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: componentInstance, field: 'name', 'error')}</span>
				</div>
			</div>


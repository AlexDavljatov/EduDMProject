<%@ page import="edu.dm.course.component.Component" %>



			<div class="${hasErrors(bean: componentInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="component.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${componentInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: componentInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: componentInstance, field: 'contentPath', 'error')} ">
				<label for="contentPath" class="control-label"><g:message code="component.contentPath.label" default="Content Path" /></label>
				<div>
					<g:textField class="form-control" name="contentPath" value="${componentInstance?.contentPath}"/>
					<span class="help-inline">${hasErrors(bean: componentInstance, field: 'contentPath', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: componentInstance, field: 'type', 'error')} required">
				<label for="type" class="control-label"><g:message code="component.type.label" default="Type" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" name="type" from="${edu.dm.course.component.ComponentType?.values()}" keys="${edu.dm.course.component.ComponentType.values()*.name()}" required="" value="${componentInstance?.type?.name()}"/>
					<span class="help-inline">${hasErrors(bean: componentInstance, field: 'type', 'error')}</span>
				</div>
			</div>


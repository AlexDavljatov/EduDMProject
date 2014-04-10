<%@ page import="edu.dm.course.component.material.Material" %>



			<div class="${hasErrors(bean: materialInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="material.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${materialInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: materialInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: materialInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="material.description.label" default="Description" /></label>
				<div>
					<g:textField class="form-control" name="description" value="${materialInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: materialInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: materialInstance, field: 'contentPath', 'error')} ">
				<label for="contentPath" class="control-label"><g:message code="material.contentPath.label" default="Content Path" /></label>
				<div>
					<g:textField class="form-control" name="contentPath" value="${materialInstance?.contentPath}"/>
					<span class="help-inline">${hasErrors(bean: materialInstance, field: 'contentPath', 'error')}</span>
				</div>
			</div>



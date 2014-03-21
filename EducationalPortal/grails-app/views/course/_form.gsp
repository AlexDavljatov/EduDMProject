<%@ page import="edu.dm.course.Course" %>



			<div class="${hasErrors(bean: courseInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="course.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="name" required="" value="${courseInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: courseInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: courseInstance, field: 'components', 'error')} ">
				<label for="components" class="control-label"><g:message code="course.components.label" default="Components" /></label>
				<div>
					<g:select class="form-control" name="components" from="${edu.dm.course.component.Component.list()}" multiple="multiple" optionKey="id" size="5" value="${courseInstance?.components*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: courseInstance, field: 'components', 'error')}</span>
				</div>
			</div>


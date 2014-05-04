<%@ page import="edu.dm.course.Course" %>



			<div class="${hasErrors(bean: courseInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="course.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="name" required="" value="${courseInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: courseInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: courseInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="course.description.label" default="Description" /></label>
				<div>
					<g:textField class="form-control" name="description" value="${courseInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: courseInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: courseInstance, field: 'categories', 'error')} ">
				<label for="categories" class="control-label"><g:message code="course.categories.label" default="Categories" /></label>
				<div>
					
					<span class="help-inline">${hasErrors(bean: courseInstance, field: 'categories', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: courseInstance, field: 'author', 'error')} required">
				<label for="author" class="control-label"><g:message code="course.author.label" default="Author" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="author" name="author.id" from="${edu.dm.security.User.list()}" optionKey="id" required="" value="${courseInstance?.author?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: courseInstance, field: 'author', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: courseInstance, field: 'lectures', 'error')} ">
				<label for="lectures" class="control-label"><g:message code="course.lectures.label" default="Lectures" /></label>
				<div>
					<g:select class="form-control" name="lectures" from="${edu.dm.course.lecture.Lecture.list()}" multiple="multiple" optionKey="id" size="5" value="${courseInstance?.lectures*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: courseInstance, field: 'lectures', 'error')}</span>
				</div>
			</div>


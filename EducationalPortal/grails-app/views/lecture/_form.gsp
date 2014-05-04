<%@ page import="edu.dm.course.lecture.Lecture" %>



			<div class="${hasErrors(bean: lectureInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="lecture.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="name" required="" value="${lectureInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: lectureInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: lectureInstance, field: 'topics', 'error')} ">
				<label for="topics" class="control-label"><g:message code="lecture.topics.label" default="Topics" /></label>
				<div>
					
					<span class="help-inline">${hasErrors(bean: lectureInstance, field: 'topics', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: lectureInstance, field: 'author', 'error')} required">
				<label for="author" class="control-label"><g:message code="lecture.author.label" default="Author" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="author" name="author.id" from="${edu.dm.security.User.list()}" optionKey="id" required="" value="${lectureInstance?.author?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: lectureInstance, field: 'author', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: lectureInstance, field: 'materials', 'error')} ">
				<label for="materials" class="control-label"><g:message code="lecture.materials.label" default="Materials" /></label>
				<div>
					<g:select class="form-control" name="materials" from="${edu.dm.course.component.material.Material.list()}" multiple="multiple" optionKey="id" size="5" value="${lectureInstance?.materials*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: lectureInstance, field: 'materials', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: lectureInstance, field: 'quizes', 'error')} ">
				<label for="quizes" class="control-label"><g:message code="lecture.quizes.label" default="Quizes" /></label>
				<div>
					<g:select class="form-control" name="quizes" from="${edu.dm.course.component.quiz.Quiz.list()}" multiple="multiple" optionKey="id" size="5" value="${lectureInstance?.quizes*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: lectureInstance, field: 'quizes', 'error')}</span>
				</div>
			</div>


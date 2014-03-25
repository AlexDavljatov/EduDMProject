<%@ page import="edu.dm.course.component.quiz.Quiz" %>



			<div class="${hasErrors(bean: quizInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="quiz.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${quizInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: quizInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: quizInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="quiz.description.label" default="Description" /></label>
				<div>
					<g:textField class="form-control" name="description" value="${quizInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: quizInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: quizInstance, field: 'author', 'error')} ">
				<label for="author" class="control-label"><g:message code="quiz.author.label" default="Author" /></label>
				<div>
					<g:select class="form-control" id="author" name="author.id" from="${edu.dm.security.User.list()}" optionKey="id" value="${quizInstance?.author?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: quizInstance, field: 'author', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: quizInstance, field: 'problem', 'error')} ">
				<label for="problem" class="control-label"><g:message code="quiz.problem.label" default="Problem" /></label>
				<div>
					<g:textField class="form-control" name="problem" value="${quizInstance?.problem}"/>
					<span class="help-inline">${hasErrors(bean: quizInstance, field: 'problem', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: quizInstance, field: 'solution', 'error')} ">
				<label for="solution" class="control-label"><g:message code="quiz.solution.label" default="Solution" /></label>
				<div>
					<g:textField class="form-control" name="solution" value="${quizInstance?.solution}"/>
					<span class="help-inline">${hasErrors(bean: quizInstance, field: 'solution', 'error')}</span>
				</div>
			</div>


<%@ page import="edu.dm.score.Score" %>



			<div class="${hasErrors(bean: scoreInstance, field: 'quiz', 'error')} required">
				<label for="quiz" class="control-label"><g:message code="score.quiz.label" default="Quiz" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="quiz" name="quiz.id" from="${edu.dm.course.component.quiz.Quiz.list()}" optionKey="id" required="" value="${scoreInstance?.quiz?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: scoreInstance, field: 'quiz', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: scoreInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="score.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="user" name="user.id" from="${edu.dm.security.User.list()}" optionKey="id" required="" value="${scoreInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: scoreInstance, field: 'user', 'error')}</span>
				</div>
			</div>


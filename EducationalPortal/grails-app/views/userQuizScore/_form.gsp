<%@ page import="edu.dm.score.user.quiz.UserQuizScore" %>



			<div class="${hasErrors(bean: userQuizScoreInstance, field: 'attempts', 'error')} ">
				<label for="attempts" class="control-label"><g:message code="userQuizScore.attempts.label" default="Attempts" /></label>
				<div>
					
					<span class="help-inline">${hasErrors(bean: userQuizScoreInstance, field: 'attempts', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userQuizScoreInstance, field: 'quiz', 'error')} required">
				<label for="quiz" class="control-label"><g:message code="userQuizScore.quiz.label" default="Quiz" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="quiz" name="quiz.id" from="${edu.dm.course.component.quiz.Quiz.list()}" optionKey="id" required="" value="${userQuizScoreInstance?.quiz?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userQuizScoreInstance, field: 'quiz', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userQuizScoreInstance, field: 'score', 'error')} required">
				<label for="score" class="control-label"><g:message code="userQuizScore.score.label" default="Score" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="score" value="${fieldValue(bean: userQuizScoreInstance, field: 'score')}" required=""/>
					<span class="help-inline">${hasErrors(bean: userQuizScoreInstance, field: 'score', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userQuizScoreInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="userQuizScore.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="user" name="user.id" from="${edu.dm.security.User.list()}" optionKey="id" required="" value="${userQuizScoreInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userQuizScoreInstance, field: 'user', 'error')}</span>
				</div>
			</div>


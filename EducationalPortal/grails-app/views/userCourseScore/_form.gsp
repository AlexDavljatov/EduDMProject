<%@ page import="edu.dm.score.user.course.UserCourseScore" %>



			<div class="${hasErrors(bean: userCourseScoreInstance, field: 'course', 'error')} required">
				<label for="course" class="control-label"><g:message code="userCourseScore.course.label" default="Course" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="course" name="course.id" from="${edu.dm.course.Course.list()}" optionKey="id" required="" value="${userCourseScoreInstance?.course?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userCourseScoreInstance, field: 'course', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userCourseScoreInstance, field: 'finalScore', 'error')} required">
				<label for="finalScore" class="control-label"><g:message code="userCourseScore.finalScore.label" default="Final Score" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="finalScore" value="${fieldValue(bean: userCourseScoreInstance, field: 'finalScore')}" required=""/>
					<span class="help-inline">${hasErrors(bean: userCourseScoreInstance, field: 'finalScore', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userCourseScoreInstance, field: 'score', 'error')} required">
				<label for="score" class="control-label"><g:message code="userCourseScore.score.label" default="Score" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="score" value="${fieldValue(bean: userCourseScoreInstance, field: 'score')}" required=""/>
					<span class="help-inline">${hasErrors(bean: userCourseScoreInstance, field: 'score', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userCourseScoreInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="userCourseScore.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="user" name="user.id" from="${edu.dm.security.User.list()}" optionKey="id" required="" value="${userCourseScoreInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userCourseScoreInstance, field: 'user', 'error')}</span>
				</div>
			</div>


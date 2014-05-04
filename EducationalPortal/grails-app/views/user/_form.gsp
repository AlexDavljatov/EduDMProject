<%@ page import="edu.dm.security.User" %>



			<div class="${hasErrors(bean: userInstance, field: 'username', 'error')} required">
				<label for="username" class="control-label"><g:message code="user.username.label" default="Username" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="username" maxlength="18" required="" value="${userInstance?.username}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'username', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'email', 'error')} required">
				<label for="email" class="control-label"><g:message code="user.email.label" default="Email" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="email" name="email" required="" value="${userInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
				<label for="firstName" class="control-label"><g:message code="user.firstName.label" default="First Name" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="firstName" required="" value="${userInstance?.firstName}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'firstName', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
				<label for="lastName" class="control-label"><g:message code="user.lastName.label" default="Last Name" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="lastName" required="" value="${userInstance?.lastName}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'lastName', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'passwordHash', 'error')} required">
				<label for="passwordHash" class="control-label"><g:message code="user.passwordHash.label" default="Password Hash" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="passwordHash" required="" value="${userInstance?.passwordHash}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'passwordHash', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'aboutMe', 'error')} ">
				<label for="aboutMe" class="control-label"><g:message code="user.aboutMe.label" default="About Me" /></label>
				<div>
					<g:textField class="form-control" name="aboutMe" value="${userInstance?.aboutMe}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'aboutMe', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'courses', 'error')} ">
				<label for="courses" class="control-label"><g:message code="user.courses.label" default="Courses" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${userInstance?.courses?}" var="c">
    <li><g:link controller="course" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="course" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'course.label', default: 'Course')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'courses', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'myCourses', 'error')} ">
				<label for="myCourses" class="control-label"><g:message code="user.myCourses.label" default="My Courses" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${userInstance?.myCourses?}" var="m">
    <li><g:link controller="course" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="course" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'course.label', default: 'Course')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'myCourses', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'myLectures', 'error')} ">
				<label for="myLectures" class="control-label"><g:message code="user.myLectures.label" default="My Lectures" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${userInstance?.myLectures?}" var="m">
    <li><g:link controller="lecture" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="lecture" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'lecture.label', default: 'Lecture')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'myLectures', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'myMaterilas', 'error')} ">
				<label for="myMaterilas" class="control-label"><g:message code="user.myMaterilas.label" default="My Materilas" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${userInstance?.myMaterilas?}" var="m">
    <li><g:link controller="material" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="material" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'material.label', default: 'Material')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'myMaterilas', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'myQuizes', 'error')} ">
				<label for="myQuizes" class="control-label"><g:message code="user.myQuizes.label" default="My Quizes" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${userInstance?.myQuizes?}" var="m">
    <li><g:link controller="quiz" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="quiz" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'quiz.label', default: 'Quiz')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'myQuizes', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'permissions', 'error')} ">
				<label for="permissions" class="control-label"><g:message code="user.permissions.label" default="Permissions" /></label>
				<div>
					
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'permissions', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'roles', 'error')} ">
				<label for="roles" class="control-label"><g:message code="user.roles.label" default="Roles" /></label>
				<div>
					<g:select class="form-control" name="roles" from="${edu.dm.security.Role.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.roles*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'roles', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'userCourseScores', 'error')} ">
				<label for="userCourseScores" class="control-label"><g:message code="user.userCourseScores.label" default="User Course Scores" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${userInstance?.userCourseScores?}" var="u">
    <li><g:link controller="userCourseScore" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userCourseScore" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userCourseScore.label', default: 'UserCourseScore')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'userCourseScores', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'userMaterialScores', 'error')} ">
				<label for="userMaterialScores" class="control-label"><g:message code="user.userMaterialScores.label" default="User Material Scores" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${userInstance?.userMaterialScores?}" var="u">
    <li><g:link controller="userMaterialScore" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userMaterialScore" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userMaterialScore.label', default: 'UserMaterialScore')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'userMaterialScores', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'userQuizScores', 'error')} ">
				<label for="userQuizScores" class="control-label"><g:message code="user.userQuizScores.label" default="User Quiz Scores" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${userInstance?.userQuizScores?}" var="u">
    <li><g:link controller="userQuizScore" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userQuizScore" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userQuizScore.label', default: 'UserQuizScore')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'userQuizScores', 'error')}</span>
				</div>
			</div>


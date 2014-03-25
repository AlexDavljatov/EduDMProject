<%@ page import="edu.dm.security.User" %>
			<div class="${hasErrors(bean: userInstance, field: 'username', 'error')} required">
				<label for="username" class="control-label"><g:message code="user.username.label" default="Username" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="username" required="" value="${userInstance?.username}"/>
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

            <div class="${hasErrors(bean: userInstance, field: 'aboutMe', 'error')} required">
                <label for="aboutMe" class="control-label"><g:message code="user.aboutMe.label" default="About me" />
                    <span class="required-indicator">*</span></label>
                <div>
                    <g:textField class="form-control" name="aboutMe" required="" value="${userInstance?.aboutMe}"/>
                    <span class="help-inline">${hasErrors(bean: userInstance, field: 'aboutMe', 'error')}</span>
                </div>
            </div>

			<div class="${hasErrors(bean: userInstance, field: 'myComponents', 'error')} ">
				<label for="myComponents" class="control-label"><g:message code="user.myComponents.label" default="Components" /></label>
				<div>
					<g:select class="form-control" name="myComponents"
                              from="${edu.dm.course.component.Component.list()}"
                              multiple="multiple" optionKey="id" size="5" value="${userInstance?.myComponents*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'myComponents', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'courses', 'error')} ">
				<label for="courses" class="control-label"><g:message code="user.courses.label" default="Courses" /></label>
				<div>
					<g:select class="form-control" name="courses" from="${edu.dm.course.Course.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.courses*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'courses', 'error')}</span>
				</div>
			</div>

            <div class="${hasErrors(bean: userInstance, field: 'myCourses', 'error')} ">
                <label for="myCourses" class="control-label"><g:message code="user.courses.label" default="Courses" /></label>
                <div>
                    <g:select class="form-control" name="myCourses" from="${edu.dm.course.Course.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.myCourses*.id}" class="many-to-many"/>
                    <span class="help-inline">${hasErrors(bean: userInstance, field: 'courses', 'error')}</span>
                </div>
            </div>

			<div class="${hasErrors(bean: userInstance, field: 'passwordHash', 'error')} ">
				<label for="passwordHash" class="control-label"><g:message code="user.passwordHash.label" default="Password" /></label>
				<div>
					<g:textField class="form-control" name="passwordHash" value="${userInstance?.passwordHash}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'passwordHash', 'error')}</span>
				</div>
			</div>

			%{--<div class="${hasErrors(bean: userInstance, field: 'permissions', 'error')} ">
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
			</div>--}%


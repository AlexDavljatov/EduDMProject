<%@ page import="edu.dm.security.ShiroUser" %>



<div class="${hasErrors(bean: shiroUserInstance, field: 'username', 'error')} required">
    <label for="username" class="control-label"><g:message code="shiroUser.username.label" default="Username"/><span
            class="required-indicator">*</span></label>

    <div>
        <g:textField class="form-control" name="username" required="" value="${shiroUserInstance?.username}"/>
        <span class="help-inline">${hasErrors(bean: shiroUserInstance, field: 'username', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: shiroUserInstance, field: 'email', 'error')} required">
    <label for="email" class="control-label"><g:message code="shiroUser.email.label" default="Email"/><span
            class="required-indicator">*</span></label>

    <div>
        <g:field class="form-control" type="email" name="email" required="" value="${shiroUserInstance?.email}"/>
        <span class="help-inline">${hasErrors(bean: shiroUserInstance, field: 'email', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: shiroUserInstance, field: 'firstName', 'error')} required">
    <label for="firstName" class="control-label"><g:message code="shiroUser.firstName.label" default="First Name"/><span
            class="required-indicator">*</span></label>

    <div>
        <g:textField class="form-control" name="firstName" required="" value="${shiroUserInstance?.firstName}"/>
        <span class="help-inline">${hasErrors(bean: shiroUserInstance, field: 'firstName', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: shiroUserInstance, field: 'lastName', 'error')} required">
    <label for="lastName" class="control-label"><g:message code="shiroUser.lastName.label" default="Last Name"/><span
            class="required-indicator">*</span></label>

    <div>
        <g:textField class="form-control" name="lastName" required="" value="${shiroUserInstance?.lastName}"/>
        <span class="help-inline">${hasErrors(bean: shiroUserInstance, field: 'lastName', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: shiroUserInstance, field: 'passwordHash', 'error')} ">
    <label for="passwordHash" class="control-label"><g:message code="shiroUser.passwordHash.label"
                                                               default="Password Hash"/></label>

    <div>
        <g:textField class="form-control" name="passwordHash" value="${shiroUserInstance?.passwordHash}"/>
        <span class="help-inline">${hasErrors(bean: shiroUserInstance, field: 'passwordHash', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: shiroUserInstance, field: 'components', 'error')} ">
    <label for="components" class="control-label"><g:message code="shiroUser.components.label"
                                                             default="Components"/></label>

    <div>
        <g:select class="form-control" name="components" from="${edu.dm.course.component.Component.list()}"
                  multiple="multiple" optionKey="id" size="5" value="${shiroUserInstance?.components*.id}"
                  class="many-to-many"/>
        <span class="help-inline">${hasErrors(bean: shiroUserInstance, field: 'components', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: shiroUserInstance, field: 'courses', 'error')} ">
    <label for="courses" class="control-label"><g:message code="shiroUser.courses.label" default="Courses"/></label>

    <div>
        <g:select class="form-control" name="courses" from="${edu.dm.course.Course.list()}" multiple="multiple"
                  optionKey="id" size="5" value="${shiroUserInstance?.courses*.id}" class="many-to-many"/>
        <span class="help-inline">${hasErrors(bean: shiroUserInstance, field: 'courses', 'error')}</span>
    </div>
</div>


<div class="${hasErrors(bean: shiroUserInstance, field: 'permissions', 'error')} ">
    <label for="permissions" class="control-label"><g:message code="shiroUser.permissions.label"
                                                              default="Permissions"/></label>

    <div>

        <span class="help-inline">${hasErrors(bean: shiroUserInstance, field: 'permissions', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: shiroUserInstance, field: 'roles', 'error')} ">
    <label for="roles" class="control-label"><g:message code="shiroUser.roles.label" default="Roles"/></label>

    <div>
        <g:select class="form-control" name="roles" from="${edu.dm.security.ShiroRole.list()}" multiple="multiple"
                  optionKey="id" size="5" value="${shiroUserInstance?.roles*.id}" class="many-to-many"/>
        <span class="help-inline">${hasErrors(bean: shiroUserInstance, field: 'roles', 'error')}</span>
    </div>
</div>


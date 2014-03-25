<%@ page import="edu.dm.security.Role" %>



<div class="${hasErrors(bean: roleInstance, field: 'name', 'error')} required">
    <label for="name" class="control-label"><g:message code="role.name.label" default="Name"/><span
            class="required-indicator">*</span></label>

    <div>
        <g:textField class="form-control" name="name" required="" value="${roleInstance?.name}"/>
        <span class="help-inline">${hasErrors(bean: roleInstance, field: 'name', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: roleInstance, field: 'permissions', 'error')} ">
    <label for="permissions" class="control-label"><g:message code="role.permissions.label"
                                                              default="Permissions"/></label>

    <div>

        <span class="help-inline">${hasErrors(bean: roleInstance, field: 'permissions', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: roleInstance, field: 'users', 'error')} ">
    <label for="users" class="control-label"><g:message code="role.users.label" default="Users"/></label>

    <div>

        <span class="help-inline">${hasErrors(bean: roleInstance, field: 'users', 'error')}</span>
    </div>
</div>


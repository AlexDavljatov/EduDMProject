<%@ page import="edu.dm.security.ShiroRole" %>



			<div class="${hasErrors(bean: shiroRoleInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="shiroRole.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="name" required="" value="${shiroRoleInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: shiroRoleInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: shiroRoleInstance, field: 'permissions', 'error')} ">
				<label for="permissions" class="control-label"><g:message code="shiroRole.permissions.label" default="Permissions" /></label>
				<div>
					
					<span class="help-inline">${hasErrors(bean: shiroRoleInstance, field: 'permissions', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: shiroRoleInstance, field: 'users', 'error')} ">
				<label for="users" class="control-label"><g:message code="shiroRole.users.label" default="Users" /></label>
				<div>
					
					<span class="help-inline">${hasErrors(bean: shiroRoleInstance, field: 'users', 'error')}</span>
				</div>
			</div>


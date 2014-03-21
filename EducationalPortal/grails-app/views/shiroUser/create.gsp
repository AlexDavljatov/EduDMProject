<%@ page import="edu.dm.security.ShiroUser" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'shiroUser.label', default: 'ShiroUser')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

	<section id="create-shiroUser" class="first">

		<g:hasErrors bean="${shiroUserInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${shiroUserInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save" class="form-horizontal" role="form" >

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


            <div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
			</div>
		</g:form>

	</section>

</body>

</html>

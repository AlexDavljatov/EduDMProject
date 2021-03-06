%{--
<%@ page import="edu.dm.security.User" %>

<div class="modal fade" id="RegisterModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
	    	<g:form controller="user" action="save" class="form-horizontal" method="post" name="register_form">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<h3><g:message code="security.register.title"/></h3>
				</div>
				<div class="modal-body">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="username">${message(code: 'security.username.label', default: 'Username')}</label>
                        <div   class="col-lg-10">
                            <input class="form-control" name="username" id="username" type="text"  value="${userInstance?.username}"  placeholder="${message(code: 'security.username.label', default: 'Username')}">
                        </div>
                    </div>
                    <div class="form-group">
						<label class="col-lg-2 control-label" for="firstName">${message(code: 'security.firstname.label', default: 'FirstName')}</label>
						<div   class="col-lg-10">
							<input class="form-control" name="firstName" id="firstName" type="text"  value="${userInstance?.firstName}"  placeholder="${message(code: 'security.firstname.label', default: 'FirstName')}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label" for="lastName">${message(code: 'security.lastname.label', default: 'LastName')}</label>
						<div   class="col-lg-10">
							<input class="form-control" name="lastName" id="lastName" type="text"  value="${userInstance?.lastName}" placeholder="${message(code: 'security.lastname.label', default: 'LastName')}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label" for="email">${message(code: 'security.email.label', default: 'Email')}</label>
						<div   class="col-lg-10">
							<input class="form-control" name="email" id="email" type="text"  value="${userInstance?.email}" placeholder="${message(code: 'security.email.label', default: 'Email')}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label" for="passwordHash">${message(code: 'security.password.label', default: 'Password')}</label>
						<div   class="col-lg-10">
							<input class="form-control" name="passwordHash" id="passwordHash" type="password"  value="${userInstance?.passwordHash}" placeholder="${message(code: 'security.password.label', default: 'Password')}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label" for="confirmpasswd">${message(code: 'security.password.confirm.label', default: 'Confirm')}</label>
						<div   class="col-lg-10">
							<input class="form-control" name="confirmpasswd" id="confirmpasswd" type="password" placeholder="${message(code: 'security.password.confirm.label', default: 'Confirm')}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-10 checkbox" for="agreement">
							<input class="col-lg-3" type="checkbox" value="" name="agreement" id="agreement" >
							${message(code: 'security.agreement.label', default: 'I have read and agree with the Terms of Use.')}
						</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">
                        <g:message code="security.register.label"/></button>
				</div>
			</g:form>
		</div>
	</div>
</div>
--}%

<div class="modal fade" id="RegisterModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <g:form controller="user" action="register" class="form-horizontal" method="post" name="register_form">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">x</button>
                    <h3><g:message code="security.register.title"/></h3>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="username">${message(code: 'security.username.label', default: 'Username')}</label>
                        <div   class="col-lg-10">
                            <input class="form-control" name="username" id="username" type="text"  value=""  placeholder="${message(code: 'security.username.label', default: 'Username')}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="firstName">${message(code: 'security.firstname.label', default: 'FirstName')}</label>
                        <div   class="col-lg-10">
                            <input class="form-control" name="firstName" id="firstName" type="text"  value=""  placeholder="${message(code: 'security.firstname.label', default: 'FirstName')}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="lastName">${message(code: 'security.lastname.label', default: 'LastName')}</label>
                        <div   class="col-lg-10">
                            <input class="form-control" name="lastName" id="lastName" type="text"  value="" placeholder="${message(code: 'security.lastname.label', default: 'LastName')}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="email">${message(code: 'security.email.label', default: 'Email')}</label>
                        <div   class="col-lg-10">
                            <input class="form-control" name="email" id="email" type="text"  value="" placeholder="${message(code: 'security.email.label', default: 'Email')}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="password">${message(code: 'security.password.label', default: 'Password')}</label>
                        <div   class="col-lg-10">
                            <input class="form-control" name="password" id="password" type="password"  value="" placeholder="${message(code: 'security.password.label', default: 'Password')}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="confirmpasswd">${message(code: 'security.password.confirm.label', default: 'Confirm')}</label>
                        <div   class="col-lg-10">
                            <input class="form-control" name="confirmpasswd" id="confirmpasswd" type="password" placeholder="${message(code: 'security.password.confirm.label', default: 'Confirm')}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-10 checkbox" for="agreement">
                            <input class="col-lg-3" type="checkbox" value="" name="agreement" id="agreement" >
                            ${message(code: 'security.agreement.label', default: 'I have read and agree with the Terms of Use.')}
                        </label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">
                        <g:message code="security.register.label"/></button>
                </div>
            </g:form>
        </div>
    </div>
</div>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="kickstart" />
  <title>Login</title>
</head>
<body>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>

<section id="login" class="first">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
        %{--    <form role="form" id='loginForm' class='form-horizontal' controller="auth" action="signIn" method='POST' autocomplete='off'>
                <div class="form-group ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">
                    <h3> <g:message code="security.login.header"/> </h3>
                </div>


                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="username">${message(code: 'security.username.label', default: 'Username')}</label>
                        <div   class="col-lg-10">
                            <input class="form-control" name="username" value="${username}" id="username" type="text" placeholder="${message(code: 'security.username.label', default: 'Username')}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="password">${message(code: 'security.password.label', default: 'Password')}</label>
                        <div   class="col-lg-10">
                            <input class="form-control" name="password" id="password" type="password" placeholder="${message(code: 'security.password.label', default: 'Password')}">
                        </div>
                    </div>


                </div>


                <div id="remember_me_holder" class="form-group">
                    <label for='remember_me' class="control-label"><g:message code="security.login.remember.me.label"/></label>
                    <div class="controls">
                        <bs:checkBox class="form-control col-md-4" name="${rememberMeParameter}" value="${rememberMe}" />
                    </div>
                </div>

                <div class="form-group">
                    <input type='submit' id="submit" class="btn btn-success" value='${message(code: "security.login.button")}'/>
                </div>
            </form>--}%
        </div>
        <div class="col-md-3"></div>
    </div>
</section>

<script type='text/javascript'>
    <!--
    (function() {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>


  %{--<g:form action="signIn">
    <input type="hidden" name="targetUri" value="${targetUri}" />
    <table>
      <tbody>
        <tr>
          <td>Username:</td>
          <td><input type="text" name="username" value="${username}" /></td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input type="password" name="password" value="" /></td>
        </tr>
        <tr>
          <td>Remember me?:</td>
          <td><g:checkBox name="rememberMe" value="${rememberMe}" /></td>
        </tr>
        <tr>
          <td />
          <td><input type="submit" value="Sign in" /></td>
        </tr>
      </tbody>
    </table>
  </g:form>--}%

%{--<div class="modal fade" id="RegisterModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <g:form controller="auth" action="signIn" class="form-horizontal" method="post" name="register_form">
                <input type="hidden" name="targetUri" value="${targetUri}" />
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">x</button>
                    <h3><g:message code="security.register.title"/></h3>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="username">${message(code: 'security.username.label', default: 'Username')}</label>
                        <div   class="col-lg-10">
                            <input class="form-control" name="username" value="${username}" id="username" type="text" placeholder="${message(code: 'security.username.label', default: 'Username')}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="password">${message(code: 'security.password.label', default: 'Password')}</label>
                        <div   class="col-lg-10">
                            <input class="form-control" name="password" id="password" type="password" placeholder="${message(code: 'security.password.label', default: 'Password')}">
                        </div>
                    </div>
                    \
                    <div class="form-group">
                        <label class="col-lg-10 checkbox" for="rememberMe">
                            <input class="col-lg-3" type="checkbox" value="${rememberMe}" name="rememberMe" id="rememberMe" >
                            ${message(code: 'security.agreement.rememberMe', default: 'Remember me?')}
                        </label>
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
</div>--}%

</body>
</html>

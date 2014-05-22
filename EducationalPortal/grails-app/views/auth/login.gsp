<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    %{--<meta name="layout" content="main" />--}%
    <meta name="layout" content="kickstart"/>

    <title>Login</title>
</head>

<body>
%{--
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
--}%

<section id="login" class="first">
    <div class="row">
        <div class="col-md-3"></div>

        <div class="col-md-6">

            <g:form action="signIn" controller="auth">
                <input type="hidden" name="targetUri" value="${targetUri}"/>

                <div class="form-group ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">

                    <label for='username' class="control-label">
                        <g:message code="springSecurity.login.username.label"/>:</label>

                    <div class="controls">
                        <input type="text" class='form-control col-md-4' name="username" id='username'
                               value="${username}"/>
                    </div>
                </div>

                <div class="form-group ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">

                    <label for='password' class="control-label"><g:message
                            code="springSecurity.login.password.label"/>:</label>

                    <div class="controls">
                        <input type="password" id="password" class='form-control col-md-4' name="password" value=""/>
                    </div>
                </div>

                <div id="remember_me_holder" class="form-group">
                    <label for='rememberMe' class="control-label"><g:message
                            code="springSecurity.login.remember.me.label"/></label>
                    %{--<g:checkBox id="rememberMe" name="rememberMe" value="${rememberMe}"/>--}%
                    <div class="controls">
                        <bs:checkBox id="rememberMe" name="rememberMe" class="form-control col-md-4"
                                     value="${rememberMe}"/>
                    </div>
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-success" value="Sign in"/>
                </div>
            </g:form>

        </div>

        <div class="col-md-3"></div>
    </div>
</section>

</body>
</html>
%{--
<html>
<head>
	<title><g:message code="springSecurity.login.title"/></title>
<meta name="layout" content="kickstart" />

</head>

<body>

<section id="login" class="first">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
--}%
%{--<form role="form" id='loginForm' class='form-horizontal' action='${postUrl}' method='POST' autocomplete='off'>--}%%{--

<g:form action="signIn" controller="auth">
    <input type="hidden" name="targetUri" value="${targetUri}" />

    <div class="form-group ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">
        <h3> <g:message code="springSecurity.login.header"/> </h3>
    </div>

    <div class="form-group ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">
        <label for='username' class="control-label"><g:message code="springSecurity.login.username.label"/>:</label>
        <div class="controls">
            --}%
%{--<input type='text' class='form-control col-md-4' name='j_username' id='username'/>--}%%{--

            <input type="text" id="username" name="username" value="${username}" />
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">
        <label for='password' class="control-label"><g:message code="springSecurity.login.password.label"/>:</label>
        <div class="controls">
            --}%
%{--<input type='password' class='form-control col-md-4' name='j_password' id='password'/>--}%%{--


            <input type="password" id="password" name="password" value="" />

        </div>
    </div>

    <div id="remember_me_holder" class="form-group">
        <label for='remember_me' class="control-label"><g:message code="springSecurity.login.remember.me.label"/></label>
        <div class="controls">
            --}%
%{--<bs:checkBox class="form-control col-md-4" name="${rememberMeParameter}" value="${hasCookie}" />--}%%{--

            <bs:checkBox id="remember_me" class="form-control col-md-4" name="rememberMe" value="${rememberMe}" />
        </div>
    </div>

    <div class="form-group">
        <input type='submit' id="submit" class="btn btn-success" value='${message(code: "springSecurity.login.button")}'/>

    </div>
    </g:form>
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

    </body>
    </html>--}%

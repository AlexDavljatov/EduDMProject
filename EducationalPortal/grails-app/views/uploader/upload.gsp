<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 17.03.14
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
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
            Upload File: <br/>
            Upload Form: <br />
            <g:uploadForm action="upload">
                <input type="file" name="myFile" />
                <input type="submit" />
            </g:uploadForm>
        </div>

        <div class="col-md-3"></div>
    </div>
</section>

</body>
</html>



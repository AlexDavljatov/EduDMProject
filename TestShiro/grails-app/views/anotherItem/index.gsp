<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 21.03.14
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>
<body>
<g:form controller="anotherItem" action="createCustom">
        <label for="name">
            <g:message code="item.name.label" default="Name"/>

        </label>
        <g:textField name="username" value="${username}"/>
        <g:textField name="password" value="${password}"/>
        <g:textField name="email" value="${password}"/>


    <fieldset class="buttons">
        <g:submitButton name="create" class="save"
                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
    </fieldset>
</g:form>
</body>
</html>
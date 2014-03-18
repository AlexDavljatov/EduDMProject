


<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 17.03.14
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>
<body>
Upload Form: <br />
<g:uploadForm action="upload" method="POST">
    <input type="file" name="myFile" />
    <input type="submit" />
</g:uploadForm>
</body>
</html>
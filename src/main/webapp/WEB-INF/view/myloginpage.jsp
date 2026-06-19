<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name='frm' action="${pageContext.request.contextPath}/login" method="post">
<input type='text' name='username' value=''/><br></br>
<input type='password' name='password' value=''/><br></br>
<input type='submit' name='s' value='login'/>
&nbsp;&nbsp;,<a href="register">Sign up</a><br></br>
</form>

</body>
</html>
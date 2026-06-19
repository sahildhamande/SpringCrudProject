<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="index.jsp" %>

<div class="container mt-5 bg-dark p-5" style="width:600px; ">  
<form name="frm" action="savecource" method="POST">
<div class="form-group m-2">
       <input type="text" name="courceName" value="" class="form-control"/>
  </div>
  
   <div class="form-group m-2">
       <input type="submit" name="s" value="Add New Cource" class="form-control"/>
  </div>
</div>
  
</body>
</html>
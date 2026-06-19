 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
    background-color:#f4f6f9;
}

.subject-form{
    width:600px;
    margin:50px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,0.15);
}

.subject-form h3{
    color:#333;
    margin-bottom:15px;
}

.subject-form .form-control{
    margin-bottom:15px;
}

.subject-form input[type="checkbox"]{
    margin-right:5px;
}

.subject-form label{
    margin-right:15px;
    color:#333;
}

.btn-submit{
    background:#0d6efd;
    color:white;
    border:none;
    padding:10px;
    border-radius:5px;
    width:100%;
}

.btn-submit:hover{
    background:#0b5ed7;
}

.msg{
    text-align:center;
    color:green;
    margin-top:15px;
}
</style>
</head>

<body>
	<%@include file="index.jsp"%>
	<div class="container mt-5 bg-dark p-5" style="width: 600px;">
		<form name="frm" action="upload" method="POST"
			enctype='multipart/form-data'>
			<div class="form-group m-2">
				<input type="text" name="name" class="form-control"  placeholder="Enter Subject Name" required/>
			</div>
			<div class="form-group m-2">
     			 <input type="file" name="img" value=""  class="form-control" />
 			</div>
 			<div class="form-group m-2">
     			 <input type="file" name="pdf" value=""  class="form-control" />
 			</div>
 			
			
			<div>
				<h3 class="text-white">Select Courses</h3>
				<c:forEach var="c" items="${courceList}">
					<input type="checkbox" name="cource" value="${c.getId()}" />
					<label class="text-white">${c.getCourceName()}</label>
				</c:forEach>
			</div>
			<div class="form-group m-2">
				<input type="submit" name="s" value="Add New Subject"
					class="form-control" />
			</div>
			<h1>${msg}</h1>
		</form>
	</div>

</body>

</html>
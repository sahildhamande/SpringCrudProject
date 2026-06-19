<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="index.jsp"%>
	<div class="container mt-5 bg-dark p-5" style="width: 600px;">
		<form name="frm" action="upload" method="POST"
			enctype='multipart/form-data'>
			<div class="form-group m-2">
				<input type="text" name="name" value=" " class="form-control" />
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
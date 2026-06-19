
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%> 
<!-- used tag library to show data on viewsubject page-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="<c:url value='/resources/js/search.js'/>"></script>
<style>
body{
    background-color:#f4f6f9;
    font-family: Arial, sans-serif;
}

.table{
    width:90%;
    margin:30px auto;
    background:white;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 4px 12px rgba(0,0,0,0.15);
    border-collapse:collapse;
}

.table th,
.table td{
    padding:15px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

.table tr:first-child{
    background:#0d6efd;
    color:white;
}

.table tr:hover{
    background:#f8f9fa;
}

.table img{
    border-radius:8px;
    border:1px solid #ddd;
}

.table a{
    text-decoration:none;
    background:#198754;
    color:white;
    padding:8px 15px;
    border-radius:5px;
    display:inline-block;
}

.table a:hover{
    background:#157347;
}

.search{
    margin-top:20px;
    text-align:center;
}

.form-control{
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:5px;
}

.not-found{
    color:red;
    text-align:center;
    padding:20px;
}
</style>

</head>
<body>

<%@include file="index.jsp" %>
<div class=search style="margin:20px; width:550px; margin:auto">
  <div class="form-group m-2">
    <!--     <input type="text" name="name" value="" class="form-control" placeholder="Search Cources" onkeyup='searchByName(this.value)'/>  -->
  </div>
</div>
  
 <table class="table table-striped">
   <tr>
  	 <th>COURCENAME</th>
  	 <th>SUBJECT NAME</th>
  	 <th>IMAGE</th>
  	 <th>DOWNLOAD SYLLABUS</th>
   </tr>
   <c:if test="${slist.isEmpty()}">
    <tr>
      <th colspan='4'><h1>subject Not Found in database</h1></th>
    </tr>
   </c:if>
   <tbody id="tbody">  
   <c:if test="${slist.size()!=0}">
   <c:forEach var="cource" items="${slist}"> 
    <tr>
   	<th>${cource[0]} </th>
  	 <th>${cource[1]}</th>
  	 <th><img src="${pageContext.request.contextPath}/img/${cource[2]}"
     width="100" height="100"></th>
  	  <th><a href="<c:url value='/doc/${cource[3]}'/>">Download Material</a></th>
   </tr>
   </c:forEach>
   </c:if>
   </tbody>
   
   
 </table>
</body>
</html>
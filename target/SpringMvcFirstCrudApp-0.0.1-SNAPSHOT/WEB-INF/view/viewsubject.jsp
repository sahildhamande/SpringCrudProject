
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
  	 <th><img src="<c:url value='/img/${cource[2]}'/>"
     width="100"
     height="100"
     alt="No Image"></th>
  	  <th><a href="<c:url value='/doc/${cource[3]}'/>">Download Material</a></th>
   </tr>
   </c:forEach>
   </c:if>
   </tbody>
   
   
 </table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- used tag library to show data on viewcource page-->
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
       <input type="text" name="name" value="" class="form-control" placeholder="Search Cources" onkeyup='searchByName(this.value)'/>
  </div>
</div>
  
 <table class="table table-striped">
   <tr>
   	<th>SRNO</th>
  	 <th>COURCENAME</th>
  	 <th>DELETE</th>
  	 <th>UPDATE</th>
   </tr>
   <c:if test="${courceList.isEmpty()}">
    <tr>
      <th colspan='4'><h1>Cource Not Found in database</h1></th>
    </tr>
   </c:if>
   <tbody id="tbody">  
   <c:if test="${courceList.size()!=0}">
   <c:forEach var="cource" items="${courceList}"> 
    <tr>
   	<th>${cource.getId()} </th>
  	 <th>${cource.getCourceName()}</th>
  	 <th><a href='delCource?cid=${cource.getId()} '>DELETE</a></th>
  	  <th><a href='upd?cid=${cource.getId()}&cname=${cource.getCourceName()} '>UPDATE</a></th>
   </tr>
   </c:forEach>
   </c:if>
   </tbody>
   
   
 </table>
</body>
</html>
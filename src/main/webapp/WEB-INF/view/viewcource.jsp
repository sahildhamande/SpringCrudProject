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
<style>
body{
    background-color:#f4f6f9;
    font-family: Arial, sans-serif;
}

.search{
    width:550px;
    margin:20px auto;
}

.form-control{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:5px;
    font-size:16px;
}

.table{
    width:90%;
    margin:30px auto;
    background:#fff;
    border-collapse:collapse;
    box-shadow:0 4px 12px rgba(0,0,0,0.15);
    border-radius:10px;
    overflow:hidden;
}

.table tr:first-child{
    background:#0d6efd;
    color:white;
}

.table th,
.table td{
    padding:15px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

.table tr:hover{
    background:#f8f9fa;
}

.table a{
    text-decoration:none;
    color:white;
    padding:8px 15px;
    border-radius:5px;
    display:inline-block;
    font-weight:bold;
}

.table a[href*="delCource"]{
    background:#dc3545;
}

.table a[href*="delCource"]:hover{
    background:#bb2d3b;
}

.table a[href*="upd"]{
    background:#198754;
}

.table a[href*="upd"]:hover{
    background:#157347;
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
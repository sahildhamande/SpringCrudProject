<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='resources/css/style.css'/>"/>
<script type="stylesheet" src="<c:url value='resources/js/search.js'/>"/></script>

 <!--CDN--> <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
  
 <!--CDN--> <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</head>
<body>

 <div class="container-fluid bg-dark" > <!--Container-->
  <div class="drawer"> <!--Sidebar-->
    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#staticBackdrop" aria-controls="staticBackdrop">
   	Master
   </button>

	<div class="offcanvas offcanvas-start drawer" data-bs-backdrop="static" tabindex="-1" id="staticBackdrop" aria-labelledby="staticBackdropLabel">
  		<div class="offcanvas-header">
    	<h5 class="offcanvas-title" id="staticBackdropLabel">Offcanvas</h5>
    	<button type="button" class="btn-close drawer" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  		</div>
  	<div class="offcanvas-body">
   		 <div>
     		<ul>
     		     <li> Cource Master
     		         <ul>
     		             <li><a href='newcourse'>New Cource</a></li>
     		             
     		             <li><a href='viewc'>View Cource</a></li>
     		         </ul>
     		     </li>
     		     <li> Subject Master
     		         <ul>
     		             <li><a href='addsubject'>New Subject</a></li>
     		             
     		             <li><a href='viewsubject'>View Subject</a></li>
     		         </ul>
     		     </li>
     		</ul>
    	</div>
  	</div>
	</div>
	
	
	
</div>
 </div>
</body>
</html>
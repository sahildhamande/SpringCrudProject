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
 <style>
 
 body{
    margin:0;
    padding:0;
    font-family: Arial, sans-serif;
    background-color:#f4f6f9;
}

/* Top Navbar */
.container-fluid{
    padding:15px;
    box-shadow:0 2px 10px rgba(0,0,0,0.15);
}

/* Master Button */
.btn-primary{
    padding:10px 20px;
    font-weight:bold;
    border-radius:6px;
}

/* Sidebar */
.offcanvas{
    background-color:#ffffff;
    width:280px !important;
}

.offcanvas-header{
    background-color:#0d6efd;
    color:white;
    padding:15px;
}

.offcanvas-title{
    font-size:20px;
    font-weight:bold;
}

/* Menu */
.offcanvas-body ul{
    list-style:none;
    padding-left:0;
}

.offcanvas-body ul li{
    margin:12px 0;
    font-size:16px;
    font-weight:bold;
    color:#333;
}

.offcanvas-body ul li ul{
    margin-top:8px;
    padding-left:15px;
}

.offcanvas-body ul li ul li{
    margin:8px 0;
    font-weight:normal;
}

/* Links */
.offcanvas-body a{
    text-decoration:none;
    color:#0d6efd;
    padding:8px 12px;
    display:block;
    border-radius:5px;
    transition:0.3s;
}

.offcanvas-body a:hover{
    background-color:#0d6efd;
    color:white;
}

/* Close Button */
.btn-close{
    filter:invert(1);
}
 </style>
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

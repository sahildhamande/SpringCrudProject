  <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="ISO-8859-1">
    <title>New Course</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value='/resources/js/search.js'/>"></script>
    <style>
body{
    background:#f4f6f9;
    margin:0;
    font-family:Arial, sans-serif;
}

/* TOP BAR */
.topbar{
    background:linear-gradient(135deg,#667eea,#764ba2);
    color:white;
    padding:12px 20px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

/* LAYOUT */
.wrapper{
    display:flex;
    min-height:calc(100vh - 60px);
}

/* LEFT SIDE */
.sidebar-btn{
    width:220px;
    background:#1f1f1f;
    padding:15px;
}

/* MAIN AREA */
.main{
    flex:1;
    padding:40px;
    display:flex;
    justify-content:center;
    align-items:flex-start;
}

/* CARD */
.card-ui{
    background:white;
    width:100%;
    max-width:700px;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 20px rgba(0,0,0,0.1);
}

.card-ui h3{
    text-align:center;
    margin-bottom:25px;
    color:#333;
    font-weight:600;
}

/* FORM */
.form-control{
    height:45px;
    border-radius:8px;
}

.btn-success{
    width:100%;
    height:45px;
    border-radius:8px;
    font-weight:600;
}

/* OFFCANVAS LINKS */
.offcanvas-body a{
    text-decoration:none;
    color:#333;
    display:block;
    padding:8px 0;
}

.offcanvas-body a:hover{
    color:#0d6efd;
}
</style>
    
  </head>
  <body>

  <!-- TOP BAR -->
  <div class="topbar">
    <h4>Spring CRUD Application</h4>
    <span>Welcome  <%= SecurityContextHolder.getContext().getAuthentication().getName() %> </span> <!-- to get username -->
  </div>

  <div class="wrapper">

    <div class="sidebar-btn">
      <button class="btn btn-primary w-100" type="button" data-bs-toggle="offcanvas" data-bs-target="#menu">&#9776; Master Menu</button>
    </div>

    <div class="main">
      <div class="card-ui">
        <h3>Add New Course</h3>

        <div class="container mt-3" style="max-width:600px;">
          <form name="frm" action="<c:url value='/savecource'/>" method="POST">
            <div class="form-group mb-2">
              <input type="text" name="courceName" placeholder="Course name" class="form-control" required/>
            </div>
            <div class="form-group">
              <input type="submit" name="s" value="Add New Course" class="btn btn-success"/>
            </div>
          </form>
        </div>

      </div>
    </div>

  </div>

  <!-- OFFCANVAS MENU (same as index.jsp) -->
  <div class="offcanvas offcanvas-start" tabindex="-1" id="menu">
    <div class="offcanvas-header">
      <h5>Master Menu</h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body">
      <h6>Course Master</h6>
      <a href="<c:url value='/newcourse'/>">New Course</a><br>
      <a href="<c:url value='/viewc'/>"> View Course</a>
      <hr>
      <h6>Subject Master</h6>
      <a href="<c:url value='/addsubject'/>">New Subject</a><br>
      <a href="<c:url value='/viewsubject'/>"> View Subject</a>
    </div>
  </div>

  </body>
  </html>
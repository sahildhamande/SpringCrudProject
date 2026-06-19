 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>

<!-- CSS -->
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"/>

<!-- JS -->
<script src="<c:url value='/resources/js/search.js'/>"></script>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
    background: #f4f6f9;
    margin: 0;
    font-family: Arial;
}

/* TOP BAR */
.topbar {
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: white;
    padding: 12px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* LAYOUT */
.wrapper {
    display: flex;
    height: calc(100vh - 60px);
}

/* SIDEBAR BUTTON AREA */
.sidebar-btn {
    width: 220px;
    background: #1f1f1f;
    padding: 10px;
}

/* MAIN AREA */
.main {
    flex: 1;
    padding: 30px;
}

/* CARD */
.card-ui {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.1);
    text-align: center;
}

.card-ui img {
    width: 60%;
    border-radius: 10px;
}
</style>

</head>

<body>

<!-- TOP BAR -->
<div class="topbar">
    <h4>Spring CRUD Application</h4>
    <span>Welcome User</span>
</div>

<!-- WRAPPER -->
<div class="wrapper">

    <!-- LEFT BUTTON AREA -->
    <div class="sidebar-btn">

        <button class="btn btn-primary w-100"
            type="button"
            data-bs-toggle="offcanvas"
            data-bs-target="#menu">

            &#9776; Master Menu
        </button>

    </div>

    <!-- MAIN CONTENT -->
    <div class="main">

        <div class="card-ui">

            <h3>Welcome to Dashboard </h3>
            <p>Select any option from menu to start working</p>

            <!-- IMAGE AREA -->
            <img src="<c:url value='/img/bg.jpg'/>"
     alt="student image">

        </div>

    </div>

</div>

<!-- OFFCANVAS MENU -->
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #667eea, #764ba2); /* SAME AS LOGIN */
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Arial, sans-serif;
    }

    .card-ui {
        width: 420px;
        padding: 30px;
        border-radius: 15px;
        background: white;
        box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
    }

    .title {
        text-align: center;
        margin-bottom: 20px;
        font-weight: bold;
        color: #333;
    }

    .form-control, .form-select {
        border-radius: 10px;
        height: 45px;
    }

    .btn-primary {
        width: 100%;
        height: 45px;
        border-radius: 10px;
        background: #667eea;
        border: none;
    }

    .btn-primary:hover {
        background: #5a67d8;
    }

    .link {
        text-align: center;
        margin-top: 15px;
    }

    .link a {
        text-decoration: none;
        color: #667eea;
        font-weight: bold;
    }
</style>

</head>

<body>

<div class="card-ui">

    <h3 class="title">Create Account</h3>

    <form action="saveuser" method="post">

        <div class="mb-2">
            <input type="text" name="name" class="form-control" placeholder="Full Name" required>
        </div>

        <div class="mb-2">
            <input type="text" name="email" class="form-control" placeholder="Email" required>
        </div>

        <div class="mb-2">
            <input type="text" name="contact" class="form-control" placeholder="Contact" required>
        </div>

        <div class="mb-2">
            <input type="text" name="username" class="form-control" placeholder="Username" required>
        </div>

        <div class="mb-2">
            <input type="password" name="password" class="form-control" placeholder="Password" required>
        </div>

        <div class="mb-3">
            <select name="cid" class="form-select" required>
                <option value="">Select Course</option>

                <c:forEach var="cource" items="${courceList}">
                    <option value="${cource.id}">
                        ${cource.courceName}
                    </option>
                </c:forEach>

            </select>
        </div>

        <button type="submit" class="btn btn-primary">Register</button>

        <div class="link">
            Already have an account? <a href="backtologin">Login</a>
        </div>

    </form>

</div>

</body>
</html>
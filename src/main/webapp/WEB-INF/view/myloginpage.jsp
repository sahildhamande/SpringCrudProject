 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #667eea, #764ba2);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Arial, sans-serif;
    }

    .login-card {
        width: 380px;
        padding: 30px;
        border-radius: 15px;
        background: white;
        box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
    }

    .login-title {
        text-align: center;
        margin-bottom: 20px;
        font-weight: bold;
        color: #333;
    }

    .form-control {
        border-radius: 10px;
        height: 45px;
    }

    .btn-login {
        width: 100%;
        border-radius: 10px;
        height: 45px;
        background: #667eea;
        border: none;
    }

    .btn-login:hover {
        background: #5a67d8;
    }

    .signup-link {
        text-align: center;
        margin-top: 15px;
    }

    .signup-link a {
        text-decoration: none;
        color: #667eea;
        font-weight: bold;
    }
</style>

</head>

<body>

<div class="login-card">

    <h3 class="login-title">Welcome Back</h3>

    <form name="frm" action="${pageContext.request.contextPath}/login" method="post">

        <div class="mb-3">
            <label>Username</label>
            <input type="text" name="username" class="form-control" placeholder="Enter username" required>
        </div>

        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
        </div>

        <button type="submit" class="btn btn-primary btn-login">Login</button>

        <div class="signup-link">
            Don't have an account? <a href="register">Sign up</a>
        </div>

    </form>

</div>

</body>
</html>
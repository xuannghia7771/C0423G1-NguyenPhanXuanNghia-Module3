<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style type="text/css">
        .login{
            height: 180px;
            width: 230px;
            margin: 0px;
            padding: 10px;
            border: 1px #CCC solid;
        }
        .login input{
            padding: 5px;
            margin: 5px;
        }
    </style>
</head>
<body>
<form action="/login" method="get">
    <div class="login">
        <h2>Login</h2>
        <input type="text" name="username" size="30" placeholder="username"/>
        <input type="password" name="password" size="30" placeholder="password"/>
        <input type="submit" value="Sign in"/>
    </div>
</form>
</body>
</html>
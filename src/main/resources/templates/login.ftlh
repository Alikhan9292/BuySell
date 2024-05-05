<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/log.css">
</head>
<body>
<div class="signup-box signup-box_reg">
    <h1>Login</h1>
    <h4>It's free and only takes a minute</h4>
    <form action="/login" method="post">
        <label>Email</label>
        <input type="email" name="username" placeholder="">
        <label>Password</label>
        <input type="password" name="password" placeholder="">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Submit">
    </form>
</div>
<p class="para-2">Don't have account? <a href="/registration">Register here  </a></p>
</body>
</html>


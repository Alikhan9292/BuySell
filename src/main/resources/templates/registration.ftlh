<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reg.css">
</head>
<body>
<div class="signup-box">
    <h1>Sign up</h1>
    <h4>It's free and only takes a minute</h4>
    <form action="/registration" method="post">
        <label>Name</label>
        <input type="text" name="name" placeholder="">
        <label>Email</label>
        <input type="email" name="email" placeholder="">
        <label>Phone</label>
        <input type="number" name="phoneNumber" placeholder="">
        <label>Password</label>
        <input type="password" name="password" placeholder="">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Submit">
    </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</div>
<p class="para-2">Already have an account? <a href="/login">Login here  </a></p>
</body>
</html>
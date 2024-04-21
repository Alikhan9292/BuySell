<!DOCTYPE html>
<html>
<head>
    <title>BUYSELL</title>
    <link rel="stylesheet" type="text/css" href="/styles.css">
</head>
<body>
<h1>BUYSELL</h1><hr>
<h4>Регистрация</h4>
<form action="/registration" method="post">
    Имя пользователя: <input type="text" name="name"><br><br>
    Эл. почта: <input type="email" name="email"><br><br>
    Номер телефона: <input type="text" name="numberPhone"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Вход"/>
</form>

</body>
</html>
<!DOCTYPE html>
<html>
<head>
    <title>Регистрация</title>
    <link rel="stylesheet" type="text/css" href="/styles.css">
</head>
<body>
<h1>Регистрация</h1>
<form action="/register" method="post">
    Логин: <input type="text" name="username"/><br><br>
    Пароль: <input type="password" name="password"/><br><br>
    Подтвердите пароль: <input type="password" name="confirmPassword"/><br><br>
    <input type="submit" value="Зарегистрироваться"/>
</form>
</body>
</html>
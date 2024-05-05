<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUYSELL - Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-dark">
    <div class="container">
        <div class="w-100 d-flex justify-content-between">
            <div>
                <i class="fa-solid fa-envelope text-light"></i>
                <a href="mailto:buysell.company@gmail.com" class="navbar-brand text-light">buysell.company@gmail.com</a>
                <i class="fa-solid fa-phone text-light"></i>
                <a href="tel:+87777777777" class="navbar-brand text-white">8-777-777-77-77</a>
            </div>
            <div>
                <a href="#" class="text-white"><i class="fa-brands fa-facebook me-2"></i></a>
                <a href="#" class="text-white"><i class="fa-brands fa-instagram me-2"></i></a>
                <a href="#" class="text-white"><i class="fa-brands fa-linkedin me-2"></i></a>
                <a href="#" class="text-white"><i class="fa-brands fa-twitter me-2"></i></a>
            </div>
        </div>
    </div>
</nav>
<div class="container">
    <div class="col-12">
        <nav class="navbar navbar-expand-sm navbar-light" style="background-color: #e3f2fd;">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link font-weight-bold" href="/addProduct">Add Product</a></li>
                <li class="nav-item"><a class="nav-link font-weight-bold" href="/listProduct">List of Products</a></li>
                <li class="nav-item"><a class="nav-link font-weight-bold" href="/addCategory">Add Category</a></li>
            </ul>
        </nav>
        <h3 class="text-center">List of products</h3>
        <hr>
        <table class="table">
            <thead class="table-dark">
            <tr>
                <th scope="col">Email</th>
                <th scope="col">Номер телефона</th>
                <th scope="col">Активность</th>
                <th scope="col">Роли</th>
                <th scope="col">Бан</th>
                <th scope="col">Редактирование</th>
                <th scope="col">Подробная информация</th>
            </tr>

            </thead>
            <tbody>
            <#list users as user>

                <tr>
                    <th scope="row">${user.email}</th>
                    <th scope="row">${user.phoneNumber}</th>
                    <td><#if user.active>true<#else>false</#if></td>
                    <td><#list user.roles as role>
                        ${role}
                    </#list>
                    </td>
                    <td>
                        <form action="/admin/user/ban/${user.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button type="submit" class="btn btn-danger">Ban User</button>
                        </form>
                    </td>
                    <td>
                        <a href="/admin/user/edit/${user.id}">Редактирование</a>
                    </td>
                    <td>
                        <a href="/user/${user.id}">Подробная информация</a>
                    </td>
                </tr>
            <#else>
                <h3>Пользователей нет</h3>
            </#list>
            </tbody>
        </table>
    </div>
</div>

<script src="/js/jquery-3.7.1.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>
</html>
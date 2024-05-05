<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Market</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container">

        <div class="col-12">
            <nav class="navbar navbar-expand-sm navbar-light" style="background-color: #e3f2fd">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link font-weight-bold" href="/addProduct">Add product</a></li>
                    <li class="nav-item"><a class="nav-link font-weight-bold" href="/listProduct">List of products</a></li>
                    <li class="nav-item"><a class="nav-link font-weight-bold" href="/addCategory">Add category</a></li>
                </ul>
            </nav>
            <hr>
            <h3 class="text-center">Add a Product</h3>
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <form action="/product/create" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="title">Product name</label>
                                    <input type="text" name="title" id="title" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="description">Product description</label>
                                    <input type="text" name="description" id="description" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="price">Product discount</label>
                                    <input type="number" name="discount" id="discount" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="price">Product price</label>
                                    <input type="number" name="price" id="price" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="categories" class="form-label">Select Category</label>
                                    <select id="categories" class="form-select" name="categories">
                                        <#list categories as category>
                                            <option value="${category.id}">${category.title}</option>
                                        </#list>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="formFile" class="form-label">Default file input example</label>
                                    <input class="form-control" type="file" name="file" id="file">
                                </div>
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="btn btn-primary mt-5">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</div>

<script src="/css/js/jquery-3.7.1.min.js"></script>
<script src="/css/js/bootstrap.min.js"></script>
</body>
</html>
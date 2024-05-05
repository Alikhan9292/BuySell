<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Market</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/css/style.css">
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
        <h3 class="text-center">List of products</h3>
        <hr>
        <table class="table">
            <thead class="table-dark">
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">image</th>
                    <th scope="col">name</th>
                    <th scope="col">description</th>
                    <th scope="col">discount</th>
                    <th scope="col">price</th>
                    <th scope="col">delete product</th>
                </tr>

            </thead>
            <tbody>
            <#list products as product>
                <tr>
                    <th scope="row">${product.id}</th>
                    <th scope="row">
                      <#list product.images as img>
                          <img src="/images/${img.id}" style="width: 100px; height: 100px">
                      </#list>
                    </th>
                    <td>${product.title}
                        <!-- Button trigger modal -->
                        <br><button type="button" class="btn btn-success btn-sm mt-2" data-bs-toggle="modal" data-bs-target="#exampleModalTitle-${product.id}">
                            Change name
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalTitle-${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/changeName" method="post">
                                            <div class="form-group">
                                                <label>product id</label>
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="text" value="${product.id}" class="form-control" name="id">
                                                <label>New Product name</label>
                                                <input type="text" name="newName" class="form-control" placeholder="${product.title}">
                                                <br>
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>${product.description}
                        <!-- Button trigger modal -->
                        <br><button type="button" class="btn btn-success btn-sm mt-2" data-bs-toggle="modal" data-bs-target="#exampleModalDescription-${product.id}">
                            Change description
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalDescription-${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/changeDescription" method="post">
                                            <div class="form-group">
                                                <label>product id</label>
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="text" value="${product.id}" class="form-control" name="id">
                                                <label>New Product description</label>
                                                <input type="text" name="newDescr" class="form-control" placeholder="${product.description}">
                                                <br>
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <#if product.discount??>
                            ${product.discount}
                        <#else>
                            No discount available
                        </#if>
                        <!-- Button trigger modal -->
                        <br><button type="button" class="btn btn-success btn-sm mt-2" data-bs-toggle="modal" data-bs-target="#exampleModalDiscount-${product.id}">
                            Change discount
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalDiscount-${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/changeDiscount" method="post">
                                            <div class="form-group">
                                                <label>product id</label>
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="text" value="${product.id}" class="form-control" name="id">
                                                <label>New Product description</label>
                                                <input type="text" name="newDiscount" class="form-control" placeholder="${product.discount}">
                                                <br>
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>${product.price}
                        <!-- Button trigger modal -->
                        <br><button type="button" class="btn btn-success btn-sm mt-2" data-bs-toggle="modal" data-bs-target="#exampleModalPrice-${product.id}">
                            Change price
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalPrice-${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/changePrice" method="post">
                                            <div class="form-group">
                                                <label>product id</label>
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="text" value="${product.id}" class="form-control" name="id">
                                                <label>New Product description</label>
                                                <input type="text" name="newPrice" class="form-control" placeholder="${product.price}">
                                                <br>
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <form action="/product/delete/${product.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>

<script src="/js/jquery-3.7.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
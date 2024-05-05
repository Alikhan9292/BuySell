<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUYSELL</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<nav class="navbar navbar-expand-lg bg-dark">
    <div class="container">
        <div class="w-100 d-flex justify-content-between">
            <div>
                <i class="fa-solid fa-envelope text-light contact-info"></i>
                <a href="" class="navbar-sm-brand text-light text-decoration-none
               contact-info">
                    buysell.company@gmail.com
                </a>
                <i class="fa-solid fa-phone contact-info text-light"></i>
                <a href="" class="navbar-sm-brand text-white text-decoration-none
               contact-info">
                    8-777-777-77-77
                </a>
            </div>
            <div>
                <a href="" class="text-white">
                    <i class="fa-brands fa-facebook me-2"></i></a>
                <a href="" class="text-white">
                    <i class="fa-brands fa-instagram me-2"></i></a>
                <a href="" class="text-white">
                    <i class="fa-brands fa-linkedin me-2"></i></a>
                <a href="" class="text-white">
                    <i class="fa-brands fa-twitter me-2"></i></a>
            </div>
        </div>
    </div>
</nav>
</div>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container d-flex justify-content-between">
        <div>
            <h1 class="text-success">BUYSELL</h1>
        </div>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item nav-items">
                            <a class="nav-link nav-links" ria-current="page" href="#">
                                Home
                            </a>
                        </li>
                        <li class="nav-item nav-items">
                            <a class="nav-link nav-links" href="#">Shop</a>
                        </li>
                        <li class="nav-item nav-items">
                            <a class="nav-link nav-links" href="/addProduct">Add product</a>
                        </li>
                    </ul>
                    <div class="position-relative">
                        <a href="" class="text-decoration-none text-dark">
                            <i class="fa-solid fa-magnifying-glass nav-icon"></i>
                        </a>
                        <a href="/shoppingCart" class="text-decoration-none text-dark">
                            <i class="fa-solid fa-cart-arrow-down nav-icon"></i>
                        </a>
                        <a href="/login" class="text-decoration-none text-dark">
                            <i class="fa-solid fa-user nav-icon"></i>
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </div>

</nav>
<h1>Товары по всему Казахстану!</h1><hr>

<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <#list products as product>
                <div class="col mb-5">
                        <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                <!-- Product image-->
                                <#list product.images as img>
                                    <img class="card-img-top" src="/images/${img.id}" alt="..." />
                                </#list>
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${product.title}</h5>
                                        <!-- Product reviews-->
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                        </div>
                                        <!-- Product price-->
                                        <span class="text-muted text-decoration-line-through"><#if product.discount??>
                                                ${product.discount} ₸
                                            </#if></span>
                                        ${product.price} ₸
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <button class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#exampleModalAddCart-${product.id}">Add to cart</button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModalAddCart-${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Add to cart</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">

                                                        <div class="card">

                                                                <#list product.images as img>
                                                                    <img src="/images/${img.id}" class="card-img-top" alt="...">
                                                                </#list>
                                                                <div class="card-body">
                                                                    <form action="/addToCart" method="post">
                                                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                                        <input type="hidden" name="id" value="${product.id}">
                                                                        <input type="number" min="1" value="1" name="quantity" class="form-control" placeholder="quantity">
                                                                        <br>
                                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                                    </form>
                                                                </div>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <a class="btn btn-outline-info" href="/product/${product.id}">Подробнее</a>
                                    </div>
                                </div>



                        </div>
                </div>
            </#list>
        </div>
    </div>
</section>
<script src="/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
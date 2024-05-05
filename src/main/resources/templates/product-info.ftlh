<!DOCTYPE html>
<html>
<head>
    <title>Product Market</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6">
                    <#list product.images as img>
                        <img class="card-img-top mb-5 mb-md-0" src="/images/${img.id}" alt="..." />
                    </#list>
                </div>
                <div class="col-md-6">
                    <h1 class="display-5 fw-bolder">${product.title}</h1>
                    <div class="fs-5 mb-5">
                        <span class="text-decoration-line-through">
                            <#if product.discount??>
                                ${product.discount} ₸
                            </#if>
                        </span>
                        <span>${product.price} ₸</span>
                    </div>
                    <p class="lead">${product.description}</p>
                    <div class="d-flex">
                        <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                        <button class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#exampleModalAddCart-${product.id}">Add to cart</button>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalAddCart-${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabelAddCart">Add to cart</h1>
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
                    </div>
                </div>
        </div>
    </div>
</section>
<script src="/css/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/css/js/bootstrap.min.js"></script>
</body>
</html>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Market</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/cart.css">
</head>
<body>

<h1>Shopping Cart</h1>
<table border="1">
    <thead>
    <tr>
        <th>Product</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Total</th>
    </tr>
    </thead>
    <tbody>
    <#list shoppingCart.items as cartItem>
        <tr>
            <td>${cartItem.product.title}</td> <!-- Имя продукта -->
            <td>${cartItem.quantity}</td> <!-- Количество -->
            <td>${cartItem.product.price}</td> <!-- Цена за единицу -->
            <td>${cartItem.quantity * cartItem.product.price}</td> <!-- Общая стоимость за данный товар -->
        </tr>
    </#list>
    </tbody>
</table>
<p>Total Price: ${shoppingCart.totalPrice}</p>

<script src="/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
    <title>Emptum</title>
    <link rel="stylesheet" type="text/css" href="/styles.css">
</head>
<body>
<h1>Emptum</h1><hr>
<a href="/login" class="button">Войти</a>
<a href="/register" class="button">Зарегистрироваться</a>
<h4>Товары со всему Казахстану</h4>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее...</a> | <a href="/edit-product${product.id}">Редактировать</a></p>
    </div>
</#list>
<hr>
<h3>Создать новый товар</h3>
<form action="/product/create" method="post" class="form-container">
    Название объявления: <input type="text" name="title" class="input-field"/><br><br>
    Описание объявления: <input type="text" name="description" class="input-field"/><br><br>
    Цена: <input type="number" name="price" class="input-field"/><br><br>
    Город: <input type="text" name="city" class="input-field"/><br><br>
    Имя: <input type="text" name="author" class="input-field"/><br><br>
    <input type="submit" value="Добавить товар" class="submit-button"/>
</form>
</body>
</html>

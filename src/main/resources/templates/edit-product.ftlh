<!DOCTYPE html>
<html>
<head>
    <title>Редактировать товар</title>
    <link rel="stylesheet" type="text/css" href="/styles.css">
</head>
<body>
<h1>Редактировать товар</h1><hr>
<form action="/product/update/${product.id}" method="post" enctype="multipart/form-data" class="form-container">
    Название товара: <input type="text" name="title" value="${product.title}" class="input-field"/><br><br>
    Описание товара: <input type="text" name="description" value="${product.description}" class="input-field"/><br><br>
    Цена: <input type="number" name="price" value="${product.price}" class="input-field"/><br><br>
    Город: <input type="text" name="city" value="${product.city}" class="input-field"/><br><br>
    Автор: <input type="text" name="author" value="${product.author}" class="input-field"/><br><br>
    Изображение 1: <input type="file" name="file1" class="input-field"/><br><br>
    Изображение 2: <input type="file" name="file2" class="input-field"/><br><br>
    Изображение 3: <input type="file" name="file3" class="input-field"/><br><br>
    <input type="submit" value="Обновить товар" class="submit-button"/>
</form>
</body>
</html>

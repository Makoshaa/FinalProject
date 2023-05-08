<%--
  Created by IntelliJ IDEA.
  User: Makosh
  Date: 07.05.2023
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
</head>
<body>

<%@include file="navbar.jsp" %>
<div class="container mt-5">
    <div class="row">
        <div class="col-6 mx-auto">
            <form action="/add-news" method="post">
                <div class="row">
                    <div class="col-12">
                        <label>Заголовок:</label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="text" class="form-control" name="title" required placeholder="Введите название">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>Содержание:</label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <textarea class="form-control" name="content" placeholder="Введите содержание" required
                                  rows="10"></textarea>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <button class="btn btn-danger">Добавить</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>

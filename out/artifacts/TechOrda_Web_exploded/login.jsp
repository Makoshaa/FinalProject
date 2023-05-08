<%--
  Created by IntelliJ IDEA.
  User: Makosh
  Date: 24.04.2023
  Time: 21:36
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
<body class="bg-light">

<%@include file="navbar.jsp" %>

<div class="container">
    <div class="col" style="padding: 40px; ">
        <div class="card mt-5 mx-auto"
             style="width: 59rem; height: 21rem;box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);">
            <h5 class="card-header" style="padding: 15px">Авторизация</h5>
            <div class="card-body">
                <form action="/login-page" method="post">
                    <div class="row">
                        <div class="col-12">
                            <label>Электронная почта: </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input type="email" class="form-control" name="email" required
                                   placeholder="Введите Email"></p>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <label>Пароль: </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input type="password" class="form-control" name="password" required
                                   placeholder="Введите пароль"></p>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <button class="btn btn-danger">Войти</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>

    </div>
</div>


</body>
</html>

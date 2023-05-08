<%@ page import="DataBase.Users" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Makosh
  Date: 24.04.2023
  Time: 22:30
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


<div class="container mt-5" style="padding-left: 500px">
    <div class="row">
        <div class="col-12">
            <label>Электронная почта : </label>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <input type="hidden" name="email" value="<%=currentUser.getEmail()%>">
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-12">
            <label>Имя и Фамилия : </label>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <input type="text" name="full_name" readonly value="<%=currentUser.getFullName()%>">
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-12">
            <label>Пароль : </label>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <input type="text" name="password" readonly value="<%=currentUser.getPassword()%>">
        </div>
    </div>

    <button type="button" class="btn btn-primary btn-sm mt-3" data-bs-toggle="modal" data-bs-target="#editUser">
        Редактировать
    </button>
    <div class="modal fade" id="editUser" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="/settings" method="post">
                    <input type="hidden" name="email" value="<%=currentUser.getEmail()%>">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Редактирование</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12">
                                <label>
                                    Имя и Фамилия :
                                </label>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <input type="text" class="form-control" name="full_name" required
                                       placeholder="Введите новое Имя и Фамилия:"
                                       value="<%=currentUser.getFullName()%>">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <label>
                                    Пароль :
                                </label>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <input type="password" name="password" value="<%=currentUser.getPassword()%>">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Отменить</button>
                        <button class="btn btn-success">Обновить</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>

<%@ page import="java.util.ArrayList" %>

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
<div class="container mt-3" style="padding-left: 220px">
    <div class="row">
        <div class="col-6">
            <%
                String emailerror = request.getParameter("emailerror");
                if (emailerror != null) {
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Такой EMAIL уже занят!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <%
                String passworderror = request.getParameter("passworderror");
                if (passworderror != null) {
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Пароли не совпадают!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <%
                String success = request.getParameter("success");
                if (success != null) {
            %>
            <div>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    Пользователь успешно создан!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>

            <%
                }
            %>


            <div class="card mt-2"
                 style="width: 59rem; height: 30rem;box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);">
                <h5 class="card-header" style="padding: 15px">Регистрация</h5>
                <div class="card-body">
                    <form action="/register-page" method="post">
                        <div class="row">
                            <div class="col-12">
                                <label>Электронная почта : </label>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <input type="email" class="form-control" name="email" required
                                       placeholder="Введите Email">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <label>Пароль : </label>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <input type="password" class="form-control" name="password" required
                                       placeholder="Введите пароль">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <label>Повторите пароль : </label>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <input type="password" class="form-control" name="re_password" required
                                       placeholder="Повторите пароль">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <label>Полное Имя : </label>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <input type="text" class="form-control" name="full_name" required
                                       placeholder="Введите Имя и Фамилию">
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col-12">
                                <button class="btn btn-danger">Зарегистрироваться</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
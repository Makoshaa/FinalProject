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

<div class="container">

    <div class="row">
        <h4 class="text-center">
            <%
                if (currentUser != null && currentUser.getRole() == 1) {
            %>
            <strong style="font-size: 35px"> Привет,  <%=currentUser.getFullName() + " (Админ)"%>
            </strong>
            <%
                }
            %>
            <%
                if (currentUser != null && currentUser.getRole() == 2) {
            %>
            <strong style="font-size: 35px"> Привет,  <%=currentUser.getFullName() + " (Пользователь)"%>
            </strong>
            <%
                }
            %>
            <%
                if (currentUser == null) {
            %>
            <strong style="font-size: 35px"> Привет,  <%=""%>
            </strong>
            <%
                }
            %>

        </h4>
        <p class="text-center" style="font-size: 16px; color: #b6b7b0; font-weight: normal ">Ваш профиль страницы</p>
    </div>

</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@page import="DataBase.Users" %>
<%
    Users currentUser = (Users) session.getAttribute("currentUser");
%>
<nav class="navbar navbar-expand-lg" style="background-color:darkred">
    <div class="container-fluid">
        <a class="navbar-brand" style="color: white; font-size: 40px" href="/news"><b>CNN</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" style="color: white" href="/news"><b>Новости</b></a>
                </li>
                <%
                    if (currentUser != null) {
                %>
                <%
                    if (currentUser.getRole() == 1) {
                %>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" style="color: white" href="/add-news-page"><b>Добавить
                        новости</b></a>
                </li>
                <%
                    }
                %>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" style="color: white" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <%=currentUser.getFullName()%>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/profile">Профиль</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/settings">Настройки</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/logout">Выйти</a></li>
                    </ul>
                </li>
                <%
                } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" style="color: white"
                       href="/login-page"><b>Авторизация</b></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" style="color: white"
                       href="/register-page"><b>Регистрация</b></a>
                </li>
                <%
                    }
                %>


            </ul>

        </div>
    </div>
</nav>

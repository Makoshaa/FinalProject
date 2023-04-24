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
</head>
<body class="bg-light">
    <%@include file="navbar.jsp"%>
    <%
        Users users=(Users) request.getAttribute("adamdar");
    %>
    <div class="container">

      <div class="row">
        <h4 class="text-center">
          <strong style="font-size: 35px"> Hello <%=users!=null?users.getFullName():""%></strong>
        </h4>
        <p class="text-center" style="font-size: 16px; color: #b6b7b0; font-weight: normal ">This is your profile page</p>
      </div>

    </div>
</body>
</html>

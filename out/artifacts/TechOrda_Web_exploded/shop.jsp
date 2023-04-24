<%@ page import="java.util.ArrayList" %>
<%@ page import="DataBase.Items" %><%--
  Created by IntelliJ IDEA.
  User: Makosh
  Date: 24.04.2023
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row">
    <h4 class="text-center">
        <strong style="font-size: 35px"> Welcome to BITLAB SHOP </strong>
    </h4>
    <p class="text-center" style="font-size: 16px; color: #b6b7b0; font-weight: normal ">Electronic devices with hight
        quality and service</p>
</div>
<div class="container mt-5">

    <div class="row m-lg-3" style="padding-left: 40px;" >
        <%
            ArrayList<Items> zattar=(ArrayList<Items>) request.getAttribute("tovary");
            if (zattar!=null) {
                for (Items items:zattar){

        %>
        <div class="col" style="">
            <div class="card mt-5" style="width: 19rem; height: 19rem; box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);">
                <h5 class="card-header text-center" style="padding: 15px"><%= items.getName()%></h5>
                <div class="card-body">
                    <p class="card-text text-success text-center" style="font-size: 30px;"><b><%="$"+items.getPrice()%></b></p>
                    <p class="card-text text-center m-2" style="padding: 15px"><%=items.getDescription()%></p>
                    <a href="#" class="btn btn-success  mx-auto m-4" style="width: 270px; ">Buy Now</a>
                </div>
            </div>
        </div>

        <%
                }
            }
        %>
    </div>

</div>


</body>
</html>

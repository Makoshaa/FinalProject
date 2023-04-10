<%--
  Created by IntelliJ IDEA.
  User: Makosh
  Date: 09.04.2023
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/add-task" method="post">
    <div class="row">
        <div class="col-12">
            <label>Наименование:</label>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <input type="text" class="form-control" placeholder="Наименование" name="task_name">
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <label>Описание:</label>

        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <textarea class="form-control"  placeholder="Описание..." name="task_description"></textarea>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <label>Крайний срок:</label>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <input type="date" class="form-control"  name="task_deadline">
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <button class="btn btn-dark btn-primary">Добавить</button>
        </div>
    </div>

</form>
</body>
</html>

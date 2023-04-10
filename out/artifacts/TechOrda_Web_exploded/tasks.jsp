<%@ page import="java.util.ArrayList" %>
<%@ page import="DataBase.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Главная страница</title>
    <%@include file="head.jsp"%>
</head>


<body>

 <%@include file="navbar.jsp"%>
<div class="container mt-5">
    <div class="row mt-3">
        <div class="col-12">
            <button type="button" class="btn btn-primary btn-sm mb-4" style="background-color:#141573" data-bs-toggle="modal" data-bs-target="#addItem">
                + Добавить задание
            </button>

            <div class="modal fade" id="addItem" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <form action="add-task" method="post">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Новое задание</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
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
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                            <button class="btn  btn-primary">Добавить</button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Наименование</th>
                    <th>Крайний срок</th>
                    <th>Выполнено</th>
                    <th style="width: 7%">Детали</th>

                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<Tasks> products = (ArrayList<Tasks>) request.getAttribute("tovary");
                    if (products != null) {
                        for (Tasks tasks : products) {
                %>
                <tr>
                    <td><%=tasks.getId()%></td>
                    <td><%=tasks.getName()%></td>
                    <td><%=tasks.getDeadlineDate()%></td>
                    <td><%=tasks.getDone()%></td>
                    <td> <a class="btn btn-dark btn-sm" style="background-color: #141573" href="/details?id=<%=tasks.getId()%>">Детали</a> </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>

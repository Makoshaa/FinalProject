<%@ page import="java.util.ArrayList" %>
<%@ page import="DataBase.Tasks" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Детали</title>
  <%@include file="head.jsp"%>
</head>
<body>


<%@include file="navbar.jsp" %>


<div class="container mt-5">
  <%
    Tasks tasks=(Tasks)request.getAttribute("tovar");
    if (tasks!=null) {
  %>
  <div class="row">
    <div class="col-6 mx-auto">
      <form action="/save-task" method="post">

      <div class="row">
        <div class="col-12">
          <input type="hidden" name="task_id" value="<%=tasks.getId()%>">
          <label>Наименование:</label>
        </div>
      </div>
      <div class="row mt-2">
        <div class="col-12">
          <input type="text" class="form-control" name="task_name" value="<%=tasks.getName()%>">
        </div>
      </div>
      <div class="row mt-2">
        <div class="col-12">
          <label>Описание:</label>
        </div>
      </div>
      <div class="row mt-2">
        <div class="col-12">
          <textarea class="form-control"  name="task_description" placeholder="Описание..." ><%=tasks.getDescription()%></textarea>
        </div>
      </div>
      <div class="row mt-2">
        <div class="col-12">
          <label>Крайний срок:</label>
        </div>
      </div>
      <div class="row mt-2">
        <div class="col-12">
          <input type="date"  class="form-control" name="task_deadline"  value="<%=tasks.getDeadlineDate()%>">
        </div>
      </div>
        <div class="row mt-2">
          <div class="col-12">
            <label>Выполнено:</label>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <select class="form-control" name="task_done">
                <option>Да</option>
                <option>Нет</option>
              </select>
            </div>
        </div>
      <div class="row mt-4 ">
        <div class="col-12">
          <button class="btn  btn-success btn-sm" >Сохранить</button>
          <button type="button" class="btn btn-danger btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#deleteBook">Удалить</button>
        </div>
      </div>
      </form>
      <!-- Modal -->
      <div class="modal fade" id="deleteBook" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form action="/delete-task" method="post">
              <input type="hidden" name="id" value="<%=tasks.getId()%>">
              <div class="modal-header">
                <h1 class="modal-title fs-5">Подтвердите удаление</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <h5 class="text-center">Вы уверены?</h5>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет</button>
                <button class="btn btn-danger">Да</button>
              </div>
            </form>
          </div>
        </div>
      </div>

    </div>
  </div>
   <%
     } else {
   %>
   <h3>ITEM NOT FOUND</h3>
  <%
    }
  %>
</div>


</body>
</html>

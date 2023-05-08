<%@ page import="java.util.ArrayList" %>

<%@ page import="DataBase.News" %>
<%@ page import="DataBase.Comment" %>
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
<div class="container mt-3">
    <div class="row mt-3">
        <div class="col-12">
            <%
                News news = (News) request.getAttribute("news");
                if (news != null) {

            %>
            <div class="p-5 mb-3" style="background-color: #dee1df;">
                <a href="/news-details?id=<%=news.getId()%>">
                    <h3><%=news.getTitle()%>
                    </h3>
                </a>
                <p><%=news.getContent()%>
                </p>
                <p>Опубликовал(а) <strong><%=news.getUser().getFullName()%>
                </strong> в <strong><%=news.getPostDate()%>
                </strong></p>
                <%
                    if (currentUser != null && currentUser.getRole() == 1) {
                %>
                <div>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
                            data-bs-target="#editNews">Редактировать
                    </button>
                    <div class="modal fade" id="editNews" data-bs-backdrop="static" data-bs-keyboard="false"
                         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <form action="/save-news" method="post">
                                    <input type="hidden" name="id" value="<%=news.getId()%>">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Редактирование</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-12">
                                                <label>
                                                    Название :
                                                </label>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-12">
                                                <input type="text" class="form-control" name="title" required
                                                       placeholder="Введите название:" value="<%=news.getTitle()%>">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label>
                                                    Содержимое :
                                                </label>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-12">
                                                <textarea class="form-control" name="content"
                                                          placeholder="Введите содержимое:" required
                                                          rows="10"><%=news.getContent()%></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            Отменить
                                        </button>
                                        <button class="btn btn-success">Обновить</button>
                                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#deleteNews">Удалить
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="deleteNews" data-bs-backdrop="static" data-bs-keyboard="false"
                         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/delete-news" method="post">
                                    <input type="hidden" name="id" value="<%=news.getId()%>">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5">Подтвердите удаление</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <h5 class="text-center">Вы уверены?</h5>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет
                                        </button>
                                        <button class="btn btn-danger">Да</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <%
                if (currentUser != null) {
            %>
            <div>
                <form action="/add-comment" method="post">
                    <input type="hidden" name="news_id" value="<%=news.getId()%>">
                    <div class="row">
                        <div class="col-12">
                            <textarea class="form-control" name="comment"></textarea>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <button class="btn btn-danger btn-sm">Добавить комментарий</button>
                        </div>
                    </div>
                </form>
            </div>

            <%
                }
            %>
            <div class="row">
                <div class="col-12">
                    <%
                        ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comment");
                        if (comments != null) {
                            for (Comment comment : comments) {
                    %>
                    <div class="list-group">
                        <a href="JavaScript:void(0)" class="list-group-item list-group-item-action">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1"><%=comment.getUser().getFullName()%>
                                </h5>
                                <small class="text-body-secondary"><%=comment.getPostDate()%>
                                </small>
                            </div>
                            <p class="mb-2"><%=comment.getComment()%>
                            </p>
                        </a>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <%

                }
            %>
        </div>
    </div>
</div>
</body>
</html>
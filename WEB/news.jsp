<%@ page import="java.util.ArrayList" %>

<%@ page import="DataBase.News" %>
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
                ArrayList<News> news = (ArrayList<News>) request.getAttribute("news");
                if (news != null) {
                    for (News n : news) {
            %>
            <div class="p-5 mb-3" style="background-color: #dee1df;">
                <a href="/news-details?id=<%=n.getId()%>">
                    <h3><%=n.getTitle()%>
                    </h3>
                </a>
                <p><%=n.getContent()%>
                </p>
                <p>
                    Опубликовал(а) <strong><%=n.getUser().getFullName()%>
                </strong>
                    в <strong><%=n.getPostDate()%>
                </strong>
                </p>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
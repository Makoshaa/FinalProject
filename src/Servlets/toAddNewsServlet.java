package Servlets;


import DataBase.DBUtil;
import DataBase.News;
import DataBase.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet (value="/add-news")
public class toAddNewsServlet  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Users currentUser = (Users) req.getSession().getAttribute("currentUser");

        if (currentUser!=null){
            String title=req.getParameter("title");
            String content=req.getParameter("content");

            News news=new News();
            news.setTitle(title);
            news.setContent(content);
            news.setUser(currentUser);

            DBUtil.addNews(news);

            resp.sendRedirect("/add-news-page");

        }else {
            resp.sendRedirect("/login-page");
        }
    }
}

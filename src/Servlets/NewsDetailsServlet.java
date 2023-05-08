package Servlets;

import DataBase.Comment;
import DataBase.DBUtil;
import DataBase.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/news-details")
public class NewsDetailsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long id = Long.parseLong(request.getParameter("id"));
        News news=DBUtil.getNewsById(id);
        request.setAttribute("news",news);

        if (news!=null){
            ArrayList<Comment> comments = DBUtil.getComments(news.getId());
            request.setAttribute("comment",comments);
        }
        request.getRequestDispatcher("/newsdetails.jsp").forward(request, response);
    }
}
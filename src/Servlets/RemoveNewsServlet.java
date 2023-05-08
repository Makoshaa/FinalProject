package Servlets;

import DataBase.DBUtil;
import DataBase.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet (value = "/delete-news")
public class RemoveNewsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Users user = (Users) request.getSession().getAttribute("currentUser");
        if (user != null && user.getRole() == 1) {
            int id = Integer.parseInt(request.getParameter("id"));
            DBUtil.deleteNews(id);
            response.sendRedirect("/news");
        } else {
            response.sendRedirect("/login-page");
        }

    }
}

package Servlets;

import DataBase.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet (value = "/add-news-page")
public class AddNewsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Users currentUser = (Users) req.getSession().getAttribute("currentUser");

        if (currentUser!=null){
            if (currentUser.getRole()==1) {
                req.getRequestDispatcher("/addnews.jsp").forward(req, resp);

            }else {
                req.getRequestDispatcher("403.jsp").forward(req,resp);
                }
            }else {
            resp.sendRedirect("/login-page");
        }
    }
}

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


@WebServlet (value="/settings")
public class SettingsServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/settings.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Users currentUser = (Users) req.getSession().getAttribute("currentUser");


        if (currentUser!=null){
            String fullName=req.getParameter("full_name");
            String password=req.getParameter("password");
            String email=req.getParameter("email");

            Users users=DBUtil.getUsers(email);
            if (users!=null) {
                users.setFullName(fullName);
                users.setPassword(password);

                DBUtil.updateUser(users);

                resp.sendRedirect("/profile");
            }
            else {
                resp.sendRedirect("/news");
            }

        }else {
            resp.sendRedirect("/login-page");
        }
    }
}

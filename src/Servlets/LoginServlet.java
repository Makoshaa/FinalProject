package Servlets;

import DataBase.DBUtil;
import DataBase.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;


@WebServlet (value = "/login-page")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String email=req.getParameter("email");
            String password=req.getParameter("password");
            Users users= DBUtil.getUsers(email);

        if (users!=null && users.getPassword().equals(password)){
            HttpSession session=req.getSession();
            session.setAttribute("currentUser", users);
            resp.sendRedirect("/profile");
        }else {
            resp.sendRedirect("/login-page?error");
        }

    }
}

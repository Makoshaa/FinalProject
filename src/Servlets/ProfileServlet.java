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


@WebServlet (value = "/profile")
public class ProfileServlet  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Users currentUser = (Users) req.getSession().getAttribute("currentUser");
        if (currentUser!=null) {
            req.getRequestDispatcher("/profile.jsp").forward(req, resp);
        }
        else {
            resp.sendRedirect("/login-page");
        }
    }
}

package Servlets;

import DataBase.DBUtil;

import DataBase.DBUtil;
import DataBase.News;
import DataBase.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


@WebServlet (value = "/home.html")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArrayList<News> tasks= DBUtil.getNews();
        String text = (String) session.getAttribute("userName");
        req.getRequestDispatcher("/news.jsp").forward(req,resp);
    }
}

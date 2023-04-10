package Servlets;

import DataBase.DBManager;

import DataBase.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


@WebServlet (value = "/home.html")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Tasks> tasks= DBManager.getAllTasks();
        req.setAttribute("tovary",tasks);
        req.getRequestDispatcher("/tasks.jsp").forward(req,resp);
    }
}

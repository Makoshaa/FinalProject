package Servlets;

import DataBase.DBManager;
import DataBase.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet (value="/add-task")
public class AddTasksServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("task_name");
        String description=req.getParameter("task_description");
        String deadlineDate=req.getParameter("task_deadline");


        Tasks task=new Tasks();
        task.setName(name);
        task.setDescription(description);
        task.setDeadlineDate(deadlineDate);

        DBManager.addTask(task);

        resp.sendRedirect("/");
    }
}

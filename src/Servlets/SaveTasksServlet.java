package Servlets;

import DataBase.DBManager;
import DataBase.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(value = "/save-task")

public class SaveTasksServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id=Long.parseLong(req.getParameter("task_id"));

        String done=req.getParameter("task_done");
        String name=req.getParameter("task_name");
        String description=req.getParameter("task_description");
        String deadLine=req.getParameter("task_deadline");
        Tasks tasks = DBManager.getTask(id);

        if(tasks!=null){
            tasks.setName(name);
            tasks.setDescription(description);
            tasks.setDone(done);
            tasks.setDeadlineDate(deadLine);
            DBManager.updateTask(tasks);
            resp.sendRedirect("/details?id="+id);
        }else{
            resp.sendRedirect("/");
        }
    }
}

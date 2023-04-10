package DataBase;

import java.util.ArrayList;

public class DBManager {

    private static final ArrayList<Tasks> tasks=new ArrayList<>();
    private static long id=6;


    static {
        tasks.add(new Tasks(
                1l,
                "Создать Веб приложение на JAVA EE",
                "Нужно будет создать собственное приложение на JAVA EE для себя. Для начала я установлю себе на комп Composer.",
                "2021-10-23",
                "Да"));
        tasks.add(new Tasks(
                2l,
                "Убраться дома и закупить продукты",
                "Нужно будет создать собственное приложение на JAVA EE для себя. Для начала я установлю себе на комп Composer.",
                "2021-10-23",
                "Да"));
        tasks.add(new Tasks(
                3l,
                "Выполнить все домашние задания",
                "Нужно будет создать собственное приложение на JAVA EE для себя. Для начала я установлю себе на комп Composer.",
                "2021-10-23",
                "Нет"));
        tasks.add(new Tasks(
                4l,
                "Записаться на качку",
                "Нужно будет создать собственное приложение на JAVA EE для себя. Для начала я установлю себе на комп Composer.",
                "2021-10-23",
                "Нет"));
        tasks.add(new Tasks(
                5l,
                "Учить Итальянский",
                "Нужно будет создать собственное приложение на JAVA EE для себя. Для начала я установлю себе на комп Composer.",
                "2021-10-23",
                "Нет"));
    }

    public static void addTask(Tasks task) {
        task.setId(id);
        tasks.add(task);
        id++;
    }
    public static Tasks getTask(Long id){
        return tasks.stream().filter(tasks1 -> tasks1.getId()==id).findFirst().orElse(null);
    }

    public static ArrayList getAllTasks(){
        return tasks;
    }

    public static void deleteTask(Long id) {
        for (int i = 0; i < tasks.size() ; i++) {
            if (tasks.get(i).getId()==id){
                tasks.remove(i);
                break;
            }
        }
    }
    public static void updateTask(Tasks zada4i) {
        for (int i = 0; i < tasks.size(); i++) {
            if (tasks.get(i).getId() == zada4i.getId()) {
                tasks.set(i, zada4i);
                break;
            }
        }
    }

}

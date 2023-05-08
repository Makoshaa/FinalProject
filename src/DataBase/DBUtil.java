package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DBUtil {


    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/Tech_Orda",
                    "postgres",
                    "postgres"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public static Users  getUsers(String email) {
        Users users=null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users where email=?");
            statement.setString(1,email);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                users=new Users();
                users.setId(resultSet.getLong("id"));
                users.setPassword(resultSet.getString("password"));
                users.setFullName(resultSet.getString("full_name"));
                users.setEmail(resultSet.getString("email"));
                users.setRole(resultSet.getInt("role_id"));
                System.out.println(resultSet.getString("email"));

            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public static void addUsers(Users user) {
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO users (email, password, full_name, role_id) " +
                    "VALUES (?, ?, ?, ?)");

            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());
            statement.setInt(4, user.getRole());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void addNews(News news) {
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO news (title, content, post_date, user_id) " +
                    "VALUES (?, ?, NOW(), ?)");

            statement.setString(1, news.getTitle());
            statement.setString(2, news.getContent());
            statement.setLong(3, news.getUser().getId());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static ArrayList<News> getNews() {
        ArrayList<News> news = new ArrayList<>();
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT n.id, n.title, n.content, n.user_id, u.full_name, n.post_date " +
                    "FROM news n " +
                    "INNER JOIN users u ON u.id = n.user_id " +
                    "ORDER BY n.post_date DESC ");

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {

                News n = new News();
                n.setId(resultSet.getLong("id"));
                n.setTitle(resultSet.getString("title"));
                n.setContent(resultSet.getString("content"));
                n.setPostDate(resultSet.getTimestamp("post_date"));

                Users user = new Users();
                user.setId(resultSet.getLong("user_id"));
                user.setFullName(resultSet.getString("full_name"));
                n.setUser(user);

                news.add(n);
            }

            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    public static News getNewsById(Long id) {
        News news = null;
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT n.id, n.title, n.content, n.user_id, u.full_name, n.post_date " +
                    "FROM news n " +
                    "INNER JOIN users u ON u.id = n.user_id " +
                    "WHERE n.id = ? ");

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {

                news = new News();
                news.setId(resultSet.getLong("id"));
                news.setTitle(resultSet.getString("title"));
                news.setContent(resultSet.getString("content"));
                news.setPostDate(resultSet.getTimestamp("post_date"));

                Users user = new Users();
                user.setId(resultSet.getLong("user_id"));
                user.setFullName(resultSet.getString("full_name"));
                news.setUser(user);

            }

            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }
    public static void updateNews(News news) {
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE news SET title = ?, content = ? " +
                    "WHERE id = ?");

            statement.setString(1, news.getTitle());
            statement.setString(2, news.getContent());
            statement.setLong(3, news.getId());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteNews(int id) {
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "DELETE FROM news where id=?");

            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateUser(Users users) {
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE users " +
                    "SET " +
                    "full_name = ?, " +
                    "password = ?, " +
                    "WHERE email = ?");

            statement.setString(1, users.getFullName());
            statement.setString(2, users.getPassword());
            statement.setString(3,users.getEmail());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addComment(Comment comment) {
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO comments (comment, user_id, news_id, post_date) " +
                    "VALUES (?, ?, ?, NOW())");

            statement.setString(1, comment.getComment());
            statement.setLong(2, comment.getUser().getId());
            statement.setLong(3, comment.getNews().getId());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Comment> getComments(Long newsId) {

        ArrayList<Comment> comments = new ArrayList<>();

        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT co.id, co.comment, co.post_date, co.news_id, co.user_id, u.full_name " +
                    "FROM comments co " +
                    "INNER JOIN users u ON u.id = co.user_id " +
                    "WHERE co.news_id = ? " +
                    "ORDER BY co.post_date DESC");

            statement.setLong(1, newsId);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {

                Comment comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setPostDate(resultSet.getTimestamp("post_date"));
                Users user = new Users();
                user.setId(resultSet.getLong("user_id"));
                user.setFullName(resultSet.getString("full_name"));
                comment.setUser(user);

                News news = new News();
                news.setId(resultSet.getLong("news_id"));
                comment.setNews(news);

                comments.add(comment);
            }
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return comments;
    }

}

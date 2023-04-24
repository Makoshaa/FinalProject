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

    public static ArrayList<Items> getItems() {
        ArrayList<Items> itemsy = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM items");

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Items items=new Items();
                items.setId(resultSet.getLong("id"));
                items.setName(resultSet.getString("name"));
                items.setDescription(resultSet.getString("description"));
                items.setPrice(resultSet.getDouble("price"));
                itemsy.add(items);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return itemsy;
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

                System.out.println(resultSet.getString("password"));

            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }


}

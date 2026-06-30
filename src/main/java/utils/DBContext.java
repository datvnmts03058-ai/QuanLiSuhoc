package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {

    private static final String URL =
        "jdbc:sqlserver://localhost:1433;databaseName=SuMonDB;encrypt=false";

    private static final String USER = "sa";
    private static final String PASS = "24122009";

    public static Connection getConnection() {

        try {

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            return DriverManager.getConnection(URL, USER, PASS);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
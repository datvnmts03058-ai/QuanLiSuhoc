package dao;

import entity.User;
import utils.DBContext;

import java.sql.*;

public class UserDAO {

    public User findByUsername(String username) {

        String sql = "SELECT * FROM Users WHERE username=?";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFullname(rs.getString("fullname"));
                u.setRole(rs.getString("role"));
                u.setAvatar(rs.getString("avatar"));
                

                return u;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean insert(User u) throws SQLException {
    	try (Connection conn = DBContext.getConnection()) {

    	    System.out.println("CONN = " + conn);

    	}
        String sql = "INSERT INTO Users(username,password,fullname) VALUES(?,?,?)";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFullname());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public boolean updateAvatar(String username, String avatar) {

        String sql =
            "UPDATE Users SET avatar = ? WHERE username = ?";

        try (
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, avatar);
            ps.setString(2, username);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
}
package dao;

import java.sql.*;
import java.util.*;

import entity.Character;
import utils.DBContext;

public class CharacterDAO {
	 Connection conn = DBContext.getConnection();
    // ================= LIST =================
    public List<Character> findAll(String keyword, String dynasty, int page, int pageSize) {

        List<Character> list = new ArrayList<>();

        String sql = "SELECT * FROM Characters WHERE 1=1 ";

        if (keyword != null && !keyword.isEmpty()) {
            sql += " AND name LIKE ? ";
        }

        if (dynasty != null && !dynasty.isEmpty()) {
            sql += " AND dynasty = ? ";
        }

        sql += " ORDER BY id ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            int i = 1;

            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(i++, "%" + keyword + "%");
            }

            if (dynasty != null && !dynasty.isEmpty()) {
                ps.setString(i++, dynasty);
            }

            ps.setInt(i++, (page - 1) * pageSize);
            ps.setInt(i, pageSize);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Character c = new Character();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDynasty(rs.getString("dynasty"));
                c.setDescription(rs.getString("description"));
                c.setImage(rs.getString("image"));

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= COUNT =================
    public int countAll(String keyword, String dynasty) {

        String sql = "SELECT COUNT(*) FROM Characters WHERE 1=1 ";

        if (keyword != null && !keyword.isEmpty()) {
            sql += " AND name LIKE ? ";
        }

        if (dynasty != null && !dynasty.isEmpty()) {
            sql += " AND dynasty = ? ";
        }

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            int i = 1;

            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(i++, "%" + keyword.trim() + "%");
            }

            if (dynasty != null && !dynasty.isEmpty()) {
                ps.setString(i++, dynasty.trim()); // ✅ FIX
            }

            ResultSet rs = ps.executeQuery();

            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    // ================= DETAIL =================
    public Character getById(int id) {

        Character c = null;

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "SELECT * FROM Characters WHERE id=?")) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                c = new Character();

                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDynasty(rs.getString("dynasty"));
                c.setDescription(rs.getString("description"));
                c.setImage(rs.getString("image"));

                c.setBiography(rs.getString("biography"));
                c.setAchievement(rs.getString("achievement"));
                c.setBirthPlace(rs.getString("birth_place"));
                c.setYoutubeLink(rs.getString("youtube_link"));
                c.setHistorical_site(rs.getString("historical_site"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return c;
    }

    // ================= TIMELINE =================
    public List<Character> findTop6Timeline() {

        List<Character> list = new ArrayList<>();

        String sql =
            "SELECT * FROM Characters WHERE name IN (" +
            "N'Ngô Quyền'," +
            "N'Lý Thường Kiệt'," +
            "N'Đinh Bộ Lĩnh'," +
            "N'Trần Hưng Đạo'," +
            "N'Lê Lợi'," +
            "N'Quang Trung'" +
            ") ORDER BY id";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Character c = new Character();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDynasty(rs.getString("dynasty"));
                c.setDescription(rs.getString("description"));
                c.setImage(rs.getString("image"));

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public void updateAvatar(int userId, String avatar) {
        String sql = "UPDATE users SET avatar=? WHERE id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, avatar);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Character> getRandomCharacters(int limit) {

        List<Character> list = new ArrayList<>();

        String sql =
            "SELECT TOP (?) * " +
            "FROM Characters " +
            "ORDER BY NEWID()";

        try {

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, limit);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Character c = new Character();

                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDynasty(rs.getString("dynasty"));
                c.setDescription(rs.getString("description"));
                c.setBiography(rs.getString("biography"));
                c.setAchievement(rs.getString("achievement"));
                c.setBirthPlace(rs.getString("birth_place"));
                c.setHistorical_site(rs.getString("historical_site"));
                c.setYoutubeLink(rs.getString("youtube_link"));
                c.setImage(rs.getString("image"));

                list.add(c);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }
  
   
}
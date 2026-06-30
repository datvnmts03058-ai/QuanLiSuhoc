package dao;

import java.sql.*;
import java.util.*;
import entity.Dynasty;
import utils.DBContext;
import entity.Character;

public class DynastyDAO {

    private Connection conn = DBContext.getConnection();

    // LIST DYNASTY
    public List<Dynasty> findAll() {

        List<Dynasty> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Dynasties ORDER BY StartYear";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Dynasty d = new Dynasty();

                d.setId(rs.getInt("Id"));
                d.setName(rs.getString("Name"));
                d.setFounder(rs.getString("Founder"));
                d.setStartYear(rs.getInt("StartYear"));
                d.setEndYear(rs.getInt("EndYear"));
                d.setCapital(rs.getString("Capital"));
                d.setDescription(rs.getString("Description"));
                d.setImage(rs.getString("Image"));

                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // GET DETAIL DYNASTY
    public Dynasty findById(int id) {

        try {
            String sql = "SELECT * FROM Dynasties WHERE Id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Dynasty d = new Dynasty();

                d.setId(rs.getInt("Id"));
                d.setName(rs.getString("Name"));
                d.setFounder(rs.getString("Founder"));
                d.setStartYear(rs.getInt("StartYear"));
                d.setEndYear(rs.getInt("EndYear"));
                d.setCapital(rs.getString("Capital"));
                d.setDescription(rs.getString("Description"));
                d.setImage(rs.getString("Image"));

                return d;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // GET CHARACTERS BY DYNASTY
    public List<Character> getCharacters(int dynastyId) {

        List<Character> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Characters WHERE dynasty_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, dynastyId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Character c = new Character();

                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setImage(rs.getString("image"));
                c.setDescription(rs.getString("description"));

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

	
}
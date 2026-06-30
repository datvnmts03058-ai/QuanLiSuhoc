package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Comment;
import utils.DBContext;

public class CommentDAO {

    Connection conn = DBContext.getConnection();

    public void addComment(int userId,int charId, String content, int score) throws Exception {
			String sql ="INSERT INTO Comment(user_id, character_id, content, score) " +"VALUES(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, charId);
			ps.setString(3, content);
			ps.setInt(4, score);
			
			ps.executeUpdate();
			}

    public List<Comment> getComments(int charId) {
        List<Comment> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Comment WHERE character_id=? ORDER BY created_at DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, charId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Comment c = new Comment();

                c.setId(rs.getInt("id"));
                c.setUserId(rs.getInt("user_id"));
                c.setContent(rs.getString("content"));

                c.setScore(rs.getInt("score"));

                c.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(c);
            }

        } catch(Exception e){ e.printStackTrace(); }

        return list;
    }

    public void deleteComment(int id, int userId, boolean isAdmin) throws Exception {

        String sql;

        if (isAdmin) {
            sql = "DELETE FROM Comment WHERE id=?";
        } else {
            sql = "DELETE FROM Comment WHERE id=? AND user_id=?";
        }

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);

        if (!isAdmin) ps.setInt(2, userId);

        ps.executeUpdate();
    }
    public double getAvgRating(int charId) {

        try {

            String sql = "SELECT AVG(CAST(score AS FLOAT)) avgScore FROM Comment WHERE character_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, charId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                return rs.getDouble("avgScore");
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
    public int countReviews(int charId) {

        try {

            String sql =
            "SELECT COUNT(*) total FROM Comment WHERE character_id=?";
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setInt(1, charId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                return rs.getInt("total");
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}

package controller;

import java.io.IOException;

import dao.CommentDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/comment")
public class CommentController extends HttpServlet {

    CommentDAO dao = new CommentDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        try {
            req.setCharacterEncoding("UTF-8");

            int userId = Integer.parseInt(req.getParameter("uid"));
            int charId = Integer.parseInt(req.getParameter("cid"));
            String content = req.getParameter("content");
            int score = Integer.parseInt(req.getParameter("score"));

            dao.addComment(userId, charId, content, score);

            // ✔ QUAN TRỌNG NHẤT: luôn quay về đúng detail
            resp.sendRedirect(req.getContextPath() + "/characters?id=" + charId);

        } catch (Exception e) {
            e.printStackTrace();

            // ✔ fallback vẫn quay về detail, KHÔNG được về home
            String cid = req.getParameter("cid");

            if (cid != null) {
                resp.sendRedirect(req.getContextPath() + "/characters?id=" + cid);
            } else {
                resp.sendRedirect(req.getContextPath() + "/characters");
            }
        }
    }
}
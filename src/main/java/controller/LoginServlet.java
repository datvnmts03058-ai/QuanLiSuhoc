 package controller;

import dao.UserDAO;
import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/views/auth/login.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.findByUsername(username);

        if (user == null) {
            req.setAttribute("error", "Tài khoản không tồn tại");
            req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
            return;
        }

        if (!password.equals(user.getPassword())) {
            req.setAttribute("error", "Sai mật khẩu");
            req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
            return;
        }

        req.getSession().setAttribute("user", user);

        resp.sendRedirect(req.getContextPath() + "/");
    }
}
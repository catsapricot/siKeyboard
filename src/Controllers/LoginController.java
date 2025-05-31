package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.Optional;

import Services.*;
import DAO.RoleDAO;
import Models.*;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private RoleDAO roleDao = new RoleDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("views/login.jsp");
        }
        request.getRequestDispatcher("views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "Username dan password tidak boleh kosong!");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }

        try {
            Optional<Role> roleOpt = roleDao.findByUsername(username);
            if (!roleOpt.isEmpty()) {
                Role userRole = roleOpt.get();
                String hashedPassword = userRole.getPassword();

                if (PasswordService.verifyPassword(password, hashedPassword)) {
                    session.setAttribute("user", userRole);
                    session.setAttribute("user_id", userRole.getId());
                    session.setAttribute("username", userRole.getUsername());
                    session.setAttribute("name", userRole.getNama());
                    session.setMaxInactiveInterval(60 * 60);// ngeset waktu timeout kalo ga ada aktifitas oleh user

                    response.sendRedirect(request.getContextPath() + "/views/dashboard.jsp"); // masi ga tau bener apa
                                                                                              // nggak
                    return;
                } else {
                    request.setAttribute("error", "Username atau password salah!");
                }
            } else {
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Terjadi kesalahan pada Sistem!");
        }
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }
}
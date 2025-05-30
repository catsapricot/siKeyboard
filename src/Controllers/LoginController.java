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

import Services.*;
import Models.*;

@WebServlet("/login")
public class LoginController extends HttpServlet {

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
        /* 
        Pengguna user = new Pengguna(username, password);

        if (user.login()) {

        }
        */
        
        HttpSession session = request.getSession();

        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "Username dan password tidak boleh kosong!");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }

        DBConnection db = new DBConnection();
        try {
            db.connect();
            String sql = "SELECT * FROM user WHERE username =" + username;

            ResultSet rsUser = db.getData(sql);

            if (rsUser.next()) {
                String hashedPassword = rsUser.getString("password");

                if (PasswordService.verifyPassword(password, hashedPassword)) {
                    int userId = rsUser.getInt("user_id");
                    String name = rsUser.getString("nama");

                    session.setAttribute("user_id", userId);
                    session.setAttribute("username", username);
                    session.setAttribute("name", name);
                    session.setMaxInactiveInterval(60 * 60);// ngeset waktu timeout kalo ga ada aktifitas oleh user

                    response.sendRedirect("../views/dashboard.jsp");
                    return;
                } else {
                    request.setAttribute("error", "Username atau password salah!");
                }
            } else {
                request.setAttribute("error", "Username atau password tidak ada!");
            }
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Terjadi kesalahan pada SQL!");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Terjadi kesalahan pada Sistem!");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }    
    }
}
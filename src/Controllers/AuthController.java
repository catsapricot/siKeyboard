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

import DAO.RoleDAO;
import Models.*;
// import Services.PasswordService;

@WebServlet("/auth")
public class AuthController extends HttpServlet {
    private RoleDAO roleDao = new RoleDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(request.getContextPath() + "/views/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String action = request.getParameter("action");

        if (action == null || action.equals("login")) {
            loginAwal(request, response);
        } else if (action.equals("securityKey")) {
            securityVerification(request, response);
        } else if ("register".equals(action)) {
            register(request, response);
        } else if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
        }

    }

    private void loginAwal(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp?error=1");
        }

        try {
            Optional<Role> roleOpt = roleDao.findByUsername(username);
            if (roleOpt.isPresent()) {
                Role userRole = roleOpt.get();
                String storedPassword = userRole.getPassword();

                if (userRole instanceof Admin) {
                    session.setAttribute("pending_admin_username", username);
                    session.setAttribute("pending_admin_password", password);
                    response.sendRedirect(request.getContextPath() + "/views/admin/loginAdmin.jsp");
                    return;
                }

                if (userRole.login(password, storedPassword, "")) {
                    session.setAttribute("user", userRole);
                    session.setMaxInactiveInterval(60 * 60);

                    response.sendRedirect(request.getContextPath() + "/views/dashboard.jsp");
                    return;
                }
            }
            response.sendRedirect(request.getContextPath() + "/views/login.jsp?error=1");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp?error=3");
        }
    }

    private void securityVerification(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        String plainSecurityKey = request.getParameter("security");
        String username = (String) session.getAttribute("pending_admin_username");
        String password = (String) session.getAttribute("pending_admin_password");

        try {
            Optional<Role> roleOpt = roleDao.findByUsername(username);
            if (roleOpt.isPresent() && roleOpt.get() instanceof Admin) {
                Admin userAdmin = (Admin) roleOpt.get();
                String storedPassword = userAdmin.getPassword();
                if (userAdmin.login(storedPassword, password, plainSecurityKey)) {
                    session.removeAttribute("pending_admin_username");
                    session.removeAttribute("pending_admin_password");

                    response.sendRedirect(request.getContextPath() + "/views/admin/dashboard.jsp");
                    return;
                }

            }
            response.sendRedirect(request.getContextPath() + "/views/admin/loginAdmin.jsp?error=1");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp?error=3");
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nama = request.getParameter("nama");
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        System.out.println("Nama: " + nama);
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);

        try {
            if (nama == null || nama.isEmpty() || username == null || username.isEmpty() || password == null
                    || password.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/views/registrasi.jsp?error=1");
                return;
            }

            if (password.length() < 8) {
                response.sendRedirect(request.getContextPath() + "/views/registrasi.jsp?error=2");
                return;
            }
            if (roleDao.findUsername(username)) {
                response.sendRedirect(request.getContextPath() + "/views/registrasi.jsp?error=3");
                return;
            }

            Pengguna user = new Pengguna(nama, username, password);
            roleDao.simpanNewUser(user);
            response.sendRedirect(request.getContextPath() + "/views/registrasi.jsp?status=sukses");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/views/registrasi.jsp?error=4");
        }
    }

}

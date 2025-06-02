package Controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
/* 
import models.Keyboard;
import java.util.ArrayList;
@WebServlet("/keyboard")
public class KeyboardServlet extends HttpServlet {
    private keyboardController dbController;

    @Override
    public void init() throws ServletException {
        dbController = new KeyboardController();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = dbController.getConnection();
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        if (conn != null) {
            out.println("<h1>Koneksi ke database berhasil!</h1>");
        } else {
            out.println("<h1>Koneksi ke database gagal!</h1>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        models.Keyboard keyboardObj = new models.Keyboard();

        if ("view".equals(menu)) {
            ArrayList<models.Keyboard> keyboards = keyboardObj.get();
            request.setAttribute("keyboards", keyboards);
            request.getRequestDispatcher("view.jsp").forward(request, response);

        } else if ("add".equals(menu)) {
            request.getRequestDispatcher("add.jsp").forward(request, response);

        } else if ("edit".equals(menu)) {
            String id = request.getParameter("id");
            models.Keyboard keyboard = keyboardObj.find(Integer.parseInt(id));
            if (keyboard != null) {
                request.setAttribute("keyboard", keyboard);
                request.getRequestDispatcher("edit.jsp").forward(request, response);
            } else {
                response.sendRedirect("keyboard?menu=view");
            }

        } else {
            response.sendRedirect("keyboard?menu=view");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        models.Keyboard keyboardObj = new models.Keyboard();

        if ("add".equals(action)) {
            String layout = request.getParameter("layout");
            String switchType = request.getParameter("switchType");
            String warnaTersedia = request.getParameter("warnaTersedia");

            keyboardObj.setLayout(layout);
            keyboardObj.setSwitchType(switchType);
            keyboardObj.setWarnaTersedia(warnaTersedia);
            keyboardObj.insert();

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String layout = request.getParameter("layout");
            String switchType = request.getParameter("switchType");
            String warnaTersedia = request.getParameter("warnaTersedia");

            keyboardObj.setId(id);
            keyboardObj.setLayout(layout);
            keyboardObj.setSwitchType(switchType);
            keyboardObj.setWarnaTersedia(warnaTersedia);
            keyboardObj.update();
        }

        // Redirect ke halaman view.jsp
        response.sendRedirect("keyboard?menu=view");
    }
        
}
    */

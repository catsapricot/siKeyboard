package Controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
/* 
import models.Accessoris;
import java.util.ArrayList;
@WebServlet("/accessoris")
public class accessorisController extends HttpServlet {
    private models.accessoris accessorisObj;

    @Override
    public void init() throws ServletException {
        accessorisObj = new models.accessoris();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");

        if ("view".equals(menu)) {
            java.util.ArrayList<models.accessoris> accessories = accessorisObj.get();
            request.setAttribute("accessories", accessories);
            request.getRequestDispatcher("accessoris/view.jsp").forward(request, response);

        } else if ("add".equals(menu)) {
            request.getRequestDispatcher("accessoris/add.jsp").forward(request, response);

        } else if ("edit".equals(menu)) {
            String id = request.getParameter("id");
            models.accessoris acc = accessorisObj.find(Integer.parseInt(id));
            if (acc != null) {
                request.setAttribute("accessoris", acc);
                request.getRequestDispatcher("accessoris/edit.jsp").forward(request, response);
            } else {
                response.sendRedirect("accessoris?menu=view");
            }

        } else {
            response.sendRedirect("accessoris?menu=view");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String nama = request.getParameter("nama");
            String tipe = request.getParameter("tipe");
            String warna = request.getParameter("warna");

            accessorisObj.setNama(nama);
            accessorisObj.setTipe(tipe);
            accessorisObj.setWarna(warna);
            accessorisObj.insert();

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nama = request.getParameter("nama");
            String tipe = request.getParameter("tipe");
            String warna = request.getParameter("warna");

            accessorisObj.setId(id);
            accessorisObj.setNama(nama);
            accessorisObj.setTipe(tipe);
            accessorisObj.setWarna(warna);
            accessorisObj.update();
        }

        response.sendRedirect("accessoris?menu=view");
    }
}
    */
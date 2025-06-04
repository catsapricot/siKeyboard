package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.List;
import java.util.Optional;

import Models.*;
// import Services.PasswordService;

@WebServlet("/keranjang")
public class KeranjangController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Pengguna pengguna = (Pengguna) session.getAttribute("user");

        if (pengguna == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }
        List<Katalog> keranjang = pengguna.getKeranjang();
        double totalHarga = 0.0;
        if (keranjang == null) {
            response.sendRedirect(request.getContextPath() + "/views/keranjang.jsp?");
            return;
        } else {
            for (Katalog items : keranjang) {
                totalHarga += (items.getHarga() * items.getKuantitas());
            }
        }

        request.setAttribute("totalHarga", totalHarga);
        request.setAttribute("keranjang", keranjang);
        request.getRequestDispatcher("views/keranjang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        Pengguna pengguna = (Pengguna) session.getAttribute("user");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "update" -> handleUpdateKeranjang(pengguna, request, response);
            case "remove" -> handleRemoveKeranjang(pengguna, request, response);
            default -> response.sendRedirect(request.getContextPath() + "/keranjang");
        }

    }

    private void handleUpdateKeranjang(Pengguna pengguna, HttpServletRequest request,
            HttpServletResponse response) throws IOException {

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            List<Katalog> keranjang = pengguna.getKeranjang();
            int kuantitasBaru = Integer.parseInt(request.getParameter("quantity"));
            if (keranjang != null) {
                boolean itemFound = false;
                for (Katalog item : keranjang) {
                    if (item.getIdProduk() == productId) {
                        if (kuantitasBaru <= 0) {
                            keranjang.remove(item);
                        } else {
                            item.setKuantitas(kuantitasBaru);
                        }
                        itemFound = true;
                    }
                    if (itemFound) {
                        break;
                    }
                }
            }
            response.sendRedirect(request.getContextPath() + "/keranjang");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/keranjang");
        }
    }

    private void handleRemoveKeranjang(Pengguna pengguna, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            List<Katalog> keranjang = pengguna.getKeranjang();
            if (keranjang != null) {
                for (Katalog item : keranjang) {
                    if (item.getIdProduk() == productId) {
                        item.setKuantitas(0);
                        keranjang.remove(item);
                    }
                }
            }
            response.sendRedirect(request.getContextPath() + "/keranjang");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/keranjang");
        }

    }

}

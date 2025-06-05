package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.KatalogDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import Models.*;
import DAO.*;
import Services.DBConnection;

@WebServlet(urlPatterns = { "/keranjang" })
public class KeranjangController extends HttpServlet {
    private KatalogDAO katalogDao = new KatalogDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Pengguna pengguna = (Pengguna) session.getAttribute("user");

        if (pengguna == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        List<Katalog> keranjang = katalogDao.getKeranjangByUserId(userId);

        // Simpan ke request, bukan ke session
        request.setAttribute("keranjang", keranjang);
        request.getRequestDispatcher("/views/keranjang.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        Pengguna pengguna = (Pengguna) session.getAttribute("user");
        String action = request.getParameter("action");
        if (pengguna == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "update" -> handleUpdateKeranjang(pengguna, request, response);
            case "remove" -> handleRemoveKeranjang(pengguna, request, response);
            case "add" -> handleAddToKeranjang(pengguna, request, response);
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
            request.getSession().setAttribute("user", pengguna);
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
            request.getSession().setAttribute("user", pengguna);
            response.sendRedirect(request.getContextPath() + "/keranjang");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/keranjang");
        }

    }

    private void handleAddToKeranjang(Pengguna pengguna, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        try {
            int quantity = Integer.parseInt(request.getParameter("qty"));

            Optional<Katalog> optionalProduk = katalogDao.findById(productId);

            if (optionalProduk.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/views/tampilkanProduk.jsp?id=" + productId);
                return;
            }

            Katalog produk = optionalProduk.get();

            List<Katalog> keranjang = pengguna.getKeranjang();
            if (keranjang == null) {
                keranjang = new ArrayList<>();
                pengguna.setKeranjang(keranjang);
            }

            boolean itemDitemukan = false;
            for (Katalog item : keranjang) {
                if (item.getIdProduk() == productId) {
                    item.setKuantitas(item.getKuantitas() + quantity);
                    itemDitemukan = true;
                    break;
                }
            }

            if (!itemDitemukan) {
                produk.setKuantitas(quantity);
                keranjang.add(produk);
            }

            int userId = (int) request.getSession().getAttribute("userId");
            katalogDao.tambahKeKeranjangDatabase(userId, productId, quantity);

            request.getSession().setAttribute("user", pengguna);
            request.setAttribute("status", "sukses");
            String jenis = katalogDao.getJenisById(productId);
            if (jenis.equals("Keyboard")) {
                response.sendRedirect(
                request.getContextPath() + "/views/tampilkanProduk.jsp?id=" + productId + "&status=sukses");
            } else {
                response.sendRedirect(
                request.getContextPath() + "/views/tampilkanAksesoris.jsp?id=" + productId + "&status=sukses");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "gagal");
            response.sendRedirect(
                    request.getContextPath() + "/views/tampilkanProduk.jsp?id=" + productId + "&status=gagal");
        }
    }

}

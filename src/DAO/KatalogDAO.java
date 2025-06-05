package DAO;

import Models.*;
import Services.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class KatalogDAO {
    DBConnection db = new DBConnection();

    public KatalogDAO() {
    }

    public void tambahKeKeranjangDatabase(int userId, int idProduk, int jumlah) {
        String sql = """
                    INSERT INTO keranjang (id_user, id_katalog, jumlah)
                    VALUES (?, ?, ?)
                    ON DUPLICATE KEY UPDATE jumlah = jumlah + VALUES(jumlah)
                """;

        try {
            db.connect();
            try (Connection con = db.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                stmt.setInt(2, idProduk);
                stmt.setInt(3, jumlah);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Optional<Katalog> findById(int id) {
        try {
            db.connect();
            Connection con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM katalog WHERE id_katalog = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Ambil semua kolom dasar
                int idProduk = rs.getInt("id_katalog");
                String nama = rs.getString("nama");
                double harga = rs.getDouble("harga");
                int stock = rs.getInt("stock");
                String jenis = rs.getString("jenis");
                String urlGambar = rs.getString("url_gambar");

                // Buat objek Katalog dasar
                if ("Keyboard".equals(jenis)) {
                    String layout = rs.getString("layout_keyboard");
                    String switchType = rs.getString("switch_type");
                    Katalog katalog = new Keyboard(idProduk, nama, harga, stock, urlGambar, layout, switchType);
                    return Optional.of(katalog);
                } else if ("Accessories".equals(jenis)) {
                    Katalog katalog = new Accessories(idProduk, nama, harga, stock, urlGambar);
                    return Optional.of(katalog);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Terjadi error saat query!");
        }
        return Optional.empty();
    }

    public List<Katalog> getKeranjangByUserId(int userId) {
        List<Katalog> keranjang = new ArrayList<>();

        String sql = "SELECT p.*, k.jumlah FROM keranjang k JOIN katalog p ON k.id_katalog = p.id_katalog WHERE k.id_user = ?";

        try {
            db.connect();
            Connection con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Katalog produk = null;
                    String jenis = rs.getString("jenis");

                    if ("Keyboard".equals(jenis)) {
                        Keyboard kb = new Keyboard();
                        kb.setIdProduk(rs.getInt("id_katalog"));
                        kb.setNamaProduk(rs.getString("nama"));
                        kb.setHarga(rs.getInt("harga"));
                        kb.setStok(rs.getInt("stock"));
                        kb.setLayout(rs.getString("layout_keyboard"));
                        kb.setSwitch(rs.getString("switch_type"));
                        kb.setGambarUrl(rs.getString("url_gambar"));
                        kb.setKuantitas(rs.getInt("jumlah")); // Ambil kuantitas dari JOIN
                        produk = kb;
                    } else if ("Accessories".equals(jenis)) {
                        Accessories acc = new Accessories();
                        acc.setIdProduk(rs.getInt("id_katalog"));
                        acc.setNamaProduk(rs.getString("nama"));
                        acc.setHarga(rs.getInt("harga"));
                        acc.setStok(rs.getInt("stock"));
                        acc.setGambarUrl(rs.getString("url_gambar"));
                        acc.setKuantitas(rs.getInt("jumlah")); // Ambil kuantitas dari JOIN
                        produk = acc;
                    }

                    if (produk != null) {
                        keranjang.add(produk);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return keranjang;
    }

    public void simpanNewKeyboard(Keyboard user) throws SQLException {
        String sql = "INSERT INTO katalog (nama, harga, stock, jenis, layout_keyboard, switch_type, url_gambar) VALUES (?, ?, ?, ?, ?, ?, ?)";

        db.connect();
        try (Connection con = db.getConnection();
                PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, user.getNamaProduk());
            stmt.setDouble(2, user.getHarga());
            stmt.setInt(3, user.getStok());
            stmt.setString(4, "Keyboard");
            stmt.setString(5, user.getLayout());
            stmt.setString(6, user.getSwitch());
            stmt.setString(7, user.getGambarUrl());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error occurred while adding user: " + e.getMessage());
            throw e;
        }
    }

    public void simpanNewAccessories(Accessories user) throws SQLException {
        String sql = "INSERT INTO katalog (nama, harga, stock, jenis, layout_keyboard, switch_type, url_gambar) VALUES (?, ?, ?, ?, ?, ?, ?)";

        db.connect();
        try (Connection con = db.getConnection();
                PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, user.getNamaProduk());
            stmt.setDouble(2, user.getHarga());
            stmt.setInt(3, user.getStok());
            stmt.setString(4, "Accessories");
            stmt.setString(7, user.getGambarUrl());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error occurred while adding user: " + e.getMessage());
            throw e;
        }
    }

    public void checkout(int productId) {
        String sql = "UPDATE katalog SET stock = stock - 1 WHERE id_katalog = ?";

        try {
            db.connect();
            try (Connection con = db.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, productId);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

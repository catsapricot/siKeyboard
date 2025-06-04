package DAO;

import Models.*;
import Services.DBConnection;
import java.sql.*;
import java.util.Optional;

public class KatalogDAO {
    DBConnection db = new DBConnection();

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
                String urlGambar = rs.getString("url_gambar");

                // Buat objek Katalog dasar
                Katalog katalog = new Accessories(idProduk, nama, harga, stock, urlGambar);

                return Optional.of(katalog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Terjadi error saat query!");
        }
        return Optional.empty();
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
}


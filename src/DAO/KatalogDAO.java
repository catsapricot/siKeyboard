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

}

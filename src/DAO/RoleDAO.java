package DAO;

import Models.*;
import Services.DBConnection;
import java.sql.*;
import java.util.Optional;

public class RoleDAO {
    DBConnection db = new DBConnection();

    public Optional<Role> findByUsername(String username) {

        try {
            db.connect();
            Connection con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE username = ?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int isAdmin = rs.getInt("is_admin");
                if (isAdmin == 1) {
                    Admin admin = new Admin(
                            rs.getInt("id_user"),
                            rs.getString("username"),
                            rs.getString("password"));

                    admin.setSecurity(rs.getString("security_key"));
                    return Optional.of(admin);
                } else if (isAdmin == 0) {
                    Pengguna user = new Pengguna(
                            rs.getInt("id_user"),
                            rs.getString("nama"),
                            rs.getString("username"),
                            rs.getString("password"));
                    return Optional.of(user);
                }
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Terjadi error saat query!");
        }
        return Optional.empty();
    }

    public boolean findUsername(String username) {
        try {
            db.connect();
            Connection con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE username = ?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs != null && rs.next()) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            return false;
        }
    }

    public void simpanNewUser(Pengguna user) throws SQLException {
        DBConnection db = new DBConnection();
        db.connect();
        try (Connection con = db.getConnection()) {
            String sql = "INSERT INTO users (nama, username, password, is_admin) VALUES (?, ?, ?, ?)";

            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, user.getNama());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPassword());
            stmt.setInt(4, 0);

            // Eksekusi query
            stmt.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Terjadi kesalahan saat menambahkan user! " + e.getMessage());
            // Lemparkan kembali exception agar bisa ditangkap oleh AuthController
            throw e;
        }
    }
}

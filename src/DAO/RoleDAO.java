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
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Terjadi error saat query!");
        }
        return Optional.empty();
    }

    public boolean findUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ?";
        try {
            db.connect(); // Ensure the connection is established
            Connection con = db.getConnection();
            if (con == null) {
                System.err.println("Connection is null. Cannot execute query.");
                return false; // Handle the null connection case
            }
            try (PreparedStatement stmt = con.prepareStatement(query)) {
                stmt.setString(1, username);
                try (ResultSet rs = stmt.executeQuery()) {
                    return rs.next(); // true if username found
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error occurred while checking username: " + e.getMessage());
            return false; // Assume not found if error occurs
        }
    }

    public void simpanNewUser(Pengguna user) throws SQLException {
        String sql = "INSERT INTO users (nama, username, password, is_admin) VALUES (?, ?, ?, ?)";

        db.connect();
        try (Connection con = db.getConnection();
                PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, user.getNama());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPassword());
            stmt.setInt(4, 0);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error occurred while adding user: " + e.getMessage());
            throw e;
        }
    }
}

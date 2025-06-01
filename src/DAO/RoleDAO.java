package DAO;

import Models.*;
import Services.DBConnection;
import java.sql.*;
import java.util.Optional;

public class RoleDAO {

    public Optional<Role> findByUsername(String username) {
        DBConnection db = new DBConnection();
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
            System.err.println("Terjadi error saat query!");
        }
        return Optional.empty();
    }

    public void simpanNewUser(Pengguna user) throws SQLException {
        String nama = user.getNama();
        String username = user.getUsername();
        String password = user.getPassword();
        DBConnection db = new DBConnection();
        try {
            String sql = "INSERT INTO users (nama, username, password, is_admin) VALUES ("
                    + nama + ", "
                    + username + ", "
                    + password + ", "
                    + 0
                    + ")";
            db.runQuery(sql);
        } catch (Exception e) {
            System.err.println("Terjadi kesalahan saat menambahkan user!");
        }
    }
}

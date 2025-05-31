package DAO;

import Models.*;
import Services.DBConnection;
import java.sql.*;
import java.util.Optional;

public class RoleDAO {
    
    public Optional<Role> findByUsername(String username) {
        DBConnection db = new DBConnection();
        try {
            String sql = "SELECT * FROM users WHERE username =" + username;

            ResultSet rs = db.getData(sql);

            if (rs.next()) {
                int isAdmin = rs.getInt("is_admin");
                if (isAdmin == 1) {
                    Admin admin = new Admin(
                            rs.getInt("id_user"),
                            rs.getString("username"),
                            rs.getString("password"));
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

}

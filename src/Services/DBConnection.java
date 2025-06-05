package Services;

import java.sql.*;

public class DBConnection {
    private Connection con;
    private String message;

    public DBConnection() {
        this.message = "Koneksi belum diinisialisasi.";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("Terjadi kesalahan saat. Driver Tidak ditemukan. Error: " + e.getMessage());
        }
    }

    public void connect() {
        String DB_URL = "jdbc:mysql://localhost:3306/sikeyboard";
        String DB_USERNAME = "root";
        String DB_PASSWORD = "";

        try {
            if (con == null || con.isClosed()) {
                con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
                message = "Koneksi ke database berhasil!";
                System.out.println(message);
            }
        } catch (SQLException e) {
            message = "Terjadi kesalahan saat menghubungkan ke database: " + e.getMessage();
            System.err.println(message);
        }
    }

    public void disconnect() {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
                message = "Koneksi ke database ditutup!";
                System.out.println(message);
            }
        } catch (SQLException e) {
            message = "Terjadi kesalahan saat menutup koneksi: " + e.getMessage();
            System.err.println(message);
        }
    }

    public void runQuery(String query) {
        connect();
        try (Statement stmt = con.createStatement()) {
            int result = stmt.executeUpdate(query);
            message = "Query berhasil dijalankan. " + result + " baris terpengaruh.";
            System.out.println(message);
        } catch (SQLException e) {
            message = "Terjadi kesalahan saat menjalankan query: " + e.getMessage();
            System.err.println(message);
        } finally {
            disconnect();
        }
    }

    public ResultSet getData(String query) {
        ResultSet rs = null;
        connect();
        try {
            Statement stmt = con.createStatement();
            rs = stmt.executeQuery(query);
        } catch (SQLException e) {
            message = "Terjadi kesalahan saat mengambil data dari database: " + e.getMessage();
            System.err.println(message);
        }
        return rs;
    }

    public String getMessage() {
        return this.message;
    }

    public Connection getConnection() {
        return this.con;
    }
}

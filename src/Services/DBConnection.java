package Services;

import java.sql.*;

public class DBConnection {
    private Connection con;
    private Statement stmt;
    private boolean isConnected;
    private String message;

    public DBConnection() {
        this.isConnected = false;
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
            con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            stmt = con.createStatement();
            isConnected = true;
        } catch (SQLException e) {
            message = "Terjadi kesalahan saat menghubungkan ke database: " + e.getMessage();
            System.err.println(message);
            isConnected = false;
        }
    }

    public void disconnect() {
        try {
            stmt.close();
            con.close();
            message = "Koneksi ke database ditutup!";
            System.out.println(message);
            isConnected = false;
        } catch (SQLException e) {
            message = "Terjadi kesalahan saat menutup koneksi: " + e.getMessage();
            System.out.println(message);
        }
    }

    public void runQuery(String query) {
        connect();
        if (isConnected) {
            try {
                int result = stmt.executeUpdate(query);
                message = "Query berhasil dijalankan. " + result + " baris terpengaruh.";
                System.out.println(message);
            } catch (SQLException e) {
                message = "Terjadi kesalahan saat mejalankan query: " + e.getMessage();
                System.err.println(message);
            } finally {
                disconnect();
            }
        } else {
            message = "Terjadi kesalahan saat menjalankan query. Koneksi dengan database terputus/gagal.";
            System.err.println(message);
        }
    }

    public ResultSet getData(String query) {
        ResultSet rs = null;
        connect();
        if (isConnected) {
            try {
                rs = stmt.executeQuery(query);
                message = "Data berhasil diambil dari database.";
                System.out.println(message);
            } catch (SQLException e) {
                message = "Terjadi kesalahan saat mengambil data dari database: " + e.getMessage();
                System.err.println(message);
            }
        } else {
            message = "Terjadi kesalahan saat menjalankan query. Koneksi dengan database terputus/gagal.";
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
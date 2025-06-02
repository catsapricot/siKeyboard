package Models;

public class Admin extends Role {

    private String security;

    public Admin(int id, String username, String password) {
        super(id, username, password);
    }

    public Admin(String username, String password, String security) {
        super(username, password);
        this.security = security;
    }

    public void setSecurity(String security) {
        this.security = security;
    }

    public String getSecurity() {
        return this.security;
    }

    @Override
    public boolean login(String passwordInp, String hashedPassword, String securityKey) {
        boolean isValid = false;
        if (passwordInp.equals(hashedPassword) && securityKey.equals(this.security)) {
            isValid = true;
        }
        return isValid;
    }
    /* 
    public void editKatalogDB(java.sql.Connection conn, int katalogId, String namaProduk, String deskripsi, double harga, int stok, String gambarUrl, String rating) throws java.sql.SQLException {
        String sql = "UPDATE katalog SET nama_produk=?, deskripsi=?, harga=?, stok=?, gambar_url=?, rating=? WHERE id=?";
        try (java.sql.PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, namaProduk);
            stmt.setString(2, deskripsi);
            stmt.setDouble(3, harga);
            stmt.setInt(4, stok);
            stmt.setString(5, gambarUrl);
            stmt.setString(6, rating);
            stmt.setInt(7, katalogId);
            stmt.executeUpdate();
        }
    }

    public void tambahKatalogDB(java.sql.Connection conn, String namaProduk, String deskripsi, double harga, int stok, String gambarUrl, String rating) throws java.sql.SQLException {
        String sql = "INSERT INTO katalog (nama_produk, deskripsi, harga, stok, gambar_url, rating) VALUES (?, ?, ?, ?, ?, ?)";
        try (java.sql.PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, namaProduk);
            stmt.setString(2, deskripsi);
            stmt.setDouble(3, harga);
            stmt.setInt(4, stok);
            stmt.setString(5, gambarUrl);
            stmt.setString(6, rating);
            stmt.executeUpdate();
        }
    }

    public Katalog cariKatalogDB(java.sql.Connection conn, String namaProduk) throws java.sql.SQLException {
        String sql = "SELECT * FROM katalog WHERE LOWER(nama_produk) = LOWER(?)";
        try (java.sql.PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, namaProduk);
            try (java.sql.ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Katalog(
                        rs.getInt("id"),
                        rs.getString("nama_produk"),
                        rs.getString("deskripsi"),
                        rs.getDouble("harga"),
                        rs.getInt("stok"),
                        rs.getString("gambar_url"),
                        rs.getString("rating")
                    );
                }
            }
        }
        return null;
    }
        */
}
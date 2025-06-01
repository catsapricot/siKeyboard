package Models;

public abstract class Role {
    private String nama;
    private int id;
    private String username;
    private String password;

    public Role(int id, String nama, String username, String password) {
        this.username = username;
        this.password = password;
        this.id = id; // Pastikan id juga diinisialisasi
        this.nama = nama; // Pastikan nama juga diinisialisasi
    }

    public Role(int id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public Role(String nama, String username, String password) {
        this.nama = nama;
        this.username = username;
        this.password = password;
    }

    public Role(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Role() {
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNama() {
        return this.nama;
    }

    public int getId() {
        return this.id;
    }

    public String getUsername() {
        return this.username;
    }

    public String getPassword() {
        return this.password;
    }

    // Metode abstract 1 (2 parameter) - ini yang menyebabkan error di Pengguna dan Admin
    public abstract boolean login(String username, String password);

    // Metode abstract 2 (3 parameter)
    public abstract boolean login(String username, String password, String securityKey);
}
package Models;

public abstract class Role {
    private String nama;
    private int id;
    private String username;
    private String password;

    public Role(int id, String nama, String username, String password) {
        this.id = id;
        this.nama = nama;
        this.username = username;
        this.password = password;
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

    public abstract boolean login(String username, String Password, String securityKey);

}
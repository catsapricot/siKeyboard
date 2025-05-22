package model;

public abstract class Role {
    private String nama;
    private String id;
    private String username;
    private String password;

    public Role(String nama, String id, String username, String password) {
        this.nama = nama;
        this.id = id;
        this.username = username;
        this.password = password;
    }
    public Role(String nama, String id) {
        this.nama = nama;
        this.id = id;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }
    public void setId(String id) {
        this.id = id;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public void setPassword(String password) {
        this.password = password;
    }
     public String getNama() {
        return nama;
    }
    public String getId() {
        return id;
    }
    public String getUsername() {
        return username;
    }
    public String getPassword() {
        return password;
    }
    public abstract void login();
}
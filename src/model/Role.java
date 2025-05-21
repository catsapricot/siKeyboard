package model;

public abstract class Role {
    private String nama;
    private String id;
    private String username;
    private String password;

    public Role(String nama, String id, String username, String password) {
        this.nama = nama;
        this.id = id;
    }
    public Role(String nama, String id) {
        this.nama = nama;
        this.id = id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public void setNama(String nama) {
        this.nama = nama;
    }
    public String getId() {
        return id;
    }
    public String getNama() {
        return nama;
    }
    public abstract void login();

}

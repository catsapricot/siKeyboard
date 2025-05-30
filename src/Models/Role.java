package Models;

public abstract class Role implements loginable {
    private String nama;
    private String id;
    private String username;
    private String password;

    public Role(String username, String password) {
        this.username = username;
        this.password = password;
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

<<<<<<< HEAD:src/java/Models/Role.java
    public abstract boolean login();
=======
    public abstract void login();
>>>>>>> 256fe8f19d4d519a16bab2e238dec687690b8d50:src/Models/Role.java
}
package Models;

public class Pengguna extends Role {
    private String email;

    public Pengguna(String username, String password, String email) {
        super(username, password);
        this.email = email;
    }
    public Pengguna(String username, String password) {
        super(username, password);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    @Override
    public boolean login() {
        return true;

    }
}
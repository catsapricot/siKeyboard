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
    public boolean login(String passwordInp, String hashedPassword) {
        return true;
    }

}
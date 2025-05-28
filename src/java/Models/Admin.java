package Models;

import Services.*;

public class Admin extends Role {

    private String security;

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
    public void login() {
        DBConnection db = new DBConnection();
        db.connect();
        try {
            // Admin gk perlu dihashing
            // String query = "SELECT password FROM role WHERE username = admin";
            // ResultSet rs = db.getData(query);

        } catch (Exception e) {
            System.err.println(db.getMessage());
        }

    }
}

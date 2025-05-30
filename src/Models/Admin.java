package Models;

<<<<<<< HEAD:src/java/Models/Admin.java
import Services.DBConnection;
=======
import Services.*;
import org.mindrot.jbcrypt.BCrypt;
>>>>>>> 256fe8f19d4d519a16bab2e238dec687690b8d50:src/Models/Admin.java

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
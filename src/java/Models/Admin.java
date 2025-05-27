package Models;
import java.sql.*;

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
            // Algoritma Hashing
            ResultSet rs = db.getData("SELECT password_hash FROM role WHERE username = admin");
            
        }

    }
}

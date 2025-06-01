package Models;

import Services.PasswordService;
import java.util.ArrayList;
import java.util.List;

public class Pengguna extends Role {
    private List<Katalog> keranjang;

    public Pengguna(int id, String nama, String username, String password) {
        super(id, nama, username, password);
    }

    public Pengguna(String nama, String username, String password) {
        super(nama, username, password);
        this.keranjang = new ArrayList<>();
    }

    public Pengguna() {
        this.keranjang = new ArrayList<>();
    }

    public List<Katalog> getKeranjang() {
        return this.keranjang;
    }

    @Override
    public boolean login(String passwordInp, String hashedPassword, String securityKey) {
        boolean isValid = false;
        

        if (PasswordService.verifyPassword(passwordInp, hashedPassword)) {
            isValid = true;
        }
        return isValid;
    }

}
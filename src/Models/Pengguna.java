package Models;

import java.util.ArrayList;
import java.util.List;

public class Pengguna extends Role {
    private List<Katalog> keranjang;

    public Pengguna(int id, String nama, String username, String password) {
        super(id, nama, username, password);
    }

    public Pengguna(int id, String username, String password) {
        super(username, password);
    }

    public Pengguna() {
        this.keranjang = new ArrayList<>();
    }

    public List<Katalog> getKeranjang() {
        return this.keranjang;
    }

    @Override
    public boolean login(String username, String password) {
        boolean isValid = false;

        if (username.equals(getUsername()) && password.equals(getPassword())) {
            isValid = true;
        }
        return isValid;
    }

}
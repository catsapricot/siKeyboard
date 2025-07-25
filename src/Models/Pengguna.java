package Models;

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

    public void setKeranjang(List<Katalog> keranjang) {
        this.keranjang = keranjang;
    }

    @Override
    public boolean login(String passwordInp, String storedPassword, String securityKey) {
        boolean isValid = false;

        if (passwordInp.equals(storedPassword)) {
            isValid = true;
        }
        return isValid;
    }

}
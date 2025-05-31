package Models;

public class Pengguna extends Role {
    private katalog[] keranjang;

    public Pengguna(String nama, String id, String password) {
        super(nama, password);
        this.nama = nama;
        this.password = password;
    }

    public String getNama() {
        return this.nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

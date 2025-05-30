package Models;
<<<<<<< HEAD

public class Pengguna extends Role {
    private String email;

    public Pengguna(String username, String password, String email) {
        super(username, password);
        this.email = email;
    }
    public Pengguna(String username, String password) {
        super(username, password);
=======

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
>>>>>>> 206c4fc0d7a70769aabed2f397d98e212f616a7a
    }

    public void setEmail(String email) {
        this.email = email;
    }
    @Override
    public boolean login() {
        return true;

    }
}

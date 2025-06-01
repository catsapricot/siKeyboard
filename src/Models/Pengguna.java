package Models;

import Services.PasswordService; // Pastikan ini diimpor jika digunakan
import java.util.ArrayList;
import java.util.List;

public class Pengguna extends Role {
    private List<Katalog> keranjang;

    public Pengguna(int id, String nama, String username, String password) {
        super(id, nama, username, password);
        this.keranjang = new ArrayList<>(); // Inisialisasi di semua konstruktor
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

    @Override // Implementasi untuk login(String, String, String)
    public boolean login(String passwordInp, String hashedPassword, String securityKey) {
        // Asumsi Pengguna tidak menggunakan securityKey untuk login utama,
        // atau securityKey bisa menjadi semacam validasi tambahan.
        // Anda mungkin ingin menghapus parameter securityKey jika tidak relevan untuk Pengguna
        // Atau Anda bisa membiarkannya dan menggunakannya jika diperlukan.
        boolean isValid = false;
        if (PasswordService.verifyPassword(passwordInp, hashedPassword)) {
            isValid = true;
        }
        return isValid;
    }

    @Override // WAJIB: Implementasi untuk login(String, String)
    public boolean login(String username, String password) {
        // Logika login untuk Pengguna tanpa securityKey.
        // Anda perlu menggunakan username dan password untuk otentikasi.
        // Misalnya, cek database untuk mencocokkan username dan password
        System.out.println("Pengguna " + username + " mencoba login dengan 2 parameter.");
        // Contoh sederhana:
        // return username.equals("user") && PasswordService.verifyPassword(password, "hashed_password_from_db");
        return false; // Ganti ini dengan logika sebenarnya
    }
}
import Models.Katalog;

package Models;

// import Services.PasswordService; // Import ini jika Anda akan menggunakan PasswordService di sini
// (di kode Anda sebelumnya tidak ada, jadi saya hapus untuk sementara)

public class Admin extends Role {

    private String security;

    public Admin(int id, String username, String password) {
        super(id, username, password);
    }

    public Admin(String username, String password, String security) {
        super(username, password);
        this.security = security;
    }

    // Konstruktor default juga baik untuk ditambahkan jika sering dibuat tanpa parameter
    public Admin() {
        super(); // Panggil konstruktor default Role
    }

    public void setSecurity(String security) {
        this.security = security;
    }

    public String getSecurity() {
        return this.security;
    }

    @Override // Implementasi untuk login(String, String, String)
    public boolean login(String passwordInp, String hashedPassword, String securityKey) {
        boolean isValid = false;
        // Perhatian: passwordInp.equals(hashedPassword) ini biasanya tidak aman untuk password
        // Seharusnya Anda menggunakan PasswordService.verifyPassword di sini juga
        if (passwordInp.equals(hashedPassword) && securityKey.equals(this.security)) {
            isValid = true;
        }
        return isValid;
    }

<<<<<<< HEAD
    @Override // WAJIB: Implementasi untuk login(String, String)
    public boolean login(String username, String password) {
        // Logika login untuk Admin tanpa securityKey.
        // Anda perlu menggunakan username dan password untuk otentikasi.
        // Contoh:
        // return username.equals("admin") && PasswordService.verifyPassword(password, "hashed_password_from_db");
        System.out.println("Admin " + username + " mencoba login dengan 2 parameter.");
        return false; // Ganti ini dengan logika sebenarnya
=======
    public void editKatalog(Katalog katalog, String namaProduk, String deskripsi, double harga, int stok, String gambarUrl, String rating) {
        katalog.setNamaProduk(namaProduk);
        katalog.setDeskripsi(deskripsi);
        katalog.setHarga(harga);
        katalog.setStok(stok);
        katalog.setGambarUrl(gambarUrl);
        katalog.setRating(rating);
    }

    public void tambahKatalog(Toko etalase, Katalog katalogBaru) {
        getEtalase().add(katalogBaru);
    }

    public Katalog cariKatalog(Toko etalase, String namaProduk) {
        for (Katalog katalog : getEtalase()) {
            if (katalog.getNamaProduk().equalsIgnoreCase(namaProduk)) {
                return katalog;
            }
        }
        return null;
>>>>>>> 1a02cbd933741699570c99fb13b1a5cbe97e8721
    }
}
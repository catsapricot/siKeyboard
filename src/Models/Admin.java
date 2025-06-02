import Models.Katalog;

package Models;

public class Admin extends Role {

    private String security;

    public Admin(int id, String username, String password) {
        super(id, username, password);
    }

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
    public boolean login(String passwordInp, String hashedPassword, String securityKey) {
        boolean isValid = false;
        if (passwordInp.equals(hashedPassword) && securityKey.equals(this.security)) {
            isValid = true;
        }
        return isValid;
    }

    // Menghubungkan dengan Katalog.java
    // Pastikan Anda sudah mengimport Katalog jika berada di package berbeda
    // import Models.Katalog;

    // Method untuk mengedit katalog
    public void editKatalog(Katalog katalog, String namaProduk, String deskripsi, double harga, int stok, String gambarUrl, String rating) {
        katalog.setNamaProduk(namaProduk);
        katalog.setDeskripsi(deskripsi);
        katalog.setHarga(harga);
        katalog.setStok(stok);
        katalog.setGambarUrl(gambarUrl);
        katalog.setRating(rating);
    }

    public void tambahKatalog(java.util.List<Katalog> daftarKatalog, Katalog katalogBaru) {
        daftarKatalog.add(katalogBaru);
    }

    public Katalog cariKatalog(java.util.List<Katalog> daftarKatalog, String namaProduk) {
        for (Katalog katalog : daftarKatalog) {
            if (katalog.getNamaProduk().equalsIgnoreCase(namaProduk)) {
                return katalog;
            }
        }
        return null;
    }
}
package Models;

public abstract class Katalog {
    private String idProduk;
    private String namaProduk;
    private String deskripsi;
    private double harga;
    private int stok;
    private String gambarUrl;
    private String rating;

    public Katalog(String idProduk, String namaProduk, String deskripsi, double harga, int stok, String gambarUrl, String rating) {
        this.idProduk = idProduk;
        this.namaProduk = namaProduk;
        this.deskripsi = deskripsi;
        this.harga = harga;
        this.stok = stok;
        this.gambarUrl = gambarUrl;
        this.rating = rating;
    }
    public String getIdProduk() {
        return idProduk;
    }

    public void setIdProduk(String idProduk) {
        this.idProduk = idProduk;
    }

    public String getNamaProduk() {
        return namaProduk;
    }

    public void setNamaProduk(String namaProduk) {
        this.namaProduk = namaProduk;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public double getHarga() {
        return harga;
    }

    public void setHarga(double harga) {
        this.harga = harga;
    }

    public int getStok() {
        return stok;
    }

    public void setStok(int stok) {
        this.stok = stok;
    }

    public String getGambarUrl() {
        return gambarUrl;
    }

    public void setGambarUrl(String gambarUrl) {
        this.gambarUrl = gambarUrl;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }
<<<<<<< HEAD

=======
>>>>>>> 1a02cbd933741699570c99fb13b1a5cbe97e8721
}


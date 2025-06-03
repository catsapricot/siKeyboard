package Models;

public abstract class Katalog {
    private int idProduk;
    private String namaProduk;
    private String deskripsi;
    private double harga;
    private int stok;
    private String gambarUrl;
    private int kuantitasDiKeranjang;

    public Katalog() {}   
    public Katalog(int idProduk, String namaProduk, String deskripsi, double harga, int stok, String gambarUrl) {
        this.idProduk = idProduk;
        this.namaProduk = namaProduk;
        this.deskripsi = deskripsi;
        this.harga = harga;
        this.stok = stok;
        this.gambarUrl = gambarUrl;
    }

    public int getIdProduk() {
        return idProduk;
    }

    public void setIdProduk(int idProduk) {
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

    public int getKuantitas() {
        return kuantitasDiKeranjang;
    }

    public void setKuantitas(int kuantitas) {
        if (kuantitas < 0) {
            this.kuantitasDiKeranjang = 0;
        } else {
            this.kuantitasDiKeranjang = kuantitas;
        }
    }
}

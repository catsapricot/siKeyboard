package model;

public abstract class Katalog {
    private String nama;
    private String jenis;
    private int harga;
    private int stock;

    public Katalog(String nama, String jenis, int harga, int stock) {
        this.nama = nama;
        this.jenis = jenis;
        this.harga = harga;
        this.stock = stock;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }
    public void setJenis(String jenis) {
        this.jenis = jenis;
    }
    public void setHarga(int harga) {
        this.harga = harga;
    }
    public void setStock(int stock) {
        this.stock = stock;
    }
    public String getNama() {
        return nama;
    }
    public String getJenis() {
        return jenis;
    }
    public int getHarga() {
        return harga;
    }
    public int getStock() {
        return stock;
    }
    public abstract void tampilkanInfoProduk();
}
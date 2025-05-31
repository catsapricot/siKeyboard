package Models;

public abstract class Katalog {
    private String idProduk;
    private String namaProduk;
    private String deskripsi;
    private double harga;
    private int stok;
    private String gambarUrl;
    private String rating;

    public katalog(String idProduk, String namaProduk, String deskripsi, double harga, int stok, String gambarUrl, String rating) {
        this.idProduk = idProduk;
        this.namaProduk = namaProduk;
        this.deskripsi = deskripsi;
        this.harga = harga;
        this.stok = stok;
        this.gambarUrl = gambarUrl;
        this.rating = rating;
    }
    public abstract void tampilkanProduk();
        
    
}

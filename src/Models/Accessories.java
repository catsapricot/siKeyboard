package Models;

public class Accessories extends Katalog {

    public Accessories() {
        super();
    }

    public Accessories(int idProduk, String namaProduk, String deskripsi, double harga, int stok, String gambarUrl) {
        super(idProduk, namaProduk, deskripsi, harga, stok, gambarUrl);
    }

    public Accessories(int idProduk, String namaProduk, double harga, int stok, String gambarUrl) {
        super(idProduk, namaProduk, harga, stok, gambarUrl);
    }

}

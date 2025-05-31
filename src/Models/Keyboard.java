package Models;

public class Keyboard extends Katalog {
    private String layout;
    private String switchType;
    private String[] warnaTersedia;

    public Keyboard(String idProduk, String namaProduk, String deskripsi, double harga, int stok, String gambarUrl, String rating, String layout, String switchType, String[] warnaTersedia) {
        super(idProduk, namaProduk, deskripsi, harga, stok, gambarUrl, rating);
        this.layout = layout;
        this.switchType = switchType;
        this.warnaTersedia = warnaTersedia;
    }
    @Override
    public void tampilkanProduk() {
        
    }

}

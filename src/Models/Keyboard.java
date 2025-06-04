package Models;

public class Keyboard extends Katalog {
    private String layout;
    private String switchType;
    private String warna;

    public Keyboard() {
        super();
    }

    public Keyboard(int idProduk, String namaProduk, String deskripsi, double harga, int stok, String gambarUrl,
            String layout, String switchType, String warna) {
        super(idProduk, namaProduk, deskripsi, harga, stok, gambarUrl);
        this.layout = layout;
        this.switchType = switchType;
        this.warna = warna;
    }

    public Keyboard(int idProduk, String namaProduk, double harga, int stok, String gambarUrl, String layout,
            String switchType) {
        super(idProduk, namaProduk, harga, stok, gambarUrl);
        this.layout = layout;
        this.switchType = switchType;
    }

    public String getLayout() {
        return layout;
    }

    public void setLayout(String layout) {
        this.layout = layout;
    }

    public String getSwitch() {
        return switchType;
    }

    public void setSwitch(String switchType) {
        this.switchType = switchType;
    }

    public String getWarna() {
        return warna;
    }

    public void setWarna(String warna) {
        this.warna = warna;
    }

}

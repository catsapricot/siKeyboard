package Models;

import java.util.ArrayList;
import java.util.List;

public class Toko {
    private List<Katalog> daftarKatalog;

    public Toko() {
        this.daftarKatalog = new ArrayList<>();
    }
    
    public List<Katalog> getDaftarKatalog() {
        return this.daftarKatalog;
    }
    /*  ini ga tau bener pa ga 
    public void setDaftarKatalog(List<Katalog> daftarKatalog) {
        this.daftarKatalog = daftarKatalog;
    }
        */
}

package model;

public class Admin extends Role{
    private String security;

    public Admin(String nama, String id, String security) {
        super(nama, id);
        this.security = security;
    }
    public void setSecurity(String security) {
        this.security = security;
    }
    public String getSecurity() {
        return this.security;
    }
    @Override
    public void login() {
        System.out.println("Lakukan Login!"); // Test
    }
}

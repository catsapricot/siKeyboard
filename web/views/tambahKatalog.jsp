<%@ page import="java.sql.*, Services.DBConnection" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nama = request.getParameter("nama");
    String jenis = request.getParameter("jenis");
    String layout = request.getParameter("layout");
    String switchType = request.getParameter("switch");
    int harga = Integer.parseInt(request.getParameter("harga"));
    int stock = Integer.parseInt(request.getParameter("stock"));
    String gambar = request.getParameter("gambar");

    DBConnection db = new DBConnection();
    Connection con = null;
    PreparedStatement stmt = null;

    try {
        db.connect();
        con = db.getConnection();
        String sql = "INSERT INTO katalog (nama, jenis, harga, stock, url_gambar, layout_keyboard, switch_type) VALUES (?, ?, ?, ?, ?, ?, ?)";
        stmt = con.prepareStatement(sql);
        stmt.setString(1, nama);
        stmt.setString(2, jenis);
        stmt.setInt(3, harga);
        stmt.setInt(4, stock);
        stmt.setString(5, gambar);
        stmt.setString(6, jenis.equals("Keyboard") ? layout : null);
        stmt.setString(7, jenis.equals("Keyboard") ? switchType : null);
        stmt.executeUpdate();
        response.sendRedirect("dashboardAdmin.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Gagal menambahkan data: " + e.getMessage());
    } finally {
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>

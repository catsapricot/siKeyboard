<%@ page import="Services.DBConnection" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
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

        String sql = "UPDATE katalog SET nama = ?, jenis = ?, harga = ?, stock = ?, url_gambar = ?, layout_keyboard = ?, switch_type = ? WHERE id_katalog = ?";
        stmt = con.prepareStatement(sql);
        stmt.setString(1, nama);
        stmt.setString(2, jenis);
        stmt.setInt(3, harga);
        stmt.setInt(4, stock);
        stmt.setString(5, gambar);
        stmt.setString(6, jenis.equals("Keyboard") ? layout : null);
        stmt.setString(7, jenis.equals("Keyboard") ? switchType : null);
        stmt.setInt(8, id);

        stmt.executeUpdate();
        response.sendRedirect("dashboardAdmin.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Update gagal: " + e.getMessage());
    } finally {
        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
        if (con != null) try { con.close(); } catch (SQLException e) {}
    }
%>

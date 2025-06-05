<%@ page import="java.sql.*, Services.DBConnection" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    DBConnection db = new DBConnection();
    Connection con = null;
    PreparedStatement stmt = null;

    try {
        db.connect();
        con = db.getConnection();
        String sql = "DELETE FROM katalog WHERE id_katalog = ?";
        stmt = con.prepareStatement(sql);
        stmt.setInt(1, id);
        stmt.executeUpdate();
        response.sendRedirect("dashboardAdmin.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Gagal menghapus data: " + e.getMessage());
    } finally {
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>

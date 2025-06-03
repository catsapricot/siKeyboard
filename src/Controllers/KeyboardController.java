package Controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Models.Keyboard;
import Services.DBConnection;
import java.util.ArrayList;

@WebServlet("/keyboard")
public class KeyboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServtletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        ArrayList<Keyboard> keyboards = new ArrayList<>();
        DBConnection db = new DBConnection();
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM katalog WHERE jenis = ?";
            PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
            pstmt.setString(1, "Keyboard");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Keyboard kb = new Keyboard();
                kb.setIdProduk(rs.getInt("id_katalog"));
                kb.setNamaProduk(rs.getString("nama"));
                kb.setHarga(rs.getInt("harga"));
                kb.setStok(rs.getInt("stok"));
                kb.setLayout(rs.getString("layout_keyboard"));
                kb.setSwitch(rs.getString("switch_type"));
                kb.setGambarUrl(rs.getString("url_gambar"));
                keyboards.add(kb);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while retrieving keyboards.");
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            db.disconnect();
        }

        request.setAttribute("keyboards", keyboards);
        request.getRequestDispatcher("/web/views/Keyboard.jsp").forward(request, response);
    }
}

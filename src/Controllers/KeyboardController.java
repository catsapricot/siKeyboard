package Controllers;

import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Models.Keyboard;

@WebServlet("/keyboard")
public class KeyboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        ArrayList<Keyboard> keyboards = new ArrayList<>();
        String url = "jdbc:mysql://localhost:3306/sikeyboard";
        String user = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            String sql = "SELECT * FROM katalog WHERE jenis = 'Keyboard'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

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

            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("keyboards", keyboards);
        request.getRequestDispatcher("../views/Keyboard.jsp").forward(request, response);
    }
}
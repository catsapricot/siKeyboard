<%@ page import="Models.Keyboard" %>
<%@ page import="Models.Accessories" %>
<%@ page import="Services.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Dashboard Admin</title>
    <style>
        .form-section { margin: 20px 0; padding: 10px; border: 1px solid #ccc; width: 50%; }
    </style>
</head>
<body>

<h2>Kelola Katalog</h2>

<!-- Form Tambah Katalog -->
<div class="form-section">
    <h3>Tambah Katalog</h3>
    <form action="tambahKatalog.jsp" method="post">
        <label>Nama:</label>
        <input type="text" name="nama" required><br>

        <label>Jenis:</label>
        <select name="jenis" onchange="toggleNewKeyboardFields(this.value)" required>
            <option value="Keyboard">Keyboard</option>
            <option value="Accessories">Accessories</option>
        </select><br>

        <div id="newKeyboardFields">
            <label>Layout:</label>
            <input type="text" name="layout"><br>

            <label>Switch:</label>
            <input type="text" name="switch"><br>
        </div>

        <label>Harga:</label>
        <input type="number" name="harga" required><br>

        <label>Stock:</label>
        <input type="number" name="stock" required><br>

        <label>URL Gambar:</label>
        <input type="text" name="gambar"><br>

        <button type="submit">Tambah</button>
    </form>
</div>

<table border="1" class="table table-bordered">
    <thead>
        <tr>
            <th>Nama</th>
            <th>Jenis</th>
            <th>Layout</th>
            <th>Switch</th>
            <th>Harga</th>
            <th>Stock</th>
            <th>Gambar</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <%
            DBConnection db = new DBConnection();
            Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                db.connect();
                con = db.getConnection();
                String sql = "SELECT * FROM katalog ORDER BY id_katalog ASC";
                stmt = con.prepareStatement(sql);
                rs = stmt.executeQuery();

                while (rs.next()) {
                    String jenis = rs.getString("jenis");
        %>
        <tr>
            <td><%= rs.getString("nama") %></td>
            <td><%= jenis %></td>
            <td><%= jenis.equals("Keyboard") ? rs.getString("layout_keyboard") : "-" %></td>
            <td><%= jenis.equals("Keyboard") ? rs.getString("switch_type") : "-" %></td>
            <td>Rp <%= rs.getInt("harga") %></td>
            <td><%= rs.getInt("stock") %></td>
            <td><img src="<%= rs.getString("url_gambar") %>" width="100"></td>
            <td>
                <button onclick="editKatalog(<%= rs.getInt("id_katalog") %>)">Edit</button>
                <a href="hapusKatalog.jsp?id=<%= rs.getInt("id_katalog") %>" onclick="return confirm('Yakin hapus data ini?')">Hapus</a>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <tr><td colspan="8">Gagal memuat data katalog.</td></tr>
        <%
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            }
        %>
    </tbody>
</table>

<!-- Form Edit -->
<div class="form-section" id="editForm" style="display:none;">
    <h3>Edit Katalog</h3>
    <form action="updateKatalog.jsp" method="post">
        <input type="hidden" name="id" id="editIndex">
        <label>Nama:</label>
        <input type="text" name="nama" id="editNama" required><br>

        <label>Jenis:</label>
        <select name="jenis" id="editJenis" onchange="toggleKeyboardFields()" required>
            <option value="Keyboard">Keyboard</option>
            <option value="Accessories">Accessories</option>
        </select><br>

        <div id="keyboardFields">
            <label>Layout:</label>
            <input type="text" name="layout" id="editLayout"><br>
            <label>Switch:</label>
            <input type="text" name="switch" id="editSwitch"><br>
        </div>

        <label>Harga:</label>
        <input type="number" name="harga" id="editHarga" required><br>
        <label>Stock:</label>
        <input type="number" name="stock" id="editStock" required><br>
        <label>URL Gambar:</label>
        <input type="text" name="gambar" id="editGambar"><br>

        <button type="submit">Simpan Perubahan</button>
    </form>
</div>

<!-- JavaScript -->
<script>
function toggleKeyboardFields() {
    const jenis = document.getElementById('editJenis').value;
    document.getElementById('keyboardFields').style.display = (jenis === 'Keyboard') ? 'block' : 'none';
}

function toggleNewKeyboardFields(val) {
    document.getElementById('newKeyboardFields').style.display = (val === 'Keyboard') ? 'block' : 'none';
}

var katalog = {};
<%
    db.connect();
    con = db.getConnection();
    stmt = con.prepareStatement("SELECT * FROM katalog");
    rs = stmt.executeQuery();
    while (rs.next()) {
        String jenis = rs.getString("jenis");
%>
katalog[<%= rs.getInt("id_katalog") %>] = {
    nama: "<%= rs.getString("nama").replace("\"", "\\\"") %>",
    jenis: "<%= jenis %>",
    layout: "<%= jenis.equals("Keyboard") ? rs.getString("layout_keyboard") : "" %>",
    switch: "<%= jenis.equals("Keyboard") ? rs.getString("switch_type") : "" %>",
    harga: <%= rs.getInt("harga") %>,
    stock: <%= rs.getInt("stock") %>,
    gambar: "<%= rs.getString("url_gambar") %>"
};
<%
    }
    if (rs != null) rs.close();
    if (stmt != null) stmt.close();
    if (con != null) con.close();
%>

function editKatalog(id) {
    const item = katalog[id];
    document.getElementById('editIndex').value = id;
    document.getElementById('editNama').value = item.nama;
    document.getElementById('editJenis').value = item.jenis;
    document.getElementById('editLayout').value = item.layout;
    document.getElementById('editSwitch').value = item.switch;
    document.getElementById('editHarga').value = item.harga;
    document.getElementById('editStock').value = item.stock;
    document.getElementById('editGambar').value = item.gambar;
    toggleKeyboardFields();
    document.getElementById('editForm').style.display = 'block';
}
</script>

</body>
</html>

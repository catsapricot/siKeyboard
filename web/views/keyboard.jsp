<%@ page import="Models.Keyboard" %>
<%@ page import="Services.DBConnection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>siKeyboard - Keranjang</title>

    <link rel="stylesheet" href="../assets/style/keranjangStyle.css">
    <link rel="stylesheet" href="../assets/style/keyboardStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.cdnfonts.com/css/queensides" rel="stylesheet">
</head>

<body>
    <header class="header">
        <div class="header-container">
            <a href="#" class="header-logo">
                <img src="../assets/images/img-logo-sikeyboard-light.png" alt="siKeyboard Logo">
            </a>

            <nav class="navigation">
                <ul class="nav-list">
                    <li><a href="dashboard.jsp">Home</a></li>
                    <li class="nav-shop">
                        <a href="#" id="shop-link">Shop <i class="fa-solid fa-caret-down"></i></a>
                        <div class="dropdown-menu" id="shop-dropdown">
                            <a href="keyboard.jsp">Keyboard</a>
                            <a href="accessories.jsp">Accessories</a>
                        </div>
                    </li>
                </ul>
            </nav>

            <div class="header-icons">
                <a href="profile.jsp"><i class="fa-regular fa-user"></i></a>
                <a href="<%= request.getContextPath() %>/keranjang"><i class="fa-solid fa-cart-shopping"></i></a>
            </div>
        </div>
    </header>
    <main class="container">
        <div class="container">
            <header class="title-desc">
                <h1 class="main-title">Keyboard? Get on Board King</h1>
                <p class="subtitle">Pilih keyboard dan jadikkan milikmu sendiri!</p>
            </header>
        </div>
      
        <br />
        <br />

        <section class="product-grid">
            <%
                ArrayList<Keyboard> keyboards = new ArrayList<>();
                DBConnection db = new DBConnection();
                Connection con = null;
                String errorMessage = null; 

                try {
                    db.connect();
                    con = db.getConnection();
                    
                    if (con == null) {
                        throw new SQLException("Koneksi ke database gagal, objek Connection null.");
                    }

                    String sql = "SELECT * FROM katalog WHERE jenis = ?";
                    PreparedStatement stmt = con.prepareStatement(sql);
                    stmt.setString(1, "Keyboard");
                    ResultSet rs = stmt.executeQuery();

                    while (rs.next()) {
                        Keyboard kb = new Keyboard();
                        kb.setIdProduk(rs.getInt("id_katalog"));
                        kb.setNamaProduk(rs.getString("nama"));
                        kb.setHarga(rs.getInt("harga"));
                        kb.setStok(rs.getInt("stock"));
                        kb.setLayout(rs.getString("layout_keyboard"));
                        kb.setSwitch(rs.getString("switch_type"));
                        kb.setGambarUrl(rs.getString("url_gambar"));
                        keyboards.add(kb);
                    }
                } catch (Exception e) {
                    errorMessage = e.getMessage(); 
                    e.printStackTrace();
                } finally {
                    if (con != null) {
                        try {
                            con.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
                if (errorMessage != null) {
            %>
                    <div style="color: red; background-color: #ffcccc; border: 1px solid red; padding: 15px; margin: 20px;">
                        <strong>Terjadi Error:</strong> <%= errorMessage %>
                    </div>
            <%
                }

                if (errorMessage == null && keyboards.isEmpty()) {
            %>
                    <p>Belum ada produk keyboard yang tersedia.</p>
            <%
                }

                for (Keyboard kb : keyboards) {
            %>
                    <article class="product-card">
                    <a href="tampilkanProduk.jsp?id=<%= kb.getIdProduk() %>" class="product-link">
                        <img src="<%= kb.getGambarUrl() %>" alt="<%= kb.getNamaProduk() %>" class="product-image" />
                        <h2 class="product-title"><%= kb.getNamaProduk() %></h2>
                        <p class="product-price"><%= kb.getHarga() %> IDR</p>
                    </a>
                    </article>
            <%
                }
            %>
        </section>
    </main>
    
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-column">
                <h4>Contact Person</h4>
                <ul>
                    <li><a href="https://www.instagram.com/gaanip" target="_blank"><i class="fa-brands fa-instagram"></i> @gaaanip</a></li>
                    <li><a href="https://www.instagram.com/daisaq_ha" target="_blank"><i class="fa-brands fa-instagram"></i> @daisaq_ha</a></li>
                    <li><a href="https://www.instagram.com/tar4k4" target="_blank"><i class="fa-brands fa-instagram"></i> @tar4k4</a></li>
                    <li><a href="https://www.instagram.com/nazriel005" target="_blank"><i class="fa-brands fa-instagram"></i> @nazriel005</a></li>
                    <li><a href="https://www.instagram.com/muhzaiii" target="_blank"><i class="fa-brands fa-instagram"></i> @muhzaiii</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>Schedule</h4>
                <p>Senin - Sabtu: 9AM - 5PM WIB</p>
                <p>Sabtu: 9AM - 3PM WIB</p>
                <p>Slow response untuk hari libur.</p>
            </div>
            <div class="footer-column">
                <h4>Quick Links</h4>
                <div class="quick-links">
                    <a href="https://youtu.be/xvFZjo5PgG0?si=zrmxh0VI-_pa8Rxm" target="_blank"><i class="fa-brands fa-youtube"></i></a>
                    <a href="https://github.com/catsapricot/siKeyboard/tree/main" target="_blank"><i class="fa-brands fa-github"></i></a>
                </div>
            </div>
        </div>
    </footer>
    <script>
        const shopLink = document.getElementById('shop-link');
        const shopDropdown = document.getElementById('shop-dropdown');
        const navShopContainer = shopLink.parentElement; 

        if (shopLink && shopDropdown) {
            shopLink.addEventListener('click', function(event) {
                event.preventDefault();
                navShopContainer.classList.toggle('active');
            });

            window.addEventListener('click', function(event) {
                if (!navShopContainer.contains(event.target)) {
                    navShopContainer.classList.remove('active');
                }
            });
        };   
    
    </script>
</body>

</html>

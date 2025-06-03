<%@ page import="Models.Accessories" %>
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
    <%-- Menghubungkan ke file CSS. Pastikan path-nya benar sesuai struktur proyek Anda. --%>
    <link rel="stylesheet" href="../assets/style/keranjangStyle.css">
    <link rel="stylesheet" href="../assets/style/aksesorisStyle.css">
    <%-- Menghubungkan ke FontAwesome untuk ikon --%>
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
            <form class="search-bar" action="<%= request.getContextPath() %>/cart" method="POST">
                <input type="hidden" name="action" value="search"/>
                <input type="text" name="query" placeholder="Search" aria-label="Search"/>
                <button type="submit" aria-label="Submit search">
                    <img src="../assets/images/img-icon-search.png" alt="Search" width="28" height="28" />
                </button>
            </form>

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
                <a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
            </div>
        </div>
    </header>
    <main class="container">
        <div class="container">
            <header class="title-desc">
                <h1 class="main-title">Accesorries? No Worries</h1>
                <p class="subtitle">Hias keyboardmu sampai dunia tahu itu milikimu!</p>
            </header>
        </div>
        <section class="sort-section">
        <span class="sort-label">Sort by:</span>
        <div class="sort-select">
          Price
          <img src="img/arrow-drop-down.svg" alt="Dropdown arrow" width="9" height="9" />
        </div>
      </section>
      <section class="product-grid">
            <%
                ArrayList<Accessories> accessorieses = new ArrayList<>();
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
                    stmt.setString(1, "Accessories");
                    ResultSet rs = stmt.executeQuery();

                    while (rs.next()) {
                        Accessories ac = new Accessories();
                        ac.setIdProduk(rs.getInt("id_katalog"));
                        ac.setNamaProduk(rs.getString("nama"));
                        ac.setHarga(rs.getInt("harga"));
                        ac.setStok(rs.getInt("stock"));
                        ac.setGambarUrl(rs.getString("url_gambar"));
                        accessorieses.add(ac);
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

                if (errorMessage == null && accessorieses.isEmpty()) {
            %>
                    <p>Belum ada produk accessories yang tersedia.</p>
            <%
                }

                for (Accessories ac : accessorieses) {
            %>
                    <article class="product-card">
                    <a href="tampilkanProduk.jsp?id=<%= ac.getIdProduk() %>" class="product-link">
                        <img src="<%= ac.getGambarUrl() %>" alt="<%= ac.getNamaProduk() %>" class="product-image" />
                        <h2 class="product-title"><%= ac.getNamaProduk() %></h2>
                        <p class="product-price"><%= ac.getHarga() %> IDR</p>
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

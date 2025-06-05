<%@ page import="Models.Keyboard" %>
<%@ page import="Services.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    String productIdStr = request.getParameter("id");
    Keyboard product = null;
    String errorMessagePage = null;
    int productId = 0;

    if (productIdStr != null && !productIdStr.isEmpty()) {
        try {
            productId = Integer.parseInt(productIdStr);
            if (productId <= 0) {
                throw new NumberFormatException("ID produk harus positif.");
            }
        } catch (NumberFormatException e) {
            errorMessagePage = "Format ID produk tidak valid: " + productIdStr;
            e.printStackTrace();
        }
    } else {
        errorMessagePage = "ID produk tidak disertakan dalam request.";
    }

    if (errorMessagePage == null && productId > 0) {
        DBConnection db = new DBConnection();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            db.connect();
            con = db.getConnection();
            if (con == null) {
                throw new SQLException("Koneksi ke database gagal, objek Connection null.");
            }

            String sql = "SELECT * FROM katalog WHERE id_katalog = ? AND jenis = 'Keyboard'";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, productId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                product = new Keyboard();
                product.setIdProduk(rs.getInt("id_katalog"));
                product.setNamaProduk(rs.getString("nama"));
                product.setHarga(rs.getInt("harga"));
                product.setStok(rs.getInt("stock"));
                product.setLayout(rs.getString("layout_keyboard"));
                product.setSwitch(rs.getString("switch_type"));
                product.setGambarUrl(rs.getString("url_gambar"));
            } else {
                errorMessagePage = "Produk dengan ID " + productId + " tidak ditemukan atau bukan Keyboard.";
            }
        } catch (SQLException e) {
            errorMessagePage = "Terjadi kesalahan database: " + e.getMessage();
            e.printStackTrace();
        } catch (Exception e) {
            errorMessagePage = "Terjadi kesalahan umum: " + e.getMessage();
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else if (errorMessagePage == null && productId == 0) {
        if (productIdStr == null || productIdStr.isEmpty()) {
           errorMessagePage = "ID produk tidak disertakan.";
        } else if (productId <= 0 && !(productIdStr == null || productIdStr.isEmpty()) ){
             errorMessagePage = "ID produk tidak valid.";
        }
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>siKeyboard - <%= (product != null ? product.getNamaProduk() : "Detail Produk") %></title>

    <link rel="stylesheet" href="../assets/style/tampilkanProduk.css"> <%-- Pastikan CSS baru ada di file ini --%>
    <link rel="stylesheet" href="../assets/style/keranjangStyle.css">
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
                <a href="keranjang.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
            </div>
        </div>
    </header>

    <div class="main-content">
        <main class="container_tampilan">
            <% if (errorMessagePage != null) { %>
                <div style="color: red; background-color: #ffcccc; border: 1px solid red; padding: 15px; margin: 20px auto; width: 80%; text-align:center;">
                    <strong>Error:</strong> <%= errorMessagePage %>
                    <p><a href="keyboard.jsp" style="color: blue; text-decoration: underline;">Kembali ke daftar produk</a></p>
                </div>
            <% } else if (product != null) { %>
                <h1 style="margin-left: 140px; margin-top: 5px; margin-bottom: 20px;">Informasi Produk</h1>
                <div class="product-info">
                    <div class="product-image">
                        <img 
                            src="<%= product.getGambarUrl() %>" 
                            alt="<%= product.getNamaProduk() %>" 
                            /> 
                    </div>
                    <div class="product-details">
                        <div>
                            <div>
                                <h2 class="product-title-detail"><%= product.getNamaProduk() %></h2>
                                <span>Stock: <%= product.getStok() %></span>
                            </div>
                            <div class="product-price-detail"><%= product.getHarga() %> IDR</div>
                            <div class="product-spec">
                                <p><strong>Layout Keyboard:</strong> <%= (product.getLayout() != null && !product.getLayout().isEmpty() ? product.getLayout() : "N/A") %></p>
                                <p><strong>Tipe Switch:</strong> <%= (product.getSwitch() != null && !product.getSwitch().isEmpty() ? product.getSwitch() : "N/A") %></p>
                            </div>
                            <form action="${pageContext.request.contextPath}/keranjang" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="id" value="<%= product.getIdProduk() %>">
                                <input type="hidden" name="qty" value="1">
                                <button type="submit" class="add-to-cart">Tambah ke keranjang</button>
                            </form>
                        </div>
                    </div>
                </div>
            <% 
                String status = request.getParameter("status");
                if ("sukses".equals(status)) {
            %>
                <div style="color: green; background-color: #d4edda; border: 1px solid green; padding: 15px; margin: 20px;">
                    <strong>Berhasil menambahkan produk ke Keranjang</strong>
                </div>
            <% 
                } else if ("gagal".equals(status)) { 
            %>
                <div style="color: red; background-color: #f8d7da; border: 1px solid red; padding: 15px; margin: 20px;">
                    <strong>Tidak dapat menambahkan produk ke Keranjang</strong> 
                </div>
            <% 
                }
            }
            %>
        </main>
    </div>

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
                    <a href="https://www.youtube.com" target="_blank"><i class="fa-brands fa-youtube"></i></a>
                    <a href="https://github.com/catsapricot/siKeyboard/tree/main" target="_blank"><i class="fa-brands fa-github"></i></a>
                </div>
            </div>
        </div>
    </footer>

    <script>
        const shopLink = document.getElementById('shop-link');
        const shopDropdown = document.getElementById('shop-dropdown');
        const navShopContainer = shopLink ? shopLink.parentElement : null;

        if (shopLink && shopDropdown && navShopContainer) {
            shopLink.addEventListener('click', function(event) {
                event.preventDefault();
                navShopContainer.classList.toggle('active');
            });

            window.addEventListener('click', function(event) {
                if (navShopContainer && !navShopContainer.contains(event.target)) {
                    navShopContainer.classList.remove('active');
                }
            });
        };
    </script>
</body>
</html>
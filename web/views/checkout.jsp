<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- 
    CATATAN PENTING:
    Kode ini berasumsi bahwa di dalam Servlet Anda, Anda telah men-set sebuah session attribute
    bernama "cartItems". Contoh di servlet:
    
    List<CartItem> items = ... (logika mengambil item dari database);
    HttpSession session = request.getSession();
    session.setAttribute("cartItems", items);
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>siKeyboard - Keranjang</title>
    <%-- Menghubungkan ke file CSS. Pastikan path-nya benar sesuai struktur proyek Anda. --%>
    <link rel="stylesheet" href="../assets/style/checkoutStyle.css">
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

    <main class="main-content">
        <h1 class="checkout-title">Checkout</h1>
        
        <div class="checkout-container">
            <!-- Left Section -->
            <div class="left-section">
                <!-- Shipping Address -->
                <div class="address-section">
                    <h2 class="section-title">Alamat Pengiriman</h2>
                    <div class="address-content">
                        <p class="address-text">Jl. Adhiyaksa 2 No. 21, Sukapura, Kec. Dayeuhkolot, Kabupaten Bandung, Jawa Barat 40267</p>
                        <button class="change-btn" onclick="changeAddress()">Ganti</button>
                    </div>
                </div>

                <!-- Shipping Method -->
                <div class="shipping-section">
                    <h2 class="section-title">Metode Pengiriman</h2>
                    <div class="shipping-options">
                        <div class="shipping-option">
                            <span class="shipping-label">Reguler</span>
                            <img src="../assets/images/icons/arrow-drop-down.png" alt="Dropdown" class="dropdown-icon" onclick="toggleShippingOptions('regular')">
                        </div>
                        <div class="shipping-option">
                            <div>
                                <span class="shipping-price">SiCepat (<span class="price">11.000 IDR</span>)</span>
                            </div>
                            <img src="../assets/images/icons/arrow-drop-down.png" alt="Dropdown" class="dropdown-icon" onclick="toggleShippingOptions('sicepat')">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Section -->
            <div class="right-section">
                <div class="payment-section">
                    <h2 class="section-title">Metode Pembayaran</h2>

                    <div class="payment-option">
                        <input type="radio" id="pay-bank" name="paymentMethod" value="bank" checked onclick="selectPayment('bank')">
                        <label for="pay-bank" class="payment-label">Bank</label>
                    </div>

                    <div class="payment-option">
                        <input type="radio" id="pay-gopay" name="paymentMethod" value="gopay" onclick="selectPayment('gopay')">
                        <label for="pay-gopay" class="payment-label">Gopay</label>
                    </div>

                    <div class="payment-option">
                        <input type="radio" id="pay-pulsa" name="paymentMethod" value="pulsa" onclick="selectPayment('pulsa')">
                        <label for="pay-pulsa" class="payment-label">Pulsa</label>
                    </div>

                    <div class="payment-option">
                        <input type="radio" id="pay-credit" name="paymentMethod" value="credit" onclick="selectPayment('credit')">
                        <label for="pay-credit" class="payment-label">Kartu Kredit</label>
                    </div>

                    <!-- Transaction Summary -->
                    <div class="summary-section">
                        <h3 class="summary-title">Ringkasan Transaksi</h3>
                        <% 
                            String totalHarga = request.getParameter("total");
                            double total = Double.parseDouble(totalHarga);
                        %>
                        <div class="summary-row">
                            <span class="summary-label">Total Harga Barang</span>
                            <span class="summary-value"><%= total %></span>
                        </div>
                        
                        <div class="summary-row">
                            <span class="summary-label">Total Ongkos Kirim</span>
                            <span class="summary-value">25.000 IDR</span>
                        </div>
                        
                        <div class="summary-row total-row">
                            <span class="total-label">Total Tagihan</span>
                            <span class="total-value"><%= total + 25000 %></span>
                        </div>
                        
                        <form method="post" action="<%= request.getContextPath() %>/keranjang?action=checkout">
                            <button type="submit" class="pay-btn">
                                <span class="pay-btn-text">Bayar</span>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <% 
            String status = request.getParameter("status");
            if ("sukses".equals(status)) {
        %>
            <div style="color: green; background-color: #d4edda; border: 1px solid green; padding: 15px; margin: 20px;">
                <strong>Berhasil Checkout</strong>
            </div>
        <% 
            } else if ("gagal".equals(status)) { 
        %>
            <div style="color: red; background-color: #f8d7da; border: 1px solid red; padding: 15px; margin: 20px;">
                <strong>Gagal Checkout</strong> 
            </div>
        <% 
            }
        %>
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
                    <a href="https://github.com/catsapricot/siKeyboard/" target="_blank"><i class="fa-brands fa-github"></i></a>
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
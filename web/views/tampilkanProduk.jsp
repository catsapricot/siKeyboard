<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>siKeyboard - Keranjang</title>
        <link rel="stylesheet" href="../assets/style/keranjangStyle.css">
        <link rel="stylesheet" href="../assets/style/tampilkanProduk.css">
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
                    <a href="<%= request.getContextPath() %>/auth?action=logout"><i class="fa-solid fa-right-from-bracket"></i></a>
                </div>
            </div>
        </header>

        <div class="main-content">
            <main class="container_tampilan">
                <h1 style="margin-left: 140px; ">Informasi Produk</h1>
                <div class="product-info">
                    <div class="product-image">
                    <img
                        src="https://c.animaapp.com/mbfrcz398g0GN5/img/group-83.png"
                        alt="Voyager68 Wireless Mechanical Keyboard"
                    />
                    </div>
                    <div class="product-details">
                    <div>
                        <div>
                            <h2 class="product-title">Voyager68 Wireless Mechanical Keyboard by Press Play</h2>
                            <span>Stock 238</span>
                        </div>
                        <div class="product-price">869.999 IDR</div>
                        <div class="product-options">
                            <p class="option-title">Color</p>
                            <div class="option-buttons">
                            <button class="option-button active">Smokey Black</button>
                            <button class="option-button">Retro Purple</button>
                            <button class="option-button">Milky Purple</button>
                            </div>
                        </div>
                        <div class="product-options">
                            <p class="option-title">Switch</p>
                            <div class="option-buttons">
                            <button class="option-button active">KTT Kang White</button>
                            <button class="option-button">JWK Black T1</button>
                            <button class="option-button">JWK Black</button>
                            </div>
                            <button class="add-to-cart" >Tambah ke keranjang</button>
                        </div>
                        </div>
                    </div>
                </div>
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
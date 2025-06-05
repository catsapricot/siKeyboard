<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Models.Pengguna" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>siKeyboard - Keranjang</title>
        <%-- Menghubungkan ke file CSS. Pastikan path-nya benar sesuai struktur proyek Anda. --%>
        <link rel="stylesheet" href="../assets/style/keranjangStyle.css">
        <link rel="stylesheet" href="../assets/style/profile.css">
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

        <div class="main-content">
            <section class="ai">
                <h1>Account</h1>
                <div class="logout">
                    <a href="<%= request.getContextPath() %>/auth?action=logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
                </div>
            </section>
                <section class="ai">
                <%
                    Pengguna pengguna = (Pengguna) session.getAttribute("user");
                    if (pengguna != null) { %>
                    <p> Nama    : <%= session.getAttribute("nama")%></p>
                    <p> Username:<%= pengguna.getUsername()%></p>

                <%  }%>
            </section>
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.KatalogDAO" %>
<%@ page import="Models.Pengguna" %>
<%@ page import="Models.Katalog" %>
<%@ page import="Models.Keyboard" %>
<%@ page import="Models.Accessories" %>
<%@ page import="java.util.List" %>

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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/style/keranjangStyle.css">
    <%-- Menghubungkan ke FontAwesome untuk ikon --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.cdnfonts.com/css/queensides" rel="stylesheet">

</head>
<body>
    <header class="header">
        <div class="header-container">
            <a href="#" class="header-logo">
                <img src="<%= request.getContextPath() %>/assets/images/img-logo-sikeyboard-light.png" alt="siKeyboard Logo">
            </a>

            <nav class="navigation">
                <ul class="nav-list">
                    <li><a href="<%= request.getContextPath() %>/views/dashboard.jsp">Home</a></li>
                    <li class="nav-shop">
                        <a href="#" id="shop-link">Shop <i class="fa-solid fa-caret-down"></i></a>
                        <div class="dropdown-menu" id="shop-dropdown">
                            <a href="<%= request.getContextPath() %>/views/keyboard.jsp">Keyboard</a>
                            <a href="<%= request.getContextPath() %>/views/accessories.jsp">Accessories</a>
                        </div>
                    </li>
                </ul>
            </nav>

            <div class="header-icons">
                <a href="<%= request.getContextPath() %>/views/profile.jsp"><i class="fa-regular fa-user"></i></a>
                <a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
            </div>
        </div>
    </header>

    <main class="main-content">
        <div class="cart-container">
            <% 
                KatalogDAO kdao = new KatalogDAO();
                // int userid = (int) session.getAttribute("userId");
                List<Katalog> keranjang = kdao.getKeranjangByUserId(5);
                if (keranjang != null && !keranjang.isEmpty()) { 
            %>
                    <h1>Your cart</h1>

                    <div class="cart-header">
                        <div class="header-product">Product</div>
                        <div class="header-quantity">Quantity</div>
                        <div class="header-total">Total</div>
                    </div>

                    <div class="cart-items-container">
                        <% 
                            double totalHarga = 0;
                            for (Katalog katalogItem : keranjang) {
                        %>
                                <div class="cart-item" data-price="<%= katalogItem.getHarga() %>">
                                    <div class="product-details">
                                        <img src="<%= request.getContextPath() + katalogItem.getGambarUrl() %>" alt="<%= katalogItem.getNamaProduk() %>">
                                        <div class="product-info">
                                            <p class="product-name"><%= katalogItem.getNamaProduk() %></p>
                                            <p class="product-price">IDR <%= katalogItem.getHarga() %></p>
                                            <%
                                                if (katalogItem instanceof Keyboard) {
                                                    Keyboard itemKeyboard = (Keyboard) katalogItem;
                                            %>
                                                    <p class="product-spec">Switch: <%= itemKeyboard.getSwitch() %></p>
                                            <%  }%>        
        
                                        </div>
                                    </div>

                                    <div class="product-quantity">
                                        <form action="<%= request.getContextPath() %>/keranjang" method="POST" class="quantity-form">
                                            <input type="hidden" name="action" value="update">
                                            <input type="hidden" name="productId" value="<%= katalogItem.getIdProduk() %>">
                                            <div class="quantity-control">
                                                <button type="submit" name="quantity" value="<%= katalogItem.getKuantitas() - 1 %>" class="quantity-btn minus-btn">-</button>
                                                <input type="text" class="quantity-input" value="<%= katalogItem.getKuantitas() %>" readonly>
                                                <button type="submit" name="quantity" value="<%= katalogItem.getKuantitas() + 1 %>" class="quantity-btn plus-btn">+</button>
                                            </div>
                                        </form>
                                        <form action="<%= request.getContextPath() %>/keranjang" method="POST">
                                            <input type="hidden" name="action" value="remove">
                                            <input type="hidden" name="productId" value="<%= katalogItem.getIdProduk() %>">
                                            <button type="submit" class="remove-item-btn"><i class="fa-regular fa-trash-can"></i></button>
                                        </form>
                                    </div>

                                    <div class="product-total">
                                        <span class="item-total-price">IDR <%= katalogItem.getHarga() * katalogItem.getKuantitas() %></span>
                                    </div>
                                </div>
                        <%  
                                totalHarga += (katalogItem.getHarga() * katalogItem.getKuantitas());
                            } 
                        %>    
                    </div>
                    <div class="cart-summary">
                        <div class="grand-total">
                            <span>Total</span>
                            
                            <span id="grand-total-price">IDR <%= totalHarga %></span>
                        </div>
                        <a href="<%= request.getContextPath() %>/checkout.jsp" class="checkout-button">Checkout</a>
                    </div>
            <%  
                } else { 
            %>
                    <div class="empty-cart-message">
                        <p>Your cart is empty</p>
                        <a href="dashboard.jsp" class="continue-shopping-button">
                            Continue Shopping
                        </a>
                    </div>
            <%
                }
            %>
        </div>
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
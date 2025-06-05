<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.KatalogDAO" %>
<%@ page import="Models.Katalog" %>
<%@ page import="Models.Keyboard" %>
<%@ page import="Models.Accessories" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>siKeyboard - Keranjang</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/style/keranjangStyle.css">
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
            Object uid = session.getAttribute("userId");
            if (uid == null) {
        %>
                <div class="empty-cart-message">
                    <p style="color:red;">[DEBUG] Session userId NULL. Silakan login ulang.</p>
                    <a href="<%= request.getContextPath() %>/views/login.jsp" class="continue-shopping-button">Login</a>
                </div>
        <%
            } else {
                int userId = (int) uid;
                List<Katalog> keranjang = (List<Katalog>) request.getAttribute("keranjang");
                
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
                            <% if (katalogItem instanceof Keyboard) {
                                Keyboard kb = (Keyboard) katalogItem;
                            %>
                                <p class="product-spec">Switch: <%= kb.getSwitch() %></p>
                            <% } %>
                        </div>
                    </div>
                    <div class="product-quantity">
                        <form action="<%= request.getContextPath() %>/keranjang" method="POST">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="productId" value="<%= katalogItem.getIdProduk() %>">
                            <div class="quantity-control">
                                <button type="submit" name="quantity" value="<%= katalogItem.getKuantitas() - 1 %>">-</button>
                                <input type="text" value="<%= katalogItem.getKuantitas() %>" readonly>
                                <button type="submit" name="quantity" value="<%= katalogItem.getKuantitas() + 1 %>">+</button>
                            </div>
                        </form>
                        <form action="<%= request.getContextPath() %>/keranjang" method="POST">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="productId" value="<%= katalogItem.getIdProduk() %>">
                            <button type="submit" class="remove-item-btn"><i class="fa-regular fa-trash-can"></i></button>
                        </form>
                    </div>
                    <div class="product-total">
                        <span>IDR <%= katalogItem.getHarga() * katalogItem.getKuantitas() %></span>
                    </div>
                </div>
                <%
                        totalHarga += katalogItem.getHarga() * katalogItem.getKuantitas();
                    }
                %>
            </div>
            <div class="cart-summary">
                <div class="grand-total">
                    <span>Total</span>
                    <span>IDR <%= totalHarga %></span>
                </div>
                <a href="<%= request.getContextPath() %>/checkout.jsp" class="checkout-button">Checkout</a>
            </div>
        <%
  
            }
        %>
    </div>
</main>

<footer class="footer">
    <!-- Footer content same as before -->
</footer>

<script>
    const shopLink = document.getElementById('shop-link');
    const shopDropdown = document.getElementById('shop-dropdown');
    const navShopContainer = shopLink.parentElement;
    if (shopLink && shopDropdown) {
        shopLink.addEventListener('click', function (event) {
            event.preventDefault();
            navShopContainer.classList.toggle('active');
        });
        window.addEventListener('click', function (event) {
            if (!navShopContainer.contains(event.target)) {
                navShopContainer.classList.remove('active');
            }
        });
    }
</script>
</body>
</html>

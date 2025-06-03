<form action="/keranjang/tambah" method="post">
    <!-- ...opsi produk di sini jika perlu sebagai input tersembunyi... -->
    
</form>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>siKeyboard - Product Information</title>
    <link rel="stylesheet" href="../assets/style/tampilanProduk.css" />
    <!-- Jika menggunakan JSP, gunakan:
         <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
    -->
  </head>
  <body>
    <header>
      <nav class="container">
        <div class="logo">
          <img src="../assets/images/Group 130.png" alt="siKeyboard Logo" />

        </div>
        <div class="search-bar">
          <input type="text" placeholder="Search" />
          <button><img src="../assets/images/group 75.png" alt="Search" /></button>
        </div>
        <div class="nav-links">
          <a href="#">Home</a>
          <!-- Shop Dropdown -->
          <div class="dropdown">
            <button class="dropdown-button" onclick="toggleShopDropdown(event)">
              Shop<i class="fas fa-chevron-down"></i>
            </button>
            <div id="shopDropdown" class="dropdown-content">
              <a href="keyboard.jsp">Keyboard</a>
              <a href="accessories.jsp">Accessories</a>
            </div>
          </div>

          <a href="path-to-profile"><img src="../assets/images/account_circle.png" alt="Account" /></a>
          <a href="path-to-cart"><img src="../assets/images/Icon.png" alt="Cart" /></a>
        </div>
      </nav>
    </header>
    <main class="container">
      <h1>Informasi Produk</h1>
      <div class="product-info">
        <div class="product-image">
          <img src="img/voyager68-v2-1.jpg" alt="Voyager68 Wireless Mechanical Keyboard" />
        </div>
        <div class="product-details">
          <h2 class="product-title">Voyager68 Wireless Mechanical Keyboard by Press Play</h2>
          <div class="product-meta">
            <span>Terjual 2rb+</span>
            <span>4.9 (246 Rating)</span>
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
          </div>
        <a href="ISI DENGNA PATH KE CAR" class="add-to-cart-link">
            <button type="submit" class="add-to-cart">Tambah ke keranjang</button>
        </a>
        </div>
      </div>
    </main>
    <footer style="Margin-top: 20px;">
      <div class="container footer-content">
        <div class="footer-section">
          <h3>Contact Person</h3>
          <p>@gaanip</p>
          <p>@daisaq-ha</p>
          <p>@tar4k4</p>
          <p>@nazriel005</p>
          <p>@muhzaiii</p>
        </div>
        <div class="footer-section">
          <h3>Schedule</h3>
          <p>Senin - Sabtu: 9AM - 5PM WIB</p>
          <p>Sabtu: 9AM - 1PM WIB</p>
          <p>Slow response untuk hari libur.</p>
        </div>
        <div class="footer-section">
          <h3>Quick Links</h3>
          <div class="social-links">
            <a href="#"><img src="img/github.svg" alt="GitHub" /></a>
            <a href="#"><img src="img/youtube.svg" alt="YouTube" /></a>
          </div>
        </div>
      </div>
    </footer>
    <script>
      /* JavaScript for Dropdown */
      function toggleShopDropdown(event) {
        event.stopPropagation();
        const dropdownMenu = document.getElementById("shopDropdown");
        dropdownMenu.classList.toggle("show");
      }

      // Close dropdown if clicked outside
      window.onclick = function (event) {
        if (!event.target.matches('.dropdown-button') && !event.target.matches('.dropdown-button i')) {
          var dropdownMenu = document.getElementById("shopDropdown");
          if (dropdownMenu.classList.contains('show')) {
            dropdownMenu.classList.remove('show');
          }
        }
      }
    </script>
  </body>
</html>
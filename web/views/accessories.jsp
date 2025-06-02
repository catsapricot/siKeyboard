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

      <br />
      <br />

      <section class="product-grid">
        <article class="product-card">
          <img src="img/5qan43j5-2-2.png" alt="Tiger 80 with PBTFans WoB" class="product-image" />
          <h2 class="product-title">Tiger 80 with PBTFans WoB</h2>
          <p class="product-price">3.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img src="img/voyager68-v2-1-3.png" alt="NK87 Aluminum Edition Nebula Pink x GMK WoB" class="product-image" />
          <h2 class="product-title">NK87 Aluminum Edition Nebula Pink x GMK WoB</h2>
          <p class="product-price">5.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img
            src="img/jan-loyde-cabrera-stonbjkc-qy-unsplash-1-3.png"
            alt="NK87 Aluminum Edition Nebula Pink x GMK WoB"
            class="product-image"
          />
          <h2 class="product-title">NK87 Aluminum Edition Nebula Pink x GMK WoB</h2>
          <p class="product-price">5.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img src="img/y2nrik6z-1-3.png" alt="MK870 x Akko Psittacus" class="product-image" />
          <h2 class="product-title">MK870 x Akko Psittacus</h2>
          <p class="product-price">10.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img src="img/image.png" alt="Tiger 80 with PBTFans WoB" class="product-image" />
          <h2 class="product-title">Tiger 80 with PBTFans WoB</h2>
          <p class="product-price">3.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img src="img/voyager68-v2-1-2.png" alt="NK87 Aluminum Edition Nebula Pink x GMK WoB" class="product-image" />
          <h2 class="product-title">NK87 Aluminum Edition Nebula Pink x GMK WoB</h2>
          <p class="product-price">5.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img
            src="img/jan-loyde-cabrera-stonbjkc-qy-unsplash-1-2.png"
            alt="NK87 Aluminum Edition Nebula Pink x GMK WoB"
            class="product-image"
          />
          <h2 class="product-title">NK87 Aluminum Edition Nebula Pink x GMK WoB</h2>
          <p class="product-price">5.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img src="img/y2nrik6z-1-2.png" alt="MK870 x Akko Psittacus" class="product-image" />
          <h2 class="product-title">MK870 x Akko Psittacus</h2>
          <p class="product-price">10.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img src="img/5qan43j5-2.png" alt="Tiger 80 with PBTFans WoB" class="product-image" />
          <h2 class="product-title">Tiger 80 with PBTFans WoB</h2>
          <p class="product-price">3.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img src="img/voyager68-v2-1-4.png" alt="NK87 Aluminum Edition Nebula Pink x GMK WoB" class="product-image" />
          <h2 class="product-title">NK87 Aluminum Edition Nebula Pink x GMK WoB</h2>
          <p class="product-price">5.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img
            src="img/jan-loyde-cabrera-stonbjkc-qy-unsplash-1.png"
            alt="NK87 Aluminum Edition Nebula Pink x GMK WoB"
            class="product-image"
          />
          <h2 class="product-title">NK87 Aluminum Edition Nebula Pink x GMK WoB</h2>
          <p class="product-price">5.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img src="img/y2nrik6z-1.png" alt="MK870 x Akko Psittacus" class="product-image" />
          <h2 class="product-title">MK870 x Akko Psittacus</h2>
          <p class="product-price">10.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img src="img/5qan43j5-2-3.png" alt="Tiger 80 with PBTFans WoB" class="product-image" />
          <h2 class="product-title">Tiger 80 with PBTFans WoB</h2>
          <p class="product-price">3.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img src="img/voyager68-v2-1.png" alt="NK87 Aluminum Edition Nebula Pink x GMK WoB" class="product-image" />
          <h2 class="product-title">NK87 Aluminum Edition Nebula Pink x GMK WoB</h2>
          <p class="product-price">5.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img
            src="img/jan-loyde-cabrera-stonbjkc-qy-unsplash-1-4.png"
            alt="NK87 Aluminum Edition Nebula Pink x GMK WoB"
            class="product-image"
          />
          <h2 class="product-title">NK87 Aluminum Edition Nebula Pink x GMK WoB</h2>
          <p class="product-price">5.499.000 IDR</p>
        </article>
        <article class="product-card">
          <img src="img/y2nrik6z-1-4.png" alt="MK870 x Akko Psittacus" class="product-image" />
          <h2 class="product-title">MK870 x Akko Psittacus</h2>
          <p class="product-price">10.499.000 IDR</p>
        </article>
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

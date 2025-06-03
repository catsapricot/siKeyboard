<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>siKeyboard</title>
    <%-- Menghubungkan ke file CSS. Pastikan path-nya benar sesuai struktur proyek Anda. --%>
    <link rel="stylesheet" href="../assets/style/keranjangStyle.css">
    <link rel="stylesheet" href="../assets/style/dashboardStyle.css">
    <%-- Menghubungkan ke FontAwesome untuk ikon --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.cdnfonts.com/css/queensides" rel="stylesheet">
    <style>
        .catalog-settings-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 60vh;
            background: #f9f9f9;
        }
        .catalog-settings {
            background: #fff;
            padding: 2rem 3rem;
            border-radius: 16px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.08);
            text-align: center;
        }
        .catalog-settings h2 {
            font-family: 'Montserrat', sans-serif;
            margin-bottom: 1.5rem;
        }
        .catalog-actions {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            align-items: center;
        }
        .catalog-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: #3a3a3a;
            color: #fff;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            font-size: 1rem;
            transition: background 0.2s;
        }
        .catalog-btn:hover {
            background: #222;
        }
        .catalog-search-form {
            display: flex;
            gap: 0.5rem;
            align-items: center;
        }
        .catalog-search-form input[type="text"] {
            padding: 0.5rem 1rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
        }
        .catalog-search-form button {
            background: #3a3a3a;
            color: #fff;
            border: none;
            padding: 0.5rem 1.2rem;
            border-radius: 6px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.3rem;
            font-size: 1rem;
            transition: background 0.2s;
        }
        .catalog-search-form button:hover {
            background: #222;
        }
    </style>
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
    <main class="catalog-settings-container">
        <%-- Daftar katalog dummy, ganti dengan data dari backend/database jika ada --%>
<%
    class Katalog {
        public int id;
        public String nama;
        public String deskripsi;
        public Katalog(int id, String nama, String deskripsi) {
            this.id = id;
            this.nama = nama;
            this.deskripsi = deskripsi;
        }
    }
    java.util.List<Katalog> daftarKatalog = new java.util.ArrayList<>();
    daftarKatalog.add(new Katalog(1, "Keyboard Gaming", "Keyboard mekanik RGB untuk gaming."));
    daftarKatalog.add(new Katalog(2, "Keycaps Set", "Keycaps PBT premium."));
    daftarKatalog.add(new Katalog(3, "Switch Tester", "Alat untuk mencoba berbagai switch."));
%>
    <section style="max-width:800px;margin:2rem auto;">
    <h3 style="font-family:'Montserrat',sans-serif;margin-bottom:1rem;">Daftar Katalog</h3>
    <section style="max-width:800px;margin:2rem auto 0;justify-items:flex-end;">
        <form class="catalog-search-form" action="" method="get" style="margin-bottom:1.5rem;">
        <input type="text" name="search" placeholder="Cari nama katalog..." value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"/>
        <button type="submit"><i class="fa-solid fa-magnifying-glass"></i> Cari</button>
        </form>
    </section>
    <!-- Tombol untuk menambah katalog -->
    <div style="margin-bottom:1.5rem;display:flex;">
        <button id="tambahKatalogBtn" class="catalog-btn" type="button">
            <i class="fa-solid fa-plus"></i> Tambah Katalog
        </button>
    </div>
    <!-- Section form tambah katalog (hidden by default) -->
    <section id="formTambahKatalogSection" style="display:none;margin-bottom:2rem;">
        <form action="tambahKatalog.jsp" method="post" style="background:#fff;padding:1.5rem 2rem;border-radius:12px;box-shadow:0 2px 8px rgba(0,0,0,0.06);max-width:500px;margin:auto;">
            <h4 style="font-family:'Montserrat',sans-serif;margin-bottom:1rem;">Tambah Katalog Baru</h4>
            <div style="margin-bottom:1rem;">
                <label for="namaKatalog" style="display:block;margin-bottom:0.3rem;">Nama Katalog</label>
                <input type="text" id="namaKatalog" name="nama" required style="width:100%;padding:0.5rem;border-radius:6px;border:1px solid #ccc;"/>
            </div>
            <div style="margin-bottom:1rem;">
                <label for="jenisatKalog" style="display:block;margin-bottom:0.3rem;">Jenis</label>
                <textarea id="jenisKatalog" name="jenis" rows="3" required style="width:100%;padding:0.5rem;border-radius:6px;border:1px solid #ccc;"></textarea>
            </div>
            <div style="margin-bottom:1rem;">
                <label for="layoutKatalog" style="display:block;margin-bottom:0.3rem;">Layout</label>
                <textarea id="layoutKatalog" name="jenis" rows="3" required style="width:100%;padding:0.5rem;border-radius:6px;border:1px solid #ccc;"></textarea>
            </div>
            <div style="margin-bottom:1rem;">
                <label for="hargaKatalog" style="display:block;margin-bottom:0.3rem;">Harga</label>
                <textarea id="hargaKatalog" name="jenis" rows="3" required style="width:100%;padding:0.5rem;border-radius:6px;border:1px solid #ccc;"></textarea>
            </div>
            <div style="margin-bottom:1rem;">
                <label for="stockKatalog" style="display:block;margin-bottom:0.3rem;">Stock</label>
                <textarea id="stockKatalog" name="jenis" rows="3" required style="width:100%;padding:0.5rem;border-radius:6px;border:1px solid #ccc;"></textarea>
            </div>
            <div style="text-align:right;">
                <button type="button" id="batalTambahKatalog" class="catalog-btn" style="background:#bbb;margin-right:0.5rem;">Batal</button>
                <button type="submit" class="catalog-btn"><i class="fa-solid fa-check"></i> Simpan</button>
            </div>
        </form>
    </section>
    <script>
        const tambahBtn = document.getElementById('tambahKatalogBtn');
        const formSection = document.getElementById('formTambahKatalogSection');
        const batalBtn = document.getElementById('batalTambahKatalog');
        tambahBtn.addEventListener('click', () => {
            formSection.style.display = 'block';
            tambahBtn.style.display = 'none';
        });
        batalBtn.addEventListener('click', () => {
            formSection.style.display = 'none';
            tambahBtn.style.display = 'inline-flex';
        });
    </script>
    <table style="width:100%;border-collapse:collapse;background:#fff;border-radius:12px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.06);">
        <thead style="background:#f2f2f2;">
            <tr>
                <th style="padding:0.75rem;">ID</th>
                <th style="padding:0.75rem;">Nama Katalog</th>
                <th style="padding:0.75rem;">Jenis</th>
                <th style="padding:0.75rem;">Layout</th>
                <th style="padding:0.75rem;">Harga</th>
                <th style="padding:0.75rem;">Stock</th>
                <th style="padding:0.75rem;">Aksi</th>
            </tr>
        </thead>
        <tbody>
        <% for(Katalog k : daftarKatalog) { %>
            <tr>
                <td style="padding:0.75rem;text-align:center;"><%= k.id %></td>
                <td style="padding:0.75rem;"><%= k.nama %></td>
                <td style="padding:0.75rem;"><%= k.jenis %></td>
                <td style="padding:0.75rem;"><%= k.layout %></td>
                <td style="padding:0.75rem;"><%= k.harga %></td>
                <td style="padding:0.75rem;"><%= k.stock %></td>
                <td style="padding:0.75rem;text-align:center;">
                    <form action="editKatalogForm.jsp" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="<%= k.id %>"/>
                        <button type="submit" class="catalog-btn" style="padding:0.4rem 0.8rem;font-size:0.95rem;"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                    </form>
                    <form action="hapusKatalog.jsp" method="post" style="display:inline;" onsubmit="return confirm('Yakin ingin menghapus katalog ini?');">
                        <input type="hidden" name="id" value="<%= k.id %>"/>
                        <button type="submit" class="catalog-btn" style="background:#c0392b;padding:0.4rem 0.8rem;font-size:0.95rem;"><i class="fa-solid fa-trash"></i> Hapus</button>
                    </form>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
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
</main>
</body>
</html>
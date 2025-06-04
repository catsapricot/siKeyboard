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

            </div>
        </header>

        <div class="main-content">
            <main class="container_tampilan">
                <h1 style="margin-left: 140px; ">Kelola Katalog Keyboard</h1>
                <div class="product-info">
                    <section>
                    <div>
                    <input type="text" id="searchInput" placeholder="Cari katalog..." />
                    <button id="searchBtn" onclick="searchKatalog()" type="button" class="btn btn-info" >Cari</button>
                    <button id="addBtn" onclick="showAddForm()" type="button" class="btn btn-info">Tambah Katalog</button>
                    </div>

                    <table class="catalog-table" id="catalogTable">
                    <thead>
                        <tr>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>Jenis</th>
                        <th>Layout</th>
                        <th>Switch</th>
                        <th>Gambar</th>
                        <th>Harga</th>
                        <th>Stok</th>
                        <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody id="catalogBody"></tbody>
                    </table>
                </section>

                <!-- Form Tambah -->
                <section class="cs">
                    <form class="add_form" id="addForm" style="display:none;" onsubmit="addKatalog(event)">
                    <h3 class="mh">Tambah Katalog Baru</h3>
                    <label>ID</label><input type="text" id="id" required />
                    <label>Nama Keyboard</label><input type="text" id="nama" required />
                    <label>Jenis</label><input type="text" id="jenis" required />
                    <label>Layout</label><input type="text" id="layout" required />
                    <label>Switch</label><input type="text" id="switch" required />
                    <label>Gambar (URL)</label><input type="text" id="gambar" required />
                    <label>Harga</label><input type="text" id="harga" required />
                    <label>Stok</label><input type="text" id="stock" required />
                    <button type="submit" id="submitAdd">Simpan</button>
                    <button type="button" onclick="hideAddForm()" style="background:#ccc;color:#000;margin-left:1rem;">Batal</button>
                    </form>

                    <!-- Form Edit -->
                    <form class="add_form" id="editForm" style="display:none;" onsubmit="saveEdit(event)">
                    <h3 class="mh">Edit Katalog</h3>
                    <input type="hidden" id="editIndex" />
                    <label>ID</label><input type="text" id="editId" required />
                    <label>Nama Keyboard</label><input type="text" id="editNama" required />
                    <label>Jenis</label><input type="text" id="editJenis" required />
                    <label>Layout</label><input type="text" id="editLayout" required />
                    <label>Switch</label><input type="text" id="editSwitch" required />
                    <label>Gambar (URL)</label><input type="text" id="editGambar" required />
                    <label>Harga</label><input type="text" id="editHarga" required />
                    <label>Stok</label><input type="text" id="editStock" required />
                    <button type="submit" id="submitEdit">Simpan Perubahan</button>
                    <button type="button" onclick="hideEditForm()" style="background:#ccc;color:#000;margin-left:1rem;">Batal</button>
                    </form>
                    </div>
                </section>
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
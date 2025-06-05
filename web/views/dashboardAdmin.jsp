<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>siKeyboard - Keranjang</title>
        <link rel="stylesheet" href="../assets/style/keranjangStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;700&display=swap" rel="stylesheet" />
        <link href="https://fonts.cdnfonts.com/css/queensides" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <style>
            .tombol {
                display: flex;
                align-items: right;
            }
            .input-bar{
                width: 100%;
                max-width: 350px;
            }
            .tablean {
                width: 100%;
                max-width: 1000px;
                margin: 10px;
            }
            label {
                display: block;
                margin-top: 1rem;
            }
            .dalem_tombol {
                display: flex;
                gap: 10px;
                margin-left: 10px;
            }
        </style>
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
        <section class="container_tampilan">
            <h2>Kelola Katalog Keyboard</h2>
            <div class="tombol">
                <input type="text" id="searchInput" class="input-bar input-group" placeholder="Cari katalog..." />
                <div class="dalem_tombol">
                    <button class="btn btn-primary" onclick="searchKatalog()">Cari</button>
                    <button class="btn btn-primary" onclick="showAddForm()">Tambah Katalog</button>
                    <button class="btn btn-primary" onclick="showAddForm()">Tambah Aksesoris</button>
                </div>
            </div>
            <table class="table table-bordered" id="catalogTable">
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>Jenis</th>
                        <th>Layout</th>
                        <th>Switch</th>
                        <th>Harga</th>
                        <th>Stock</th>
                        <th>Gambar</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody id="catalogBody">
                    <!-- Data katalog akan diisi di sini -->
                </tbody>
            </table>
            <form class="add-form tablean" id="addForm" style="display:none;" onsubmit="addKatalog(event)">
                <h3>Tambah Katalog Baru</h3>
                <label for="nama">Nama Keyboard</label>
                <input type="text" class="input-bar input-group" id="nama" required /></br>
                <label for="jenis">Jenis</label>
                <input type="text" class="input-bar input-group"  id="jenis" required /></br>
                <label for="layout">Layout</label>
                <input type="text" class="input-bar input-group"  id="layout" required /></br>
                <label for="Switch">Switch</label>
                <input type="text" class="input-bar input-group"  id="Switch" required /></br>
                <label for="harga">Harga</label>
                <input type="text" class="input-bar input-group"  id="harga" required /></br>
                <label for="stock">Stock</label>
                <input type="text" class="input-bar input-group"  id="stock" required /></br>
                <label for="gambar">Gambar (URL)</label>
                <input type="text" class="input-bar input-group"  id="gambar" required /></br>
                <button class="btn btn-primary"  type="submit">Simpan</button>
                <button class="btn btn-primary"  type="button" onclick="hideAddForm()">Batal</button>
            </form>
            
            <form class="add-form" id="editForm" style="display:none;" onsubmit="saveEdit(event)">
                    <h3>Edit Katalog</h3>
                    <input type="hidden" class="input-bar input-group"  id="editIndex" />
                    <label for="editNama">Nama Keyboard</label>
                    <input type="text" class="input-bar input-group"  id="editNama" required />
                    <label for="editJenis">Jenis</label>
                    <input type="text" class="input-bar input-group"  id="editJenis" required />
                    <label for="editLayout">Layout</label>
                    <input type="text" class="input-bar input-group"  id="editLayout" required />
                    <label for="editSwitch">Switch</label>
                    <input type="text" class="input-bar input-group"  id="editSwitch" required />
                    <label for="editHarga">Harga</label>
                    <input type="text" class="input-bar input-group"  id="editHarga" required />
                    <label for="editStock">Stock</label>
                    <input type="text" class="input-bar input-group"  id="editStock" required />
                    <label for="editGambar">Gambar (URL)</label>
                    <input type="text" class="input-bar input-group"  id="editGambar" required />
                    <button class="btn btn-primary" type="submit">Simpan Perubahan</button>
                    <button class="btn btn-primary" type="button" onclick="hideEditForm()" style="background:#ccc;color:#000;margin-left:1rem;">Batal</button>
            </form>
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
        // Dummy data katalog
        function renderKatalog(data = katalog) {
            const tbody = document.getElementById('catalogBody');
            tbody.innerHTML = '';
            data.forEach((item, idx) => {
                tbody.innerHTML += `
                    <tr>
                        <td>${item.nama}</td>
                        <td>${item.layout}</td>
                        <td><img src="${item.gambar}" alt="${item.nama}" /></td>
                        <td>
                            <button class="btn btn-primary action-btn edit-btn" onclick="editKatalog(${idx})">Edit</button>
                            <button class="btn btn-primary action-btn delete-btn" onclick="deleteKatalog(${idx})">Hapus</button>
                        </td>
                    </tr>
                `;
            });
        }

        function searchKatalog() {
            const keyword = document.getElementById('searchInput').value.toLowerCase();
            const filtered = katalog.filter(item =>
                item.nama.toLowerCase().includes(keyword) ||
                item.layout.toLowerCase().includes(keyword)
            );
            renderKatalog(filtered);
        }

        function showAddForm() {
            document.getElementById('addForm').style.display = 'block';
        }

        function hideAddForm() {
            document.getElementById('addForm').reset();
            document.getElementById('addForm').style.display = 'none';
        }

        function addKatalog(e) {
            e.preventDefault();
            const nama = document.getElementById('nama').value;
            const jenis = document.getElementById('jenis').value;
            const layout = document.getElementById('layout').value;
            const switchType = document.getElementById('Switch').value;
            const harga = document.getElementById('harga').value;
            const stock = document.getElementById('stock').value;
            const gambar = document.getElementById('gambar').value;
            katalog.push({ nama, layout, gambar });
            renderKatalog();
            hideAddForm();
        }

        function editKatalog(idx) {
            document.getElementById('editIndex').value = idx;
            document.getElementById('editNama').value = katalog[idx].nama;
            document.getElementById('editJenis').value = katalog[idx].jenis;
            document.getElementById('editLayout').value = katalog[idx].layout;
            document.getElementById('editSwitch').value = katalog[idx].switch;
            document.getElementById('editHarga').value = katalog[idx].harga;
            document.getElementById('editStock').value = katalog[idx].stock;
            document.getElementById('editGambar').value = katalog[idx].gambar;
            document.getElementById('editForm').style.display = 'block';
        }

        function hideEditForm() {
            document.getElementById('editForm').reset();
            document.getElementById('editForm').style.display = 'none';
        }

        function saveEdit(e) {
            e.preventDefault();
            const idx = document.getElementById('editIndex').value;
            katalog[idx].nama = document.getElementById('editNama').value;
            katalog[idx].jenis = document.getElementById('editJenis').value;
            katalog[idx].layout = document.getElementById('editLayout').value;
            katalog[idx].switch = document.getElementById('editSwitch').value;
            katalog[idx].harga = document.getElementById('editHarga').value;
            katalog[idx].stock = document.getElementById('editStock').value;
            katalog[idx].gambar = document.getElementById('editGambar').value;
            renderKatalog();
            hideEditForm();
        }

        function deleteKatalog(idx) {
            if (confirm('Yakin ingin menghapus katalog ini?')) {
                katalog.splice(idx, 1);
                renderKatalog();
            }
        }

        // Initial render
        renderKatalog();
    </script>
</body>

</html>
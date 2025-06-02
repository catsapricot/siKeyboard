<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Dashboard - Keyboard Shop</title>
    <style>
        body,
        html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: "Inter", sans-serif;
            -webkit-font-smoothing: antialiased;
            box-sizing: border-box;
            background-color: #faf7f0;
        }

        .container {
            max-width: 1280px;
            margin: 0 auto;
            position: relative;
        }

        header {
            background-color: #000000;
            position: fixed;
            width: 100%;
            z-index: 1000;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
        }

        .logo img {
            width: 136px;
            height: 48px;
        }

        .admin-title {
            color: #fff;
            font-size: 1.5rem;
            font-weight: bold;
            margin-left: 2rem;
        }

        .logout-btn {
            background-color: #d9d9d9;
            color: #000;
            border: none;
            border-radius: 50px;
            padding: 0.5rem 1.5rem;
            cursor: pointer;
            font-weight: bold;
        }

        main {
            margin-top: 100px;
            padding: 2rem 0;
        }

        .dashboard-section {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.10);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .dashboard-section h2 {
            font-size: 2rem;
            margin-bottom: 1.5rem;
        }

        .catalog-actions {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .catalog-actions input[type="text"] {
            padding: 0.5rem 1rem;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 250px;
        }

        .catalog-actions button {
            padding: 0.5rem 1.2rem;
            border: none;
            border-radius: 5px;
            background: #000;
            color: #fff;
            cursor: pointer;
            font-weight: bold;
        }

        .catalog-table {
            width: 100%;
            border-collapse: collapse;
        }

        .catalog-table th,
        .catalog-table td {
            border: 1px solid #ddd;
            padding: 0.75rem 1rem;
            text-align: left;
        }

        .catalog-table th {
            background: #f0f0f0;
        }

        .catalog-table td img {
            max-width: 80px;
            height: auto;
        }

        .action-btn {
            padding: 0.3rem 0.8rem;
            border: none;
            border-radius: 5px;
            margin-right: 0.5rem;
            cursor: pointer;
            font-size: 0.95rem;
        }

        .edit-btn {
            background: #ffc107;
            color: #000;
        }

        .delete-btn {
            background: #dc3545;
            color: #fff;
        }

        .add-form {
            margin-top: 2rem;
            background: #faf7f0;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .add-form label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        .add-form input[type="text"],
        .add-form input[type="file"] {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 1rem;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .add-form button {
            background: #000;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 0.5rem 1.5rem;
            cursor: pointer;
            font-weight: bold;
        }

        footer {
            background-color: #000000;
            color: #ffffff;
            text-align: center;
            padding: 2rem 0;
        }
    </style>
</head>

<body>
    <header>
        <nav class="container">
            <div class="logo">
                <img src="img/ujung-kiri.png" alt="Logo" />
            </div>
            <div class="admin-title">Admin Dashboard</div>
            <button class="logout-btn">Logout</button>
        </nav>
    </header>
    <main class="container">
        <section class="dashboard-section">
            <h2>Kelola Katalog Keyboard</h2>
            <div class="catalog-actions">
                <input type="text" id="searchInput" placeholder="Cari katalog..." />
                <button onclick="searchKatalog()">Cari</button>
                <button onclick="showAddForm()">Tambah Katalog</button>
            </div>
            <table class="catalog-table" id="catalogTable">
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>Layout</th>
                        <th>Gambar</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody id="catalogBody">
                    <!-- Data katalog akan diisi di sini -->
                </tbody>
            </table>
            <form class="add-form" id="addForm" style="display:none;" onsubmit="addKatalog(event)">
                <h3>Tambah Katalog Baru</h3>
                <label for="nama">Nama Keyboard</label>
                <input type="text" id="nama" required />
                <label for="layout">Layout</label>
                <input type="text" id="layout" required />
                <label for="gambar">Gambar (URL)</label>
                <input type="text" id="gambar" required />
                <button type="submit">Simpan</button>
                <button type="button" onclick="hideAddForm()" style="background:#ccc;color:#000;margin-left:1rem;">Batal</button>
            </form>
            <form class="add-form" id="editForm" style="display:none;" onsubmit="saveEdit(event)">
                <h3>Edit Katalog</h3>
                <input type="hidden" id="editIndex" />
                <label for="editNama">Nama Keyboard</label>
                <input type="text" id="editNama" required />
                <label for="editLayout">Layout</label>
                <input type="text" id="editLayout" required />
                <label for="editGambar">Gambar (URL)</label>
                <input type="text" id="editGambar" required />
                <button type="submit">Simpan Perubahan</button>
                <button type="button" onclick="hideEditForm()" style="background:#ccc;color:#000;margin-left:1rem;">Batal</button>
            </form>
        </section>
    </main>
    <footer>
        <p>Directed by Nazriel Mie</p>
    </footer>
    <script>
        // Dummy data katalog
        let katalog = [
            { nama: "Keyboard 65%", layout: "65", gambar: "img/andrey-matveev-emsdr1g6l10-unsplash-1.png" },
            { nama: "Keyboard 75%", layout: "75", gambar: "img/andrey-matveev-rctpvyipgws-unsplash-1.png" },
            { nama: "Keyboard TKL", layout: "TKL", gambar: "img/plain-jane-1.png" }
        ];

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
                            <button class="action-btn edit-btn" onclick="editKatalog(${idx})">Edit</button>
                            <button class="action-btn delete-btn" onclick="deleteKatalog(${idx})">Hapus</button>
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
            const layout = document.getElementById('layout').value;
            const gambar = document.getElementById('gambar').value;
            katalog.push({ nama, layout, gambar });
            renderKatalog();
            hideAddForm();
        }

        function editKatalog(idx) {
            document.getElementById('editIndex').value = idx;
            document.getElementById('editNama').value = katalog[idx].nama;
            document.getElementById('editLayout').value = katalog[idx].layout;
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
            katalog[idx].layout = document.getElementById('editLayout').value;
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
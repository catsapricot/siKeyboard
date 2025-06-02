document.addEventListener('DOMContentLoaded', () => {

    // Fungsi untuk memformat angka menjadi format mata uang IDR
    const formatCurrency = (amount) => {
        return `IDR ${new Intl.NumberFormat('id-ID').format(amount)}`;
    };

    // Fungsi untuk mengupdate total harga per item
    const updateItemTotal = (itemRow) => {
        const price = parseFloat(itemRow.dataset.price);
        const quantityInput = itemRow.querySelector('.quantity-input');
        const quantity = parseInt(quantityInput.value);
        const itemTotalElement = itemRow.querySelector('.item-total-price');
        
        const newTotal = price * quantity;
        itemTotalElement.textContent = formatCurrency(newTotal);
        
        updateGrandTotal();
    };

    // Fungsi untuk mengupdate total keseluruhan
    const updateGrandTotal = () => {
        const grandTotalElement = document.getElementById('grand-total-price');
        let grandTotal = 0;
        
        document.querySelectorAll('.cart-item').forEach(itemRow => {
            // Cek apakah item sedang ditampilkan (untuk fitur search)
            if (itemRow.style.display !== 'none') {
                const itemTotalText = itemRow.querySelector('.item-total-price').textContent;
                // Ambil hanya angka dari string 'IDR xxx.xxx'
                const itemTotal = parseFloat(itemTotalText.replace(/[^0-9]/g, ''));
                grandTotal += itemTotal;
            }
        });
        
        grandTotalElement.textContent = formatCurrency(grandTotal);
    };

    // Event listener untuk semua item di keranjang
    document.querySelectorAll('.cart-item').forEach(itemRow => {
        const quantityInput = itemRow.querySelector('.quantity-input');
        const plusBtn = itemRow.querySelector('.plus-btn');
        const minusBtn = itemRow.querySelector('.minus-btn');
        const removeBtn = itemRow.querySelector('.remove-item-btn');

        // Tombol Tambah
        plusBtn.addEventListener('click', () => {
            quantityInput.value = parseInt(quantityInput.value) + 1;
            updateItemTotal(itemRow);
        });

        // Tombol Kurang
        minusBtn.addEventListener('click', () => {
            let currentValue = parseInt(quantityInput.value);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
                updateItemTotal(itemRow);
            }
        });
        
        // Update saat input diubah manual
        quantityInput.addEventListener('change', () => {
            if (parseInt(quantityInput.value) < 1) {
                quantityInput.value = 1;
            }
            updateItemTotal(itemRow);
        });

        // Tombol Hapus Item
        removeBtn.addEventListener('click', () => {
            itemRow.remove();
            updateGrandTotal();
        });
    });

    // FUNGSI 1: Pencarian Produk di Keranjang
    const searchInput = document.getElementById('cart-search-input');
    const searchButton = document.getElementById('cart-search-button');

    const performSearch = () => {
        const searchTerm = searchInput.value.toLowerCase();
        document.querySelectorAll('.cart-item').forEach(itemRow => {
            const productName = itemRow.querySelector('.product-name').textContent.toLowerCase();
            if (productName.includes(searchTerm)) {
                itemRow.style.display = 'flex';
            } else {
                itemRow.style.display = 'none';
            }
        });
        updateGrandTotal(); // Hitung ulang total berdasarkan item yang ditampilkan
    };
    
    searchButton.addEventListener('click', performSearch);
    searchInput.addEventListener('keyup', (event) => {
        if (event.key === 'Enter') {
            performSearch();
        }
    });

    // FUNGSI 2: Dropdown Menu Shop
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

    updateGrandTotal();
});
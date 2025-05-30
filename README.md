# Tugas Besar PBO

Tugas besar PBO kelompok 3 kelas IF-47-04 yang beranggotakan:
1. Ghanif Hadiyana Akbar (103012300018)
2. Daisaq Hadya Albar (103012300158)
3. Taraka Yumna Sarwoko (103012300242)
4. Muhammad Nazriel Ihram (103012300269)
5. Muhammad Zaini (103012300313)

## :dizzy: Judul Proyek
siKeyboard

## :dizzy: Deskripsi Proyek
siKeyboard merupakan brand kami yang menjual berbagai mechanical keyboard dan aksesorisnya (keycaps, switches, case, dsb). Kami berperan sebagai retailer yang menyediakan produk dari berbagai brand.

Kami menggunakan web aplikasi sebagai media penjualan kami.

## :dizzy: Cara Menjalankan Aplikasi

### Prasyarat
- XAMPP
- Apache Ant
- JDK

### Menjalankan Aplikasi
1. Clone Repository<br />
   ```
   git clone https://github.com/catsapricot/siKeyboard.git
   ```

2. Masuk ke dalam Folder<br />
   ```
   cd siKeyboard
   ```

3. Build Aplikasi<br />
   ```
   ant build
   ```

4. Deploy Aplikasi<br />

   Buka file build.xml, ubah None di baris 10 (```<property name="tomcat.dir" value="None/siKeyboard"/>```) menjadi direktori dimana folder webapps tomcat berada (ex: ```C:\xampp\tomcat\webapps```).

   Lalu lakukan deploy.
   ```
   ant deploy
   ```

5. Start Tomcat melalui XAMPP.

6. Buka Browser dan Kunjungi ``` http://localhost:8080/siKeyboard ```.


<br />

# Dokumentasi PBO

## Pembuatan Class Diagram
Class Diagram dibuat dan diselesaikan pada tanggal 13 April 2025. Dikerjakan bersama-sama dengan menggunakan Lucidchart.

Berikut ini adalah gambar berserta <a href="https://lucid.app/lucidchart/fe1c40fd-2cca-44a6-a529-89c9b5cdf79b/edit?viewport_loc=-417%2C-1704%2C4051%2C2060%2C0_0&invitationId=inv_8b67e2cc-3c1c-467d-8595-391c4d7f47f0
">link</a> dari class diagramnya.

<br />

<img src="https://github.com/user-attachments/assets/5aab6741-aa7a-456c-9a8b-f531e435d969" width ="300"/>

## Perubahan Model Class Diagram
Terjadi perubahan model Class Diagram setelah berkonsultasi dengan asprak.

<br />

<img src="https://github.com/user-attachments/assets/dc6fb485-b79d-47f4-aa90-38bb52e26701" width ="300"/>

## Pembuatan Struktur Folder
Struktur folder mengikuti pola arsitektur MVC, dengan servlet sebagai controller, JSP sebagai view, dan JDBC untuk koneksi ke database.

<br />

<img src="https://github.com/user-attachments/assets/4b8369cc-8b53-48ba-95dd-8ee8c83cbbe4" width ="300"/>

## Perubahan Struktur Folder
Migrasi ke Java with Ant

<br />

<img src="https://github.com/user-attachments/assets/f78204c9-b4eb-4117-9078-04999a0d919e" width ="300" />

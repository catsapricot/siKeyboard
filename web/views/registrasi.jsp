<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>siKeyboard Login</title>
    <link rel="stylesheet" href="../style/registrasi.css" />
    </head>
  <body>
    <div class="container">
      <main class="login-section">
        <div class="login-form">
          <header class="logo-container">
            <img src="../assets/Gambar siKeyboard/Group 34.png" alt="siKeyboard Logo" class="logo" />
            <span class="brand-name">siKeyboard</span>
          </header>
          <h1>Selamat datang</h1>
          <p class="subtitle">Masukkan detail anda untuk masuk</p>
          <form>
            <div class="form-group">
              <label for="Nama">Nama</label>
              <input type="text" id="Nama" name="Nama" required />
            </div>
            <div class="form-group">
              <label for="Username">Username</label>
              <input type="text" id="Username" name="Username" required />
            </div>
            <div class="form-group">
              <label for="Password">Password</label>
              <input type="Password" id="Password" name="Password" required />
            </div>
            <button type="submit" class="registrasi-button">Registrasi</button>
          </form>
          <p class="register-prompt">sudah punya akun? <a href="login.jsp">Login</a></p>
        </div>
      </main>
      <aside class="image-section" role="img" aria-label="Close-up of a keyboard"></aside>
    </div>
  </body>
</html>
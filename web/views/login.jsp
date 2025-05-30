<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>siKeyboard Login</title>
    <link rel="stylesheet" href="../style/login.css" />
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
              <label for="username">Username</label>
              <input type="text" id="username" name="username" required />
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input type="password" id="password" name="password" required />
            </div>
            <div class="forgot-password">
              <a href="#">Lupa password</a>
            </div>
            <button type="submit" class="login-button">Login</button>
          </form>
          <p class="register-prompt">Tidak punya akun? <a href="#">Register</a></p>
        </div>
      </main>
      <aside class="image-section" role="img" aria-label="Close-up of a keyboard"></aside>
    </div>
  </body>
</html>
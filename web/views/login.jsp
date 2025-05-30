<<<<<<< HEAD
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%> 

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>siKeyboard - Login</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;700&display=swap" rel="stylesheet" />
  <link href="https://fonts.cdnfonts.com/css/queensides" rel="stylesheet">
  <link rel="stylesheet" href="../assets/authSyle.css" />
</head>

<body>
  <div class="container">
    <div class="left-section">
      <!-- Logo Section -->
      <div class="logo-section">
        <img src="../assets/images/img-logo-sikeyboard.png" alt="siKeyboard Logo" class="logo" />
      </div>

      <!-- Welcome Section -->
      <div class="welcome-section">
        <h1 class="welcome-title">Selamat datang</h1>
        <p class="welcome-subtitle">Masukkan detail anda</p>
      </div>

      <!-- Login Form -->
      <form method="POST" class="form-section" id="loginForm" action="<%= request.getContextPath() %>/login">
        <div class="input-group">
          <label for="username" class="input-label">Username</label>
          <input type="text" id="username" name="username" class="input-field" required />
        </div>

        <div class="input-group">
          <label for="password" class="input-label">Password</label>
          <input type="password" id="password" name="password" class="input-field" required />
        </div>
        <div class="error-message">
            <%
                String error = request.getParameter("error");
            %>
            <%=error%>
        </div>
        <button type="submit" class="login-button" id="loginButton">
          Login
        </button>

      <!-- Register Section -->
      <div class="register-section">
        <p class="register-text">
          <span class="no-account">Tidak punya akun?</span>
          <a href="../views/register.jsp" class="register-link"> Register</a>
        </p>
      </div>
=======
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
            <img src="../assets/Gambar siKeyboard/LOGOOO.png" alt="siKeyboard Logo" class="logo" />
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
            <button type="submit" class="login-button">Login</button>
          </form>
          <p class="login-prompt">Tidak punya akun? <a href="registrasi.jsp">Register</a></p>
        </div>
      </main>
      <aside class="image-section" role="img" aria-label="Close-up of a keyboard"></aside>
>>>>>>> 206c4fc0d7a70769aabed2f397d98e212f616a7a
    </div>

    <div class="right-section">
      <img src="../assets/images/img_janloydecabrera7e1jeimondgunsplash_1.png" alt="Keyboard Close-up"
        class="keyboard-image" />
    </div>
  </div>
</body>

</html>
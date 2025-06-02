<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%> 

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>siKeyboard - Registrasi</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.cdnfonts.com/css/queensides" rel="stylesheet">
    <link rel="stylesheet" href="../assets/style/authSyle.css" />
</head>

<body>
      <div class="container">
        <div class="left-section">
            <div class="logo-section">
                <img src="../assets/images/img-logo-sikeyboard-dark.png" alt="siKeyboard Logo" class="logo" />
            </div>

            <div class="welcome-section">
                <h1 class="welcome-title">Selamat datang</h1>
                <p class="welcome-subtitle">Masukkan detail anda</p>
            </div>

            <form method="POST" class="form-section" action="<%= request.getContextPath()%>/auth">
                <input type="hidden" name="action" value="register"/>
                <div class="input-group">
                    <label for="name" class="input-label">Nama</label>
                    <input type="text" id="nama" name="nama" class="input-field" required />
                </div>
                <div class="input-group">
                    <label for="username" class="input-label">Username</label>
                    <input type="text" id="user" name="user" class="input-field" required />
                </div>
                <div class="input-group">
                    <label for="password" class="input-label">Password</label>
                    <input type="password" id="pass" name="pass" class="input-field" required />
                </div>
                <div class="error-message">
                    <%
                        String error = request.getParameter("error");
                        String status = request.getParameter("status");
                        if ("1".equals(error)) {
                    %>
                    Data tidak boleh kosong!
                    <%
                        } else if ("2".equals(error)) {
                    %>
                    Password minimal 8 karakter!
                    <%
                        } else if ("3".equals(error)) {
                    %>
                        Username sudah digunakan!
                    <%
                        } else if ("4".equals(error)) {
                    %>
                        Terjadi kesalah pada sistem
                    <%
                        }
                        if ("sukses".equals(status)) {
                    %>
                        Registrasi berhasil silahkan Login
                    <%
                        }
                    %>
                </div>
                <button type="submit" class="login-button" id="loginButton">
                    Register
                </button>
            </form>

            <div class="auth-section">
                <p class="auth-text">
                    <span class="no-account">Sudah punya akun?</span>
                    <a href="../views/login.jsp" class="register-link"> Login</a>
                </p>
            </div>
        </div> 
        <div class="right-section">
            <img src="../assets/images/img_janloydecabrera7e1jeimondgunsplash_1.png" alt="Keyboard Close-up" class="keyboard-image" />
        </div>
      </div>
    </body>

</html>
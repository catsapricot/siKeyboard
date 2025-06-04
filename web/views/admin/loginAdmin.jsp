<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%> 

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>siKeyboard - Login ADMIN</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.cdnfonts.com/css/queensides" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/securityStyle.css" />
</head>

<body>
    <div class="container">
        <div class="left-section">
            <div class="logo-section">
                <img src="${pageContext.request.contextPath}/assets/images/img-logo-sikeyboard-dark.png" alt="siKeyboard Logo" class="logo" />
            </div>

            <div class="welcome-section">
                <h1 class="welcome-title">Selamat datang Admin</h1>
                <p class="welcome-subtitle">Masukkan Security Key Anda</p>
            </div>

            <form method="POST" class="form-section" action="${pageContext.request.contextPath}/auth">
                <input type="hidden" name="action" value="securityKey" />

                <div class="input-group">
                    <label for="security" class="input-label">Security Key</label>
                    <input type="password" id="security" name="security" class="input-field" required />
                </div>

                <div class="error-message">
                    <%
                        String error = request.getParameter("error");
                        if ("1".equals(error)) {
                    %>
                        Security Key salah.
                    <%
                        } else if ("3".equals(error)) {
                    %>
                        Terjadi kesalahan pada sistem.
                    <%
                        }
                    %>
                </div>

                <button type="submit" class="login-button">Login</button>
            </form>
        </div>

        <div class="right-section">
            <img src="${pageContext.request.contextPath}/assets/images/img_janloydecabrera7e1jeimondgunsplash_1.png" alt="Keyboard Close-up" class="keyboard-image" />
        </div>
    </div>
</body>
</html>

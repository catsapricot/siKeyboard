<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Login</title>
    <link rel="stylesheet" href="../assets/style.css" />
  </head>
  <body>
    <div class="container">
      <form class="login-form" action="login?action=login">
        <h1>Login</h1>
        <input type="text" id="input-email" name="email"  placeholder="Email" required />
        <input type="password" id="input-password" name="password"  placeholder="Password" required />
        <button type="submit">Masuk</button>
      </form>
    </div>
  </body>
</html>
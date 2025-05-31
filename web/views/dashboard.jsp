<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Keyboard Shop</title>
    <style>
        /* Inject original CSS here */
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

        .search-bar {
            display: flex;
            align-items: center;
            background-color: #ebebeb;
            border-radius: 38px;
            padding: 0.5rem 1rem;
        }

        .search-bar input {
            border: none;
            background: transparent;
            margin-right: 1rem;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-links a {
            color: #ffffff;
            text-decoration: none;
            font-size: 1.25rem;
        }

        .auth-buttons {
            display: flex;
            gap: 1rem;
        }

        .auth-buttons button {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 50px;
            cursor: pointer;
        }

        .sign-up {
            background-color: #d9d9d9;
            color: #000000;
        }

        .sign-in {
            background-color: #878787;
            color: #ffffff;
        }

        .hero {
            display: flex;
            height: 100vh;
            align-items: center;
        }

        .hero-content {
            flex: 1;
            padding: 2rem;
        }

        .hero-image {
            flex: 1;
            background: linear-gradient(180deg,
                    rgba(217, 217, 217, 0.75) 0%,
                    rgba(166, 166, 166, 0.5) 50%,
                    rgba(217, 217, 217, 0.75) 100%);
            height: 100%;
        }

        h1 {
            font-family: "Queensides", sans-serif;
            font-size: 6rem;
            line-height: 1.2;
            margin-bottom: 2rem;
        }

        .hero p {
            font-size: 0.75rem;
            color: rgba(60, 60, 67, 0.6);
            max-width: 452px;
        }

        .layout-section {
            padding: 4rem 0;
            text-align: center;
        }

        .layout-section h2 {
            font-family: "Queensides", sans-serif;
            font-size: 4rem;
            margin-bottom: 2rem;
        }

        .layout-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2rem;
            padding: 0 2rem;
        }

        .layout-card {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.25);
            padding: 1rem;
            text-align: center;
        }

        .layout-card img {
            max-width: 100%;
            height: auto;
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
            <div class="search-bar">
                <input type="text" placeholder="Search" />
                <img src="img/ic-outline-search.svg" alt="Search" />
            </div>
            <div class="nav-links">
                <a href="#">Home</a>
                <a href="#">Shop</a>
            </div>
            <div class="auth-buttons">
                <button class="sign-up">Sign Up</button>
                <button class="sign-in">Sign In</button>
            </div>
        </nav>
    </header>
    <main>
        <section class="hero">
            <div class="hero-content">
                <h1>Rancang<br />Rakit<br />Rasakan</h1>
                <p>
                    Disini keyboard bukan sekadar alat, jadikan keyboard bagian dari dirimu! Rancang keyboard sesuai
                    seleramu,
                    rakit dengan tanganmu sendiri, dan rasakan hasilnya.
                </p>
            </div>
            <div class="hero-image"></div>
        </section>
        <section class="layout-section">
            <h2>Pilih Layoutmu</h2>
            <div class="layout-grid">
                <div class="layout-card">
                    <h3>65</h3>
                    <img src="img/andrey-matveev-emsdr1g6l10-unsplash-1.png" alt="65% Keyboard" />
                </div>
                <div class="layout-card">
                    <h3>75</h3>
                    <img src="img/andrey-matveev-rctpvyipgws-unsplash-1.png" alt="75% Keyboard" />
                </div>
                <div class="layout-card">
                    <h3>TKL</h3>
                    <img src="img/plain-jane-1.png" alt="TKL Keyboard" />
                </div>
                <div class="layout-card">
                    <h3>Lainnya</h3>
                </div>
            </div>
        </section>
    </main>
    <footer>
        <p>Directed by Nazriel Mie</p>
    </footer>
</body>

</html>
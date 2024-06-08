<?php
const HOST = 'localhost';
const USERNAME = 'root';
const PASSWORD = '';
const DATABASE = 'blog';


function createDBConnection(): mysqli
{
  $conn = new mysqli(HOST, USERNAME, PASSWORD, DATABASE);
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }

  return $conn;
}

function closeDBConnection(mysqli $conn): void
{
  $conn->close();
}


function getFeaturedPostsFromDB(mysqli $conn): void
{
  $sql = "SELECT * FROM post WHERE featured=1";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      include 'post-preview_featured.php';
    }
  } else {
    echo "0 results";
  }
}

function getMostRecentPostsFromDB(mysqli $conn): void
{
  $sql = "SELECT * FROM post WHERE featured=0";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      include 'post-preview_recent.php';
    }
  } else {
    echo "0 results";
  }
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Blog</title>
  <link rel="stylesheet" href="styles/home.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&family=Oxygen:wght@300;400;700&display=swap" rel="stylesheet">
</head>

<body>
  <header class="header">
    <div class="container">
      <div class="header-nav">
        <a href="/home">
          <h2 class="logo">Escape.</h2>
        </a>
        <div class="header__burger" id="burger">
          <span></span><span></span><span></span>
        </div>
        <nav class="navigation" id="navigation">
          <ul>
            <li><a href="/home">HOME</a></li>
            <li><a href="#">CATEGORIES</a></li>
            <li><a href="#">ABOUT</a></li>
            <li><a href="#">CONTACT</a></li>
          </ul>
        </nav>
      </div>
    </div>
    <div class="header__banner">
      <h1 class="header__banner__title">Let's do it together.</h1>
      <div class="header__banner__subtitle">We travel the world in search of stories. Come along for the ride.</div>
      <button onclick="location.href='post'" type="button" class="header__banner__button">View Latest Posts</button>
    </div>
  </header>
  <main class="main">
    <div class="categories">
      <ul class="categories__list container">
        <li class="categories-item"><a class="categories-link" href="#">Nature</a></li>
        <li class="categories-item"><a class="categories-link" href="#">Photography</a></li>
        <li class="categories-item"><a class="categories-link" href="#">Relaxtion</a></li>
        <li class="categories-item"><a class="categories-link" href="#">Vacation</a></li>
        <li class="categories-item"><a class="categories-link" href="#">Travel</a></li>
        <li class="categories-item"><a class="categories-link" href="#">Advanture</a></li>
      </ul>
    </div>
    <div class="section container">
      <div class="section__title">Featured Posts</div>
      <div class="section__dash"></div>
      <div class="section__post-block">
        <?php
        $conn = createDBConnection();
        getFeaturedPostsFromDB($conn);
        closeDBConnection($conn);
        ?>
      </div>
      <div class="section section-2_size container">
        <div class="section__title">Most Recent</div>
        <div class="section__dash"></div>
        <div class="section__post-block">
          <?php
          $conn = createDBConnection();
          getMostRecentPostsFromDB($conn);
          closeDBConnection($conn);
          ?>
        </div>
  </main>
  <footer class="footer">
    <div class="container">
      <div class="stay-in-touch">
        <h1 class="stay-in-touch__title">Stay in Touch</h1>
        <form class="sendEmail">
          <input name="Email" class="sendEmail-input" type="email" placeholder="Enter your email address" require>
          <button class="submit-but" type="submit">Submit</button>
        </form>
      </div>
    </div>
    <div class="footer-bg">
      <div class="footer-nav">
        <div class="container">
          <div class="footer-nav__inner">
            <a href="/home">
              <h2 class="logo">Escape.</h2>
            </a>
            <nav class="footer-navigation">
              <ul class="footer-navigation-lists">
                <li class="footer-navigation-list"><a href="/home">Home</a></li>
                <li class="footer-navigation-list"><a href="#">CATEGORIES</a></li>
                <li class="footer-navigation-list"><a href="#">ABOUT</a></li>
                <li class="footer-navigation-list"><a href="#">CONTACT</a></li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </footer>
</body>

</html>
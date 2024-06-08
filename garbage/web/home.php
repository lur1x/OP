<?php
$postsFeatured = [
 [
   'id' => 1,
   'title' => 'The Road Ahead',
   'subtitle' => 'The road ahead might be paved - it might not be.',
   'categories_have' => 'categories_havnt',
   'categories' => '',
   'avatar' => '<img src="static/images/mat-vogels.png">',
   'author' => 'Mat Vogels',
   'data' => 'September 25, 2015',
   'class' => 'the-road-ahead-block',
   // другие свойства первого поста
 ],
 [
  'id' => 2,
  'title' => 'From Top Down',
  'subtitle' => 'Once a year, go someplace you’ve never been before.',
  'categories_have' => 'categories_have',
  'categories' => 'Adventure',
  'avatar' => '<img src="static/images/william-wong.png">',
  'author' => 'William-wong',
  'data' => 'September 25, 2015',
  'class' => 'from-top-down',
  // другие свойства второго поста
 ]
];
$postsRecent = [ 
[
  'id' => 3,
  'title' => 'Still Standing Tall',
  'subtitle' => 'Life begins at the end of your comfort zone.',
  'categories_have' => 'categories_havnt',
  'categories' => '',
  'avatar' => '<img src="static/images/william-wong.png">',
  'author' => 'William Wong',
  'data' => '9/25/2015',
  'class' => 'still-standing-tall',
  // другие свойства третьего поста
],
[
  'id' => 4,
  'title' => 'Sunny Side Up',
  'subtitle' => 'No place is ever as bad as they tell you it’s going to be.',
  'categories_have' => 'categories_havnt',
  'categories' => '',
  'avatar' => '<img src="static/images/mat-vogels.png">',
  'author' => 'Mat Vogels',
  'data' => '9/25/2015',
  'class' => 'sunny-side-up',
  // другие свойства четвёртого поста
],
[
  'id' => 5,
  'title' => 'Water Falls',
  'subtitle' => 'We travel not to escape life, but for life not to escape us.',
  'categories_have' => 'categories_havnt',
  'categories' => '',
  'avatar' => '<img src="static/images/mat-vogels.png">',
  'author' => 'Mat Vogels',
  'data' => '9/25/2015',
  'class' => 'water-falls',
  // другие свойства пятого поста
],
[
  'id' => 6,
  'title' => 'Through the Mist',
  'subtitle' => 'Travel makes you see what a tiny place you occupy in the world.',
  'categories_have' => 'categories_havnt',
  'categories' => '',
  'avatar' => '<img src="static/images/william-wong.png">',
  'author' => 'William Wong',
  'data' => '9/25/2015',
  'class' => 'throught-the-mist',
  // другие свойства шестого поста
],
[
  'id' => 7,
  'title' => 'Awaken Early',
  'subtitle' => 'Not all those who wander are lost.',
  'categories_have' => 'categories_havnt',
  'categories' => '',
  'avatar' => '<img src="static/images/mat-vogels.png">',
  'author' => 'Mat Vogels',
  'data' => '9/25/2015',
  'class' => 'awaken-early',
  // другие свойства седьмого поста
],
[
  'id' => 8,
  'title' => 'Try it Always',
  'subtitle' => 'The world is a book, and those who do not travel read only one page.',
  'categories_have' => 'categories_havnt',
  'categories' => '',
  'avatar' => '<img src="static/images/mat-vogels.png">',
  'author' => 'Mat Vogels',
  'data' => '9/25/2015',
  'class' => 'try-it-always',
  // другие свойства восьмого поста
],
];
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
    <div class="header__menu menu container">
      <div class="header__menu__return-button return-button">
        <a class="escape" href="/home">Escape.</a>
      </div>
      <nav class="header__menu__navigation navigation">
        <ul class="navigation__list">
          <li class="navigation-item"><a class="navigation-link" href="/home">HOME</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">CATEGORIES</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">ABOUT</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">CONTACT</a></li>
        </ul>
      </nav>
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
          foreach ($postsFeatured as $post) {
            include 'post-preview_featured.php';
          }
        ?>
    </div>
    <div class="section section-2_size container">
      <div class="section__title">Most Recent</div>
      <div class="section__dash"></div>
      <div class="section__post-block">
        <?php 
          foreach ($postsRecent as $post) {
            include 'post-preview_recent.php';
          }
        ?>
      </div>
  </main>
  <footer class="footer">
    <div class="footer__menu menu container">
      <div class="footer__menu__return-button return-button">
        <a class="escape" href="/home">Escape.</a>
      </div>
      <nav class="footer__menu__navigation navigation">
        <ul class="navigation__list">
          <li class="navigation-item"><a class="navigation-link" href="/home">HOME</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">CATEGORIES</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">ABOUT</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">CONTACT</a></li>
        </ul>
      </nav>
    </div>
  </footer>
</body>
</html>
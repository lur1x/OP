<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Blog</title>
  <link rel="stylesheet" href="styles/index-style.css">
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
        <a class="escape" href="#">Escape.</a>
      </div>
      <nav class="header__menu-navigation navigation">
        <ul class="navigation__list">
          <li class="navigation-item"><a class="navigation-link" href="#">HOME</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">CATEGORIES</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">ABOUT</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">CONTACT</a></li>
        </ul>
      </nav>
    </div>
    <div class="header__banner">
      <h1 class="header__banner-title">Let's do it together.</h1>
      <h2 class="header__banner-subtitle">We travel the world in search of stories. Come along for the ride.</h2>
      <a class="header__banner-button" href="#">View Latest Posts</a>
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
        <div class="post-block-for-second the-road-ahead-block">
          <div class="post-block-for-second__categories categories_havnt"></div>
          <div class="post-block-for-second__info">
            <h3 class="post-block-for-second__info__title title">The Road Ahead</h3>
            <h4 class="post-block-for-second__info__subtitle subtitle">The road ahead might be paved - it might not be.</h4>
          </div>
          <div class="post-block-for-second__info__about">
            <div class="about__author">
              <div class="about__author__avatar mat-vogels"></div>
              <div class="about__author__name author">Mat Vogels</div>
            </div>
            <div class="about__data">September 25, 2015</div>
          </div>
        </div>
        <div class="post-block-for-second from-top-down">
          <div class="post-block-for-second__categories categories_have">Adventure</div>
          <div class="post-block-for-second__info">
            <h3 class="post-block-for-second__info__title">From Top Down</h3>
            <h4 class="post-block-for-second__info__subtitle">Once a year, go someplace you’ve never been before.</h4>
          </div>
          <div class="post-block-for-second__info__about">
            <div class="about__author">
              <div class="about__author__avatar william-wong"></div>
              <div class="about__author__name">William Wong</div>
            </div>
            <div class="about__data">September 25, 2015</div>
          </div>
        </div>
      </div>
    </div>
    <div class="section section-second_size container">
      <div class="section__title">Most Recent</div>
      <div class="section__dash"></div>
      <div class="section__post-block">
        <div class="post-block-for-third">
          <div class="post-block-for-third__img still-standing-tall">
            <div class="post-block-for-third__categories categories_havnt"></div>
          </div>
          <div class="post-block-for-third__info">
            <h3 class="post-block-for-third__info__title">Still Standing Tall</h3>
            <h4 class="post-block-for-third__info__subtitle">Life begins at the end of your comfort zone.</h4>
          </div>
          <div class="post-block-for-third__info__about">
            <div class="about__author">
              <div class="about__author__avatar william-wong"></div>
              <div class="about__author__name">William Wong</div>
            </div>
            <div class="about__data">9/25/2015</div>
          </div>
        </div>
        <div class="post-block-for-third">
          <div class="post-block-for-third__img sunny-side-up">
            <div class="post-block-for-third__categories categories_havnt"></div>
          </div>
          <div class="post-block-for-third__info">
            <h3 class="post-block-for-third__info__title">Sunny Side Up</h3>
            <h4 class="post-block-for-third__info__subtitle">No place is ever as bad as they tell you it’s going to be.</h4>
          </div>
          <div class="post-block-for-third__info__about">
            <div class="about__author">
              <div class="about__author__avatar mat-vogels"></div>
              <div class="about__author__name">Mat Vogels</div>
            </div>
            <div class="about__data">9/25/2015</div>
          </div>
        </div>
        <div class="post-block-for-third">
          <div class="post-block-for-third__img water-falls">
            <div class="post-block-for-3__categories categories_havnt"></div>
          </div>
          <div class="post-block-for-third__info">
            <h3 class="post-block-for-third__info__title">Water Falls</h3>
            <h4 class="post-block-for-third__info__subtitle">We travel not to escape life, but for life not to escape us.</h4>
          </div>
          <div class="post-block-for-third__info__about">
            <div class="about__author">
              <div class="about__author__avatar mat-vogels"></div>
              <div class="about__author__name">Mat Vogels</div>
            </div>
            <div class="about__data">9/25/2015</div>
          </div>
        </div>
        <div class="post-block-for-third">
          <div class="post-block-for-third__img throught-the-mist">
            <div class="post-block-for-third__categories categories_havnt"></div>
          </div>
          <div class="post-block-for-third__info">
            <h3 class="post-block-for-third__info__title">Through the Mist</h3>
            <h4 class="post-block-for-third__info__subtitle">Travel makes you see what a tiny place you occupy in the world.</h4>
          </div>
          <div class="post-block-for-third__info__about">
            <div class="about__author">
              <div class="about__author__avatar william-wong"></div>
              <div class="about__author__name">William Wong</div>
            </div>
            <div class="about__data">9/25/2015</div>
          </div>
        </div>
        <div class="post-block-for-third">
          <div class="post-block-for-third__img awaken-early">
            <div class="post-block-for-third__categories categories_havnt"></div>
          </div>
          <div class="post-block-for-third__info">
            <h3 class="post-block-for-third__info__title">Awaken Early</h3>
            <h4 class="post-block-for-third__info__subtitle">Not all those who wander are lost.</h4>
          </div>
          <div class="post-block-for-third__info__about">
            <div class="about__author">
              <div class="about__author__avatar mat-vogels"></div>
              <div class="about__author__name">Mat Vogels</div>
            </div>
            <div class="about__data">9/25/2015</div>
          </div>
        </div>
        <div class="post-block-for-third">
          <div class="post-block-for-third__img try-it-always">
            <div class="post-block-for-third__categories categories_havnt"></div>
          </div>
          <div class="post-block-for-third__info">
            <h3 class="post-block-for-third__info__title">Try it Always</h3>
            <h4 class="post-block-for-third__info__subtitle">The world is a book, and those who do not travel read only one page.</h4>
          </div>
          <div class="post-block-for-third__info__about">
            <div class="about__author">
              <div class="about__author__avatar mat-vogels"></div>
              <div class="about__author__name">Mat Vogels</div>
            </div>
            <div class="about__data">9/25/2015</div>
          </div>
        </div>
      </div>
  </main>
  <footer class="footer">
    <div class="footer__menu menu container">
      <div class="footer__menu__return-button return-button">
        <a class="escape" href="#">Escape.</a>
      </div>
      <nav class="footer__menu__navigation navigation">
        <ul class="navigation__list">
          <li class="navigation-item"><a class="navigation-link" href="#">HOME</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">CATEGORIES</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">ABOUT</a></li>
          <li class="navigation-item"><a class="navigation-link" href="#">CONTACT</a></li>
        </ul>
      </nav>
    </div>
  </footer>
</body>
</html>
<div class="featured-posts ">
  <div class="featured-posts__image">
    <img class="posts-image" src="<?= $row['image_url'] ?>" alt="mainIng.png">
  </div>
  <a class="featured-posts_link" href='/post?id=<?= $row['post_id'] ?>'></a>
  <?php if ($row['post_id'] == 2) echo '<button class="featured-posts-button my-button">Adventure</button>';?>
  <div class="featured-posts__info">
    <div class="featured-posts__info__title"><?= $row['title'] ?></div>
    <div class="featured-posts__info__subtitle"><?= $row['subtitle'] ?></div>
  </div>
  <div class="featured-posts__info__about">
    <div class="about__author">
      <div class="about__author__avatar"><img src="<?= $row['author_url'] ?>"> </div>
      <div class="about__author__name"><?= $row['author'] ?></div>
    </div>
    <div class="about__data"><?= $row['publish_date'] ?></div>
  </div>
</div>

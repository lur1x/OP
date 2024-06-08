<div class="recent-posts">
<a class="recent-posts--link" href='/post?id=<?= $row['post_id'] ?>'></a>
  <div class="recent-posts__img">
    <img class="posts-image" src="<?= $row['image_url'] ?>" alt="mainIng.png">
  </div>
  <div class="recent-posts__info">
    <a class="recent-posts__info__title"><?= $row['title'] ?></a>
    <div class="recent-posts__info__subtitle"><?= $row['subtitle'] ?></div>
  </div>
  <div class="recent-posts__info__about">
    <div class="about__author">
      <div class="about__author__avatar"><img src="<?= $row['author_url'] ?>"></div>
      <div class="about__author__name"><?= $row['author'] ?></div>
    </div>
    <div class="about__data"><?= $row['publish_date'] ?></div>
  </div>
</div>

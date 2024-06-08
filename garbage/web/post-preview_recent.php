<div class="post-block-for-third">
<a class="post-block-for-third--link" href='/post?id=<?= $post['id'] ?>'></a>
  <div class="post-block-for-third__img <?= $post['class'] ?>">
    <div class="post-block-for-third__categories <?= $post['categories_have'] ?>"><?= $post['categories'] ?></div>
  </div>
  <div class="post-block-for-third__info">
    <a class="post-block-for-third__info__title"><?= $post['title'] ?></a>
    <div class="post-block-for-third__info__subtitle"><?= $post['subtitle'] ?></div>
  </div>
  <div class="post-block-for-third__info__about">
    <div class="about__author">
      <div class="about__author__avatar"><?= $post['avatar'] ?></div>
      <div class="about__author__name"><?= $post['author'] ?></div>
    </div>
    <div class="about__data"><?= $post['data'] ?></div>
  </div>
</div>

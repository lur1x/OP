<div class="post-block-for-second <?= $post['class'] ?>">
<a class="post-block-for-second--link" href='/post?id=<?= $post['id'] ?>'></a>
  <div class="post-block-for-second__categories <?= $post['categories_have'] ?>"><?= $post['categories'] ?></div>
  <div class="post-block-for-second__info">
    <div class="post-block-for-second__info__title"><?= $post['title'] ?></div>
    <div class="post-block-for-second__info__subtitle"><?= $post['subtitle'] ?></div>
  </div>
  <div class="post-block-for-second__info__about">
    <div class="about__author">
      <div class="about__author__avatar"><?= $post['avatar'] ?> </div>
      <div class="about__author__name"><?= $post['author'] ?></div>
    </div>
    <div class="about__data"><?= $post['data'] ?></div>
  </div>
</div>

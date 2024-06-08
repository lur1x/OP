<?php  
  $query = '
  INSERT INTO
  post
  (
    title,
    subtitle,
    content,
    author,
    img_modifier,
    date,
    featured,
    background,
    button_text,
    button
  )
  VALUES
  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )';
  
  $title = $body['title'];
  $subtitle = $body['subtitle'];
  $content = $body['content'];
  $author = $body['author'];
  $img_modifier = $body['img_modifier'];
  $date = $body['date'];
  $featured = $body['featured'] ? 1 : 0;
  $background = $body['background'];
  $button_text = $body['button-text'];
  $button = $body['button'];
  
  $stmt = $conn->prepare($query);
  $stmt->bind_param(
    'ssssssisss',
    $title,
    $subtitle,
    $content,
    $author,
    $img_modifier,
    $date,
    $featured,
    $background,
    $button_text,
    $button
  );
  
  $stmt->execute();
?>    

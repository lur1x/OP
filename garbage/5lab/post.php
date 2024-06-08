<?php
const HOST = 'localhost';
const USERNAME = 'root';
const PASSWORD = '';
const DATABASE = 'blog';
//http://localhost:8080/post.php?id=1

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

function getPostFromDB(mysqli $conn): array
{
  // Проверим, установлен ли параметр id
  if (!isset($_GET['id'])) {
    die("Ошибка: не определён ключ 'id' в запросе");
  }

  // Используем подготовленные выражения для защиты от SQL-инъекции
  $stmt = $conn->prepare("SELECT * FROM post WHERE post_id= ?");

  // Если есть ошибка mysqli - отловим
  if (!$stmt) {
    die("Ошибка подготовки запроса: " . $conn->error);
  }

  // Привязываем GET параметр как строку 's'
  // Если ID является числом, используем 'i'
  $stmt->bind_param('s', $_GET['id']);

  // Выполняем запрос
  $stmt->execute();

  // Получаем и возвращаем результат
  $result = $stmt->get_result();
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      return $row;
    }
  } else {
    header("Location: http://localhost:8001/home");
    exit();
  }
}

$conn = createDBConnection();
$post = getPostFromDB($conn);
closeDBConnection($conn);
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?= $post['title'] ?></title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Lora&family=Oxygen&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="styles/post.css">
  <script type="module" src="/js/navigation.js"></script>
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
            <li><a href="/home">Home</a></li>
            <li><a href="#">Categories</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
        </nav>
      </div>
    </div>
  </header>
  <main class="main">
    <section class="title">
      <div class="container">
        <div class="title-texts">
          <h1><?= $post['title'] ?></h1>
          <p><?= $post['subtitle'] ?></p>
        </div>
      </div>
    </section>
    <img src="<?= $post['image_url'] ?>" alt="some img">
    <div class="container">
      <div class="main-text">
        <p><?= $post['content'] ?></p>
      </div>
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
                <li class="footer-navigation-list"><a href="#">Categories</a></li>
                <li class="footer-navigation-list"><a href="#">About</a></li>
                <li class="footer-navigation-list"><a href="#">Contact</a></li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </footer>
</body>

</html>
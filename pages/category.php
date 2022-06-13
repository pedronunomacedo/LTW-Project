<?php
  declare(strict_types = 1);

  require_once(__DIR__ . '/../database/connection.db.php');
  require_once(__DIR__ . '/../database/restaurant.class.php');
  require_once(__DIR__ . '/../templates/category.tpl.php');
  require_once(__DIR__ . '/../templates/common.tpl.php');
  require_once(__DIR__ . '/../utils/session.php');
?>
  <link rel="stylesheet" href="../css/common.css"> <!-- Style of the header and the footer -->
  <link rel="stylesheet" href="../css/category.css"> <!-- Style of the main body -->
<?php
  $session = new Session();

  $db = getDatabaseConnection();

  $category = $_GET['category'];
  $categoryRestaurants = Restaurant::getCategoryRestaurants($db, $category);
  
  drawHeader($session);
  drawCategoryRestaurants($db, $categoryRestaurants, $category);
  drawFooter();
?>
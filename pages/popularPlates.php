<?php
  declare(strict_types = 1);

  require_once(__DIR__ . '/../database/connection.db.php');
  require_once(__DIR__ . '/../database/restaurant.class.php');
  require_once(__DIR__ . '/../templates/restaurant.tpl.php');
  require_once(__DIR__ . '/../templates/common.tpl.php');
  $session = new Session();
?>
  <link rel="stylesheet" href="../css/common.css"> <!-- Style of the header and the footer -->
<?php
  $db = getDatabaseConnection();

  $allRestaurants = Restaurant::getallRestaurants($db);
  foreach ($allRestaurants as $restaurant) {
    $grade = Restaurant::getRestaurantGrade($db, $restaurant->id);
  }

  drawHeader($session);

  drawFooter();
?>
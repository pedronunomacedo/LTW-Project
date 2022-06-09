<?php
  declare(strict_types = 1);

  require_once(__DIR__ . '/../database/connection.db.php');
  require_once(__DIR__ . '/../database/restaurant.class.php');
  require_once(__DIR__ . '/../templates/restaurant.tpl.php');
  require_once(__DIR__ . '/../database/plate.class.php');
  require_once(__DIR__ . '/../templates/common.tpl.php');
  $session = new Session();

  $db = getDatabaseConnection();

  $restaurant = Restaurant::getRestaurant($db, intval($_GET['id']));
  $plates = Plate::getRestaurantPlates($db, intval($_GET['id']));
  
  drawHeader($session);
  drawRestaurant($db, $restaurant, $plates);
  drawFooter();
?>
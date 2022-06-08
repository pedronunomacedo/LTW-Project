<?php
  declare(strict_types = 1);

  require_once(__DIR__ . '/../database/connection.db.php');
  require_once(__DIR__ . '/../database/restaurant.class.php');
  require_once(__DIR__ . '/../templates/restaurant.tpl.php');

  $db = getDatabaseConnection();

  $allRestaurants = Restaurant::getallRestaurants($db);
  foreach ($allRestaurants as $restaurant) {
    $grade = Restaurant::getRestaurantGrade($db, $restaurant->id);
  }
?>
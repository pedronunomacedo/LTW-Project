<?php
  declare(strict_types = 1);

  require_once(__DIR__ . '/../database/connection.db.php');
  require_once(__DIR__ . '/../database/restaurant.class.php');
  require_once(__DIR__ . '/../templates/category.tpl.php');

  $db = getDatabaseConnection();

  $category = $_GET['category'];

  $categoryeRestaurants = Restaurant::getCategoryRestaurants($db, $category);

  drawCategoryRestaurants($db, $categoryeRestaurants, $category);
?>
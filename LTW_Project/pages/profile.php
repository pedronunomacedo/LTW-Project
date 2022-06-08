<?php
  declare(strict_types = 1);

  require_once(__DIR__ . '/../database/connection.db.php');
  require_once(__DIR__ . '/../templates/profile.tpl.php');
  require_once(__DIR__ . '/../database/user.class.php');
  require_once(__DIR__ . '/../database/addresses.class.php');
  require_once(__DIR__ . '/../database/pedido.class.php');
  require_once(__DIR__ . '/../database/favorite.class.php');

  $db = getDatabaseConnection();

  $userId = $_GET['userId'];
  $user = User::getUserByUsername($db, intval($userId));
  $userAddresses = Address::getUserAddresses($db, intval($userId));
  $userOrders = Pedido::getUserOrders($db, intval($userId));
  $favoriteUserRestaurants = Favorite::getUserFavoriteRestaurants($db, intval($userId));

  drawTitles();
  drawMyProfile($db, $user, $userAddresses, $userOrders, $favoriteUserRestaurants);

?>
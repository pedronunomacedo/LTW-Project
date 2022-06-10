<?php
    declare(strict_types = 1);

    require_once(__DIR__ . '/../database/connection.db.php');
    require_once(__DIR__ . '/../database/user.class.php');
    require_once(__DIR__ . '/../database/favorite.class.php');
    require_once(__DIR__ . '/../utils/session.php');
    require_once(__DIR__ . '/../templates/profile.tpl.php');
    $session = new Session();
?>
    <script src="../js/action_edit_profile.tpl.js"></script>
<?php

    if (!$session->isLoggedIn()) die(header('Location: /'));

    $db = getDatabaseConnection();

    $user = User::getUser($db, $session->getId());

    if ($user) {
        $user->name = $_POST['name'];
        $user->username = $_POST['username'];
        $user->phone = intval($_POST['phone']);
        $user->save($db);

        $session->setName($user->username);
        $userAddresses = Address::getUserAddresses($db, $user->id);
        $userOrders = Pedido::getUserOrders($db, $user->id);
        $favoriteUserRestaurants = Favorite::getUserFavoriteRestaurants($db, $user->id);
        drawMyProfile($db, $user, $userAddresses, $userOrders, $favoriteUserRestaurants);
    }

    header('Location: ../pages/profile.php?userId=' . $session->getId());
?>
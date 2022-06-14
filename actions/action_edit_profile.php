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

    if ($user && $_POST['oldPassword'] == $user->password) {
        if($_POST['name'] != '') $user->name = $_POST['name'];
        if($_POST['username'] != '') $user->username = $_POST['username'];
        if($_POST['phone'] != '') $user->phone = intval($_POST['phone']);
        if($_POST['newPassword' != '']) $user->password = ($_POST['newPassword']);
        $user->save($db);

        if ($_POST['username'] != '') $session->setName($_POST['username']);
        $userAddresses = Address::getUserAddresses($db, $user->id);
        $userOrders = Pedido::getUserOrders($db, $user->id);
        $favoriteUserRestaurants = Favorite::getUserFavoriteRestaurants($db, $user->id);
        drawMyProfile($db, $user, $userAddresses, $userOrders, $favoriteUserRestaurants, 0);
    }
    else if ($user && $_POST['oldPassword'] == ''){
        if ($_POST['username'] != '') $session->setName($_POST['username']);
        $userAddresses = Address::getUserAddresses($db, $user->id);
        $userOrders = Pedido::getUserOrders($db, $user->id);
        $favoriteUserRestaurants = Favorite::getUserFavoriteRestaurants($db, $user->id);
        drawMyProfile($db, $user, $userAddresses, $userOrders, $favoriteUserRestaurants,1);
    }
    else {
        $error = 2;
        if ($_POST['username'] != '') $session->setName($_POST['username']);
        $userAddresses = Address::getUserAddresses($db, $user->id);
        $userOrders = Pedido::getUserOrders($db, $user->id);
        $favoriteUserRestaurants = Favorite::getUserFavoriteRestaurants($db, $user->id);
        drawMyProfile($db, $user, $userAddresses, $userOrders, $favoriteUserRestaurants, 2);
    }

    header('Location: ../pages/profile.php?userId=' . $session->getId());
?>
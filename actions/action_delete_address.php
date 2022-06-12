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

    $addressId = $_GET['addressId'];

    $db = getDatabaseConnection();
    $db->prepare("DELETE FROM Addresses WHERE id = " . $addressId);

    header('Location: ../pages/profile.php?userId=' . $session->getId());
?>
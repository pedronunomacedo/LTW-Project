<?php
    declare(strict_types = 1);

    require_once(__DIR__ . '/../database/connection.db.php');
    require_once(__DIR__ . '/../database/user.class.php');
    require_once(__DIR__ . '/../utils/session.php');
    $session = new Session();

    if (!$session->isLoggedIn()) die(header('Location: /'));

    $db = getDatabaseConnection();

    $user = User::getUser($db, $session->getId());

    if ($user) {
        $user->name = $_POST['name'];
        $user->phone = $_POST['phone'];
        $user->save($db);

        $session->setName($user->name);
    }

    header('Location: ../pages/profile.php?userUsername=' + $_POST['name']);
?>
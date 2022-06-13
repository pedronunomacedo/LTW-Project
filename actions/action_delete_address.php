<?php
    declare(strict_types = 1);

    require_once(__DIR__ . '/../database/connection.db.php');
    require_once(__DIR__ . '/../database/user.class.php');
    require_once(__DIR__ . '/../database/favorite.class.php');
    require_once(__DIR__ . '/../utils/session.php');
    require_once(__DIR__ . '/../templates/profile.tpl.php');
    $session = new Session();

    if (!$session->isLoggedIn()) die(header('Location: /'));

    if (isset($_POST['action'])) {
        $addressId = $_GET['id'];
        deletey($addressId,$session->getId());
    }

    function deletey($str,$id) {
        $db = getDatabaseConnection();
        $stmt = $db->prepare("DELETE FROM Addresses WHERE (id = ? AND idUser = ?)");
        $stmt->execute(array($str,$id));
    }

    // $addressId = $_GET['addressId'];
    // echo 'aaaaa' . $addressId;

    // $db = getDatabaseConnection();
    // $result = $db->prepare("DELETE FROM Addresses WHERE id = :addressId");
    // $result->bindParam(':addressId', $addressId);
    // $result->execute();

    //header('Location: ../pages/profile.php?userId=' . $session->getId());
?>
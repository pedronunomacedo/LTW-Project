<?php
    include_once('../database/user.class.php');
    include_once('../database/connection.db.php');
    include_once('../utils/session.php');
?>

<?php
    $username = $_POST['username_reg'];
    $name = $_POST['name'];
    $password = $_POST['password2'];

    $db = getDatabaseConnection();

    User::registerUser($db, $username, $name, $password);

    $user = User::getUserByUsername($db, $username);

    if ($user) {
        $session = new Session();
        $session->setName($user->username);
        $session->setId($user->id);
        header('Location: ../pages/index.php?userUsername=' . $user->username);
    }
    else {
        header('Location: ../pages/login.php');
    }
?>
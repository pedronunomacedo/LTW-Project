<?php
    include_once('../database/user.class.php');
    include_once('../database/connection.db.php');
    include_once('../utils/session.php');
?>

<?php
    $username = $_POST['username'];
    $password = md5($_POST['password']); //encripts password as soon as it gets it (will work with encripted value at all times)

    $db = getDatabaseConnection();
    $user = User::getUserByUsername($db, $username);

    if ($user) {
        if ($user->username == $username && $user->password == $password) {
            $session = new Session();
            $session->setName($user->username);
            $session->setId($user->id);
            header('Location: ../pages/index.php?userUsername=' . $user->username);
        }
        else if ($user->username == $username && $user->password != $password) {
            $session->addMessage('error', 'Wrong password!');
        }
        else {
            $session->addMessage('error', 'Wrong credentials!');
        }
    }
    else {
        header('Location: ../pages/login.php');
    }
?>
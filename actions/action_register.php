<?php
    include_once('../database/user.class.php');
    include_once('../database/connection.db.php');
    include_once('../utils/session.php');
?>

<?php
    $username = $_POST['username_reg'];
    $password = md5($_POST['password_reg']); //encripts password as soon as it gets it (will work with encripted value at all times)
    $name = $_POST['name_reg'];
    $age = $_POST['age_reg'];
    $nif = $_POST['nif_reg'];
    $phone = $_POST['phone_reg'];
    $address = $_POST['addr_reg'];
    $status = $_POST['status'];
?>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script>
        $('#reg-form input').on('change', function() {
            alert($('input[name=radioName]:checked', '#myForm').val()); 
        });
    </script>
<?php

    $db = getDatabaseConnection();
    $userExists = User::userExists($db, $username);

    if ($userExists == 0) { // User does not exist
        User::registerUser($db, $username, $password, $name, $age, $nif, $phone, $address, $status);
        $user = User::getUserByUsername($db, $username);
        $session = new Session();
        $session->setName($user->username);
        $session->setId($user->id);
        header('Location: ../pages/index.php?userUsername=' . $user->username);
    }
    else { // User already exists
        echo '<script>alert("error");</script>';
        header('Location: ../pages/login.php=id=2');
    }
?>
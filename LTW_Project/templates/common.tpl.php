<?php
    declare(strict_types = 1);
    
    require_once(__DIR__ . '/../utils/session.php');
?>

<?php function drawHeader(Session $session) { ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MyFood</title>
    </head>
    <body>
        <header>
            <a href="../pages/index.php">
                <img src="../images/logo.png" width=80>
                <h1>My Food</h1>
            </a>
            <?php
                if ($session->isLoggedIn()) drawLogoutForm($session);
                else drawLoginForm($session);
            ?>
        </header>
    <main>
<?php } ?>

<?php function drawFooter() { ?> 
    </main>
        <footer>My Food; 2022</footer>
    </body>
</html>
<?php } ?>

<?php function drawLoginForm() { ?>
    <form action="../actions/action_login.php" method="post" class="login">
        <button type="submit"><a href="../pages/login.php">Login / Register</a></button>
    </form>
<?php } ?>

<?php function drawUsernameForm(Session $session) { ?>
    <p><?=$session->getName()?></p>
<?php } ?>

<?php
    declare(strict_types = 1);
    
?>

<?php function drawHeader(Session $session) { ?>
    <!DOCTYPE html>
    <html lang="en">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MyFood</title>
    </head>
    <body>
        <header>
            <div class="container2" id="row">
                <?php if ($session->isLoggedIn()) { ?>
                    <a href= <?= "../pages/index.php?userUsername=" . $session->getName()?>>
                        <img src="../images/logo.png" alt="" width="70" height="70">
                    </a>
                    <a id="headerUsername" href= <?= "../pages/index.php?userUsername=" . $session->getName()?> class="hd-ttl">MyFood</a>
                <?php } 
                else { ?> 
                    <a href="../pages/index.php">
                        <img src="../images/logo.png" alt="" width="70" height="70">
                    </a>
                    <a id="headerLogo" href="../pages/index.php" class="hd-ttl">MyFood</a>
                <?php } ?>
            </div>
            <?php
                if ($session->isLoggedIn()) drawUsernameForm($session);
                else drawLoginForm();
            ?>
        </header>
    <main>
<?php } ?>

<?php function drawFooter() { ?> 
    </main>
    <footer>
        <div class="all-content">
            <span class="rights">© 2022 MyFood  · All Rights Reserved</span>
            <div class="ft-txt">
                <a href="contact.html">Contacts</a>
                <a href="about.html">About Us</a>
                <a href="//livroreclamacoes.pt/">Complaints</a>
            </div>
            <div class="back-top">
                <a href="#">Back to top</a>
            </div>
        </div>
    </footer>
    </body>
</html>
<?php } ?>

<?php function drawLoginForm() { ?>
    <div class="login">
        <form action="../actions/action_login.php" method="post" class="login_form">
            <button type="submit" class="btn"><a href="../pages/login.php">Login / Register</a></button>
        </form>
    </div>
<?php } ?>

<?php function drawUsernameForm(Session $session) { ?>
    <div class="username-div">
        <div class="img-name">
            <i class="material-icons">account_circle</i>
            <a href=<?="../pages/profile.php?userId=" . $session->getId()?> class="user-name"><?=$session->getName()?></a>
        </div>
    </div>
<?php } ?>

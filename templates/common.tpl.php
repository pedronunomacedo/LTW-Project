<?php
    declare(strict_types = 1);
    
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
        <div class = "scroll_menu">
            <div class = "scroll2">
                <a href = "../pages/index.php">Home</a>
                <a href = "../pages/aboutUs.php">About Us</a>
                <a href = "../pages/category.php?category=burger">Burgers</a>
                <a href = "../pages/category.php?category=pizza">Pizza</a>
                <a href = "../pages/category.php?category=sandwiches">Sandwiches</a>
                <a href = "../pages/category.php?category=hot-dogs">Hot-Dogs</a>
                <a href = "../pages/category.php?category=sushi">Sushi</a>
                <a href = "../pages/category.php?category=soups">Soups</a>
                <a href = "../pages/category.php?category=fried">Fried</a>
                <a href = "../pages/category.php?category=vegetarian">Vegetarian</a>
                <a href = "../pages/category.php?category=mexican">Mexican</a>
                <a href = "../pages/category.php?category=portuguese">Portuguese</a>
                <a href = "../pages/category.php?category=ice-cream">Ice-Cream</a>
                <a href = "../pages/category.php?category=drinks">Drinks</a>
                <a href = "../pages/category.php?category=desserts">Desserts</a>
                <a href = "../pages/contactUs.php">Contact Us</a>
            </div>
        </div>
    <main>
<?php } ?>

<?php function drawFooter() { ?> 
    </main>
    <footer class="ft">
        <div class="ft-txt">
            <a href="contact.html">Contacts</a>
            <a href="about.html">About Us</a>
        </div>
        <div class="back-top">
            <a href="#">Back to top</a>
        </div>
    </footer>
    <footer class="ft2">
        <div class="ft-txt2">
            <span class="rights">© 2022 MyFood  · All Rights Reserved</span>
        </div>
    </footer>
    </body>
</html>
<?php } ?>

<?php function drawLoginForm() { ?>
    <form action="../actions/action_login.php" method="post" class="login">
        <button type="submit"><a href="../pages/login.php">Login / Register</a></button>
    </form>
<?php } ?>

<?php function drawUsernameForm(Session $session) { ?>
    <a href=<?="../pages/profile.php?userId=" . $session->getId()?>><?=$session->getName()?></a>
<?php } ?>

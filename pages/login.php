<?php
    declare(strict_types = 1);
    require_once(__DIR__ . '/../database/connection.db.php');
    require_once(__DIR__ . '/../templates/common.tpl.php');
    require_once(__DIR__ . '/../templates/login.tpl.php');
?>
    <link rel="stylesheet" href="../css/common.css"> <!-- Style of the header and the footer -->
    <link rel="stylesheet" href="../css/login.css"> <!-- Style of the login/register page -->
    <script src="../js/main.js"></script>
<?php
    $session = new Session();

    $db = getDatabaseConnection();

    drawHeader($session);

    ?> 
    <div class="box d-block"> 
        <header class="auth">Authentication</header> 
        <div class="both"> <?php
            drawLoginSection();
            drawRegisterSection();
    ?> </div>
        <?php drawInformation(); ?>
    </div> 
    <?php
    
    drawFooter();
?>
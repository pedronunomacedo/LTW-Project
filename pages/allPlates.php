<?php
  declare(strict_types = 1);

  require_once(__DIR__ . '/../database/connection.db.php');
  require_once(__DIR__ . '/../templates/common.tpl.php');
  require_once(__DIR__ . '/../templates/allPlates.tpl.php');
  require_once(__DIR__ . '/../utils/session.php');
  $session = new Session();
?>
  <link rel="stylesheet" href="../css/common.css"> <!-- Style of the header and the footer -->
<?php
  $db = getDatabaseConnection();
  $plates = Plate::getAllPlates($db);

  drawHeader($session);
  drawPlates($plates);
  drawFooter();
?>
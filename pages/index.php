<?php
    declare(strict_types = 1);

    require_once(__DIR__ . '/../database/connection.db.php');
    require_once(__DIR__ . '/../database/restaurant.class.php');
    require_once(__DIR__ . '/../templates/restaurant.tpl.php');
    require_once(__DIR__ . '/../database/plate.class.php');
    require_once(__DIR__ . '/../templates/common.tpl.php');
    require_once(__DIR__ . '/../utils/session.php');
    $session = new Session();

    drawHeader($session);

    $db = getDatabaseConnection();
?>
    <link rel="stylesheet" href="../css/common.css"> <!-- Style of the header and the footer -->
    <link rel="stylesheet" href="../css/index.css"> <!-- Style of body -->
    
    <section class="best-burgers">
        <div class="mini-title">
            <h1>The most popular Hamburguer options</h1>
            <a href="category.php?category=burgers">See all</a>
        </div>
        <div class="group">
            <?php
                $category = "burgers";
                $restaurants = Restaurant::getCategoryRestaurants($db, $category);
                $i = 0;
                foreach ($restaurants as $restaurant) {
                    if ($i == 3) break;
                    restaurantDiv($restaurant);
                    $i++;
                }
            ?>
        </div>
    </section>

    <section class="bext-pizzas">
        <div class="mini-title">
            <h1>The best Pizzas</h1>
            <a href="category.php?category=pizza">See all</a>
        </div>
        <div class="group">
            <?php
                $category = "pizza";
                $restaurants = Restaurant::getCategoryRestaurants($db, $category);
                $i = 0;
                foreach ($restaurants as $restaurant) {
                    if ($i == 3) break;
                    restaurantDiv($restaurant);
                    $i++;
                }
            ?>
        </div>
    </section>

    <section class="most-popular-plates">
        <div class="mini-title">
            <h1>Another plates</h1>
            <a href="allPlates.php">See all</a>
        </div>
        <div class="group">
            <?php
                $plates = Plate::getAllPlates($db);
                $i = 0;
                foreach ($plates as $plate) {
                    if ($i == 3) break;
                    drawPlate($plate);
                    $i++;
                }
            ?>
        </div>
    </section>
    
<?php
    drawFooter();
?>
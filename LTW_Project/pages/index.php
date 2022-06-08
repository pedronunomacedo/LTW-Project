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
    <section class="best-burgers">
        <h1>The most popular Hamburguer options</h1>
        <a href="category.php?category=burger">See all</a>
        <?php
            $category = "burger";
            $restaurants = Restaurant::getCategoryRestaurants($db, $category);
            $i = 0;
            foreach ($restaurants as $restaurant) {
                if ($i == 3) break;
                restaurantDiv($restaurant);
                $i++;
            }
        ?>
    </section>

    <section class="bext-pizzas">
        <h1>The best Pizzas</h1>
        <a href="category.php?category=pizza">See all</a>
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
    </section>

    <section class="most-popular-plates">
        <h1>The most popular plates</h1>
        <a href="popularRestaurant.php?">See all</a>
        <?php
            $category = "burger";
            $restaurants = Plate::getCategoryPlates($db, $category);
            $i = 0;
            foreach ($restaurants as $restaurant) {
                if ($i == 3) break;
                drawPlate($restaurant);
                $i++;
            }
        ?>
    </section>
    
<?php
    drawFooter();
?>

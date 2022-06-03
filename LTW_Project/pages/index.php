<?php
    declare(strict_types = 1);

    require_once(__DIR__ . '/../database/connection.db.php');
    require_once(__DIR__ . '/../database/restaurant.class.php');
    require_once(__DIR__ . '/../templates/restaurant.tpl.php');
    require_once(__DIR__ . '/../database/plate.class.php');

    $db = getDatabaseConnection();
    ?>
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
<?php ?>
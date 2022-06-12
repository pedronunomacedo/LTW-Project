<?php
    declare(strict_types = 1); 
    require_once('../database/plate.class.php');
?>

<?php function drawCategoryRestaurants(PDO $db, array $categoryRestaurants, string $category) { ?>
    <h1><?=ucwords($category)?></h1>

    <div class="category-restaurants">
        <?php
            foreach ($categoryRestaurants as $restaurant) { ?>
                <div class="column">
                    <a href=<?="../pages/restaurant.php?id=" . $restaurant->id?>>
                        <div class="items">
                            <img src="https://api.lorem.space/image/house?w=150&h=150">
                            <p><?=$restaurant->name?></p>
                        </div>
                    </a>
                </div>
            <?php }
        ?>
    </div>
<?php } ?>
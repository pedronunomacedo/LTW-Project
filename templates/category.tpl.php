<?php
    declare(strict_types = 1); 
    require_once('../database/plate.class.php');
?>

<?php function drawCategoryRestaurants(PDO $db, array $categoryRestaurants, string $category) { ?>
    <h1><?=ucwords($category)?></h1>
    <div class="row">
        <?php
            foreach ($categoryRestaurants as $restaurant) { ?>
                <div class="plate">
                    <a href=<?php echo "../pages/restaurant.php?id=" . $restaurant->id?>><img src="https://api.lorem.space/image/house?w=150&h=150"></a>
                    <p><?=$restaurant->name?></p>
                </div>
            <?php }
        ?>
    </div>
<?php } ?>
<?php
    declare(strict_types = 1); 
    require_once('../database/plate.class.php');
?>

<?php function drawCategoryRestaurants(PDO $db, array $categoryRestaurants, string $category) { ?>
    <h1><?=ucwords($category,"-")?></h1>

    <section class="category-restaurants">
        <?php
            foreach ($categoryRestaurants as $restaurant) { ?>
                <img src="https://api.lorem.space/image/house?w=150&h=150">
                <p><?=$restaurant->name?></p>
            <?php }
        ?>
    </section>
<?php } ?>
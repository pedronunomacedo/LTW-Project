<?php
    declare(strict_types = 1); 
    require_once('../database/restaurant.class.php');
    require_once('../templates/plate.tpl.php');
?>

<?php function drawPlates(array $allPlates) { ?>
    <h1>All Plates</h1>
    <?php foreach ($allPlates as $plate) { ?>
        <div class="row">
            <div class="plate">
                <a href=<?php echo "../pages/restaurant.php?id=" . $plate->idRestaurant?>><img src="https://mariamarlowe.com/wp-content/uploads/2019/12/Veggie-Bowl_Maria-Marlowe-3-1-3-744x533.jpg"></a>
                <small class="plate-price"><?=$plate->price?> €</small>
                <p class="plate-name"><?=$plate->name?></p>
            </div>
        </div>
    <?php }
} ?>
<?php
    declare(strict_types = 1); 
    require_once('../database/plate.class.php');
?>

<?php function drawPlate(Plate $plate) { ?>
    <div class="plate">
        <a href=<?php echo "../pages/restaurant.php?id=" . $plate->idRestaurant?>><img src="https://mariamarlowe.com/wp-content/uploads/2019/12/Veggie-Bowl_Maria-Marlowe-3-1-3-744x533.jpg"></a>
        <small class="plate-price"><?=$plate->price?> €</small>
        <p class="plate-name"><?=$plate->name?></p>
    </div>
<?php } ?>
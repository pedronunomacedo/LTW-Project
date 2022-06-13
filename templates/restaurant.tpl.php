<?php
    declare(strict_types = 1); 
    require_once('../database/restaurant.class.php');
    require_once('../templates/plate.tpl.php');
?>

<?php function drawRestaurant(PDO $db, Restaurant $restaurant, array $plates) {
    $restaurantGrade = Restaurant::getRestaurantGrade($db, intval($restaurant->id));
    $numClassifications = Restaurant::getNumberClassifications($db, intval($restaurant->id))
    ?>
    <img src="../images/restaurantImg.png">
    <h2><?=$restaurant->name?></h2>
    <div class="restaurant-info">
        <h4><?=$restaurantGrade?> (<?=$numClassifications?> classifications) <a href="../pages/comments.php?id=<?php echo $restaurant->id?>">More informations</a></h4s>
    </div>

    <section class="main-titles">
        <h2>Plates</h3>
        <h2>Drinks</h3>
        <h2>Desserts</h3>
        <h2>Extras</h3>
    </section>

    <?php $foodPlates = array(); $drinks = array(); $desserts = array(); $extras = array();

    foreach ($plates as $plate) {
        if ($plate->category == 'pizza' or $plate->category == 'sushi' or $plate->category == 'burgers' or $plate->category == 'sandwiches' or $plate->category == 'hot-dogs' or $plate->category == 'fried' or $plate->category == 'vegetarian' or $plate->category == 'mexican' or $plate->category == 'portuguese' or $plate->category == 'soups') {
            $foodPlates[] = $plate;
        }
        else if ($plate->category == 'coldDrink' or $plate->category == 'hotDrink' or $plate->category == 'drinks') {
            $drinks[] = $plate;
        }
        else if ($plate->category == 'desserts') {
            $desserts[] = $plate;
        }
        else {
            $extras[] = $plate;
        }
    } ?>

    <section class="scroll-menu">
        <section class="plates">
            <h3 id="scroll-title">Plates</h3>
            <?php
                if (sizeof($foodPlates) > 0) {
                    foreach($foodPlates as $plate) {
                        if ($plate->category == 'pizza' ) { ?>
                            <article>
                                <section class="restaurant_plate_image">
                                    <img src="https://api.lorem.space/image/pizza?w=150&h=150">
                                    <p><?=$plate->price?>
                                </section>
                                <p><?=$plate->name?></p>
                            </article>
                        <?php }
                        else if ($plate->category == 'burgers') { ?>
                            <article>
                                <section class="restaurant_plate_image">
                                    <img src="https://api.lorem.space/image/burger?w=150&h=150">
                                    <p><?=$plate->price?> €</p>
                                </section>
                                <p><?=$plate->name?></p>
                            </article>
                        <?php }
                        else if ($plate->category == 'sushi') { ?>
                            <article>
                                <section class="restaurant_plate_image">
                                    <img src="https://api.lorem.space/image/burger?w=150&h=150">
                                    <p><?=$plate->price?> €</p>
                                </section>
                                <p><?=$plate->name?></p>
                            </article>
                        <?php }
                        else if ($plate->category == 'extras') { ?>
                            <article>
                                <section class="restaurant_plate_image">
                                    <img src="https://picsum.photos/200?<?=$plate->id?>">
                                    <p><?=$plate->price?> €</p>
                                </section>
                                <p><?=$plate->name?></p>
                            </article>
                        <?php } ?>
                <?php }
                }
                else {
                    echo '<p> No plates available! </p>';
                }
            ?>
        </section>

        <section class="drinks">
            <h3 id="scroll-title">Drinks</h3>
            <?php
                if (sizeof($drinks) > 0) {
                    foreach($drinks as $drink) { ?>
                        <article>
                            <section class="drinks_image">
                                <img src="https://api.lorem.space/image/drink?w=150&h=150">
                                <p><?=$drink->price?> €</p>
                            </section>
                            <p><?=$drink->name?></p>
                        </article>
                <?php }
                }
                else {
                    echo '<p> No drinks available! </p>';
                }
            ?>
        </section>

        <section class="desserts">
            <h3 id="scroll-title">Desserts</h3>
            <?php
                if (sizeof($desserts) > 0) {
                    foreach($desserts as $dessert) { ?>
                        <article>
                            <section class="desserts_image">
                                <img src="data:image/jpeg;base64,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">
                                <p><?=$dessert->price?> €</p>
                            </section>
                            <p><?=$dessert->name?></p>
                        </article>
                <?php }
                }
                else {
                    echo '<p> No desserts available! </p>';
                }
            ?>
        </section>

        <section class="extras">
            <h3 id="scroll-title">Extras</h3>
            <?php
            if (sizeof($extras) > 0) {
                foreach($extras as $extra) { ?>
                    <article>
                        <section class="extras_image">
                            <img src="https://pixabay.com/get/g467b69173caff6c0d6e3c0b14dedfb1a0964905b652bddf3fde56076306d0136df547d78b815122741f3df4a01502482_640.jpg">
                            <p><?=$extra->price?> €</p>
                        </section>
                    </article>
            <?php }
            }
            else {
                echo '<p> No extras available! </p>';
            }
        ?>
        </section>
    </section>
<?php } ?>

<?php function restaurantDiv(Restaurant $restaurant) { ?>
    <div class="plate">
        <a href=<?php echo "../pages/restaurant.php?id=" . $restaurant->id?>><img src="../images/restaurantImg.png"></a>
        <p><?=$restaurant->name?></p>
    </div>
<?php } ?>

<?php function drawFavoriteRestaurant(Restaurant $restaurant, float $restaurantGrade) { ?>
    <section class="favorite-restaurant">
        <img src="../images/restaurantImg.png">
        <p><?=$restaurant->name?></p>
        <p><?=$restaurantGrade?></p>
    </section>
<?php }?>
<?php
    declare(strict_types = 1); 
    //require_once(__DIR__ . '/../database/plate.class.php');
    require_once(__DIR__ . '/../database/user.class.php');
    require_once(__DIR__ . '/../database/pedido.class.php');
    require_once(__DIR__ . '/../database/restaurant.class.php');
?>

<?php function drawTitles() { ?>
    <div class="main-titles">
        <h1>My Profile</h1>
        <h1>My Addresses</h1>
        <h1>My Orders</h1>
        <h1>My Favorites</h1>
    </div>
<?php } ?>

<?php function drawMyProfile(PDO $db, User $user, array $userAddresses, array $userOrders, array $favoriteRestaurants) {
    $userProfilePic = $user->profilePic;
    $userUsername = $user->username;
    $userPassword = $user->password;
    $userName = $user->name;
    $userAge = $user->age;
    $userNIF = $user->nif;
    $userPhone = $user->phone;
    $userAddress = $user->address;
    //$client = $user->client;

    ?>
    <div class="my-profile-section" class="show">
        <div>
            <img src="<?=$userProfilePic?>" width=150>
            <h2><?=ucwords($userName)?></h2>
        </div> 
        <div class="my-profile-div">
            <form action="../actions/action_edit_profile.php" method="post">
                <p><label for="name">Insert your new name</label></p>
                <input type="text" placeholder="name" name="name"><p>
                <p><label for="username">Insert your new username: </label></p>
                <input type="text" id="name" name="username" class="form-control form-control-filled" autocorrect="off" autocomplete="off" autocapitalize="off" placeholder="username">
                <p><label for="phone">Insert your new phone number</label></p>
                <input type="text" placeholder="phone" name="phone"><p>
                <button type="submit" class="btn-save-changes">Save changes</button>
            </form>
            <form action="../actions/action_logout.php" method="post" class="logout">
                <button type="submit">Logout</button>
            </form>
        </div>
    </div>
    <div class="my-addresses-section" class="hidden">
        <div class="new-address-div"><button><img src="../images/plus-address.png" width=20> Add new address</button></div>
        <div for="new-address-div">
            <form action=<?php echo "../actions/action_add_new_address.php" ?> method="post">
                <p><label for="new-address">Insert your new address</label></p>
                <input type="text" placeholder="address" name="new-address" class="diactivated"></p>
                <button type="submit" class="btn-save-changes">Save changes</button>
            </form>
        </div>
        <div class="user-addresses">
            <?php foreach($userAddresses as $address) { ?>
                <div class="user-address">
                    <h6><?=$address->address?></h6>
                    <button type="button" class="btn-edit-address">Edit</button>
                    <button type="button" class="btn-delete-address">Delete</button>
                </div>
            <?php } ?>
        </div>
    </div>

    <div class="my-orders-div" class="hidden">
        <?php foreach ($userOrders as $order) { ?>
            <?php $restaurantName = Restaurant::getRestaurantName($db, intval($order->idRestaurant)); ?>
            <div class="user-order">
                <p>Order <?=$order->id?> (<?=$order->submissonDate?> | <?=$order->submissonHour?>)</p>
                <p><?=$restaurantName?></p>
            </div>
        <?php } ?>
    </div>

    <div class="my-favorites-div" class="hidden">
        <?php foreach ($favoriteRestaurants as $favorite) { ?>
            <?php $restaurantName = Restaurant::getRestaurantName($db, intval($favorite->idRestaurant)); ?>
            <div class="user-order">
                <p>Name: <?=$restaurantName?></p>
            </div>
        <?php } ?>
    </div>

<?php } ?>

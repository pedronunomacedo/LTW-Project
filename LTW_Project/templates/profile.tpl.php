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
    <div class="my-profile-section">
        <div>
            <img src="<?=$userProfilePic?>" width=150>
            <h2><?=ucwords($userName)?></h2>
        </div> 
        <div class="my-profile-div">
            <form method="GET">
                <p>Name: <input type="text" placeholder="name"></p>
            </form>
            <form method="GET">
                <p>Email: <input type="text" placeholder="email"></p>
            </form>
            <form method="GET">
                <p>Phone: <input type="text" placeholder="phone"></p>
            </form>
            <button type="button" class="btn-save-changes">Save changes</button>
            <button type="button" class="btn-end-session">Log out</button>
        </div>
    </div>
    <div class="my-addresses-section">
        <button class="new-address-btn"><img src="../images/plus-address.png" width=20> Add new address</button>
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

    <div class="my-orders-div">
        <?php foreach ($userOrders as $order) { ?>
            <?php $restaurantName = Restaurant::getRestaurantName($db, intval($order->idRestaurant)); ?>
            <div class="user-order">
                <p>Order <?=$order->id?> (<?=$order->submissonDate?> | <?=$order->submissonHour?>)</p>
                <p><?=$restaurantName?></p>
            </div>
        <?php } ?>
    </div>

    <div class="my-favorites-div">
        <?php foreach ($favoriteRestaurants as $favorite) { ?>
            <?php $restaurantName = Restaurant::getRestaurantName($db, intval($favorite->idRestaurant)); ?>
            <div class="user-order">
                <p>Name: <?=$restaurantName?></p>
            </div>
        <?php } ?>
    </div>

<?php } ?>

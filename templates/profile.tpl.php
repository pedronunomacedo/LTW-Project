<?php
    declare(strict_types = 1); 
    //require_once(__DIR__ . '/../database/plate.class.php');
    require_once(__DIR__ . '/../database/user.class.php');
    require_once(__DIR__ . '/../database/pedido.class.php');
    require_once(__DIR__ . '/../database/restaurant.class.php');
?>

<?php function drawTitles() { ?>
    <div class="max">
    <div class="main-titles">
        <div class="my-profile flex">
            <i class="material-icons">assignment_ind</i>
            <small>My Profile</small>
        </div>
        <div class="my-addresses flex">
            <i class="material-icons">place</i>
            <small>My Addresses</small>
        </div>
        <div class="my-orders flex">
            <i class="material-icons">business_center</i>
            <small>My Orders</small>
        </div>
        <div class="my-favorites flex">
            <i class="material-icons">star</i>
            <small>My Favorites</small>
        </div>
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
    <div class="my-profile-section center show">
        <div class="change-info">
        <div>
            <img src="<?=$userProfilePic?>" width=150>
            <h2><?=ucwords($userName)?></h2>
        </div> 
        <div class="my-profile-div">
            <form action="../actions/action_edit_profile.php" method="post">
                <p><label for="name">Insert your new name</label></p>
                <input type="text" placeholder="Name" name="name"><p>
                <p><label for="username">Insert your new username: </label></p>
                <input type="text" id="name" name="username" class="form-control form-control-filled" autocorrect="off" autocomplete="off" autocapitalize="off" placeholder="Username">
                <p><label for="phone">Insert your new phone number</label></p>
                <input type="text" placeholder="Phone Number" name="phone"><p>
                <button type="submit" class="btn-save-changes">Save changes</button>
            </form>
            <form action="../actions/action_logout.php" method="post" class="logout">
                <button type="submit">Logout</button>
            </form>
        </div>
        </div>
    </div>
    <div class="my-addresses-section center hidden">
        <div class="both">
        <div class="new-address-div">
            <button><img src="../images/plus-address.png" width=20> Add new address</button>
            <form action=<?php echo "../actions/action_add_new_address.php" ?> method="post">
                <p><label for="new-address">Insert your new address</label></p>
                <input type="text" placeholder="New address" name="new-address" class="diactivated"></p>
                <button type="submit" class="btn-save-changes">Save changes</button>
            </form>
        </div>
        <div class="user-addresses">
            <?php foreach($userAddresses as $address) { ?>
                <div class="user-address">
                    <div class="pd">
                    <small><?=$address->address?></small>
                    <div class="btns">
                        <button type="button" class="btn-edit-address">Edit</button>
                        <button type="button" class="btn-delete-address">Delete</button>
                    </div>
                    </div>
                </div>
            <?php } ?>
        </div>
        </div>
    </div>

    <div class="my-orders-div center hidden">
        <?php foreach ($userOrders as $order) { ?>
            <?php $restaurantName = Restaurant::getRestaurantName($db, intval($order->idRestaurant)); ?>
            <div class="user-order">
                <p>Order <?=$order->id?> (<?=$order->submissonDate?> | <?=$order->submissonHour?>)</p>
                <p><?=$restaurantName?></p>
            </div>
        <?php } ?>
    </div>

    <div class="my-favorites-div center hidden">
        <div class="name">
        <?php foreach ($favoriteRestaurants as $favorite) { ?>
            <?php $restaurantName = Restaurant::getRestaurantName($db, intval($favorite->idRestaurant)); ?>
            <div class="user-order">
                <p>Name: <?=$restaurantName?></p>
            </div>
        <?php } ?>
        </div>
    </div>
    </div>

<?php } ?>

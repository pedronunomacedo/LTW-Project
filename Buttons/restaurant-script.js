var restaurant = null;
var category = null;

window.onload = function() {
    getUrlParameters();
    // addBackgroundColor(category);
    changePageTitle(restaurant);
    addMainImage(restaurant, category);
    addRestaurantTitle(restaurant);
    addRestaurantDescription(restaurant);
    addRestaurantPlates(restaurant, category);
}


function getUrlParameters() {
    var url_string = window.location.href;
    var url = new URL(url_string);
    restaurant = url.searchParams.get("restaurant");
    category = url.searchParams.get("category");
}


function changePageTitle(restaurant) {
    var restaurantCapitalized = restaurant.charAt(0).toUpperCase() + restaurant.slice(1);
    document.title = restaurantCapitalized;
}


function addMainImage(restaurant, category) {
    var mainImage = document.getElementById("main-image");
    mainImage.src = "img/" + category + "/restaurants/" + restaurant + ".png";
}


function addRestaurantTitle(restaurant) {
    var restaurantTitle = document.getElementById("restaurant-title");

    restaurantTitle.innerHTML = restaurant.charAt(0).toUpperCase() + restaurant.slice(1);
}


function addRestaurantDescription(restaurant) {
    var classification = document.getElementById("classification");
    classification.innerHTML = 4.7;

    var numberClassifications = document.getElementById("number-classifications");
    numberClassifications.innerHTML = "(" + 56 + " classificações)";

    var moreInfo = document.getElementById("more-info");
    moreInfo.href = "restaurant-description.html?restaurant=" + restaurant;
}


function addRestaurantPlates(restaurant, category) {
    var menuList = document.getElementById("vertical-menu");
    var platesList = document.getElementById("plates");
    var platesTitle = document.createElement("h3");
    platesTitle.innerHTML = "Plates";
    platesList.appendChild(platesTitle);

    for (let i = 1; i < 5; i++) {
        var platePicture = document.createElement("picture");
        platePicture.className = "plate";
        var plateImg = document.createElement("img");
        var tag = document.createElement("figcaption");
        
        plateImg.src = "img/" + category + "/plates/image" + i + ".png";
        tag.innerHTML = "Plate" + i;

        platePicture.appendChild(plateImg);
        platePicture.appendChild(tag);

        platesList.appendChild(platePicture);
    }
    
}
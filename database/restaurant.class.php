<?php
    include('plate.class.php');
    class Restaurant {
        public int $id;
        public int $idUser;
        public string $name;
        public string $address;
        public string $type;

        public function __construct(int $id, int $idUser, string $name, string $address, string $type) {
            $this->id = $id;
            $this->idUser = $idUser;
            $this->name = $name;
            $this->address = $address;
            $this->type = $type;
        }

        static function getRestaurant(PDO $db, int $id) : Restaurant {
            $stmt = $db->prepare('SELECT * FROM Restaurant WHERE id = ?');
            $stmt->execute(array($id));

            $restaurant = $stmt->fetch();

            return new Restaurant(
                $restaurant['id'],
                $restaurant['idUser'],
                $restaurant['name'],
                $restaurant['address'],
                $restaurant['type']
            );
        }

        static function getAllRestaurants(PDO $db) : array {
            $stmt = $db->prepare('SELECT * FROM Restaurant');
            $stmt->execute();

            $allRestaurants = array();

            while ($restaurant = $stmt->fetch()) {
                $allRestaurants[] = new Restaurant(
                    $restaurant['id'],
                    $restaurant['idUser'],
                    $restaurant['name'],
                    $restaurant['address'],
                    $restaurant['type']
                );
            }

            return $allRestaurants;
        }

        static function getCategoryRestaurants(PDO $db, string $category) : array {
            $stmt = $db->prepare("SELECT DISTINCT Restaurant.id, Restaurant.idUser, Restaurant.name, Restaurant.address, Restaurant.type
                                FROM Restaurant,Plate 
                                WHERE (Plate.category = '" . $category .  "' AND Plate.idRestaurant = Restaurant.id)");
            $stmt->execute();

            $categoryRestaurants = array();

            while ($restaurant = $stmt->fetch()) {
                $categoryRestaurants[] = new Restaurant(
                    $restaurant['id'],
                    $restaurant['idUser'],
                    $restaurant['name'],
                    $restaurant['address'],
                    $restaurant['type']
                );
            }

            return $categoryRestaurants;
        }

        static function getRestaurantName(PDO $db, int $id) : string{
            $stmt = $db->prepare("SELECT Restaurant.name FROM Restaurant WHERE id = ?");
            $stmt->execute(array($id));

            $restaurant = $stmt->fetch();

            return $restaurant['name'];
        }

        static function getRestaurantGrade(PDO $db, int $id) : float {
            $stmt = $db->prepare('SELECT Pedido.idRestaurant, avg(FavTable.grade) as restaurantGrade
                                FROM Pedido, (SELECT Review.idPedido, Review.grade FROM Review) as FavTable
                                WHERE (Pedido.id=FavTable.idPedido AND Pedido.idRestaurant=' . $id . ')
                                GROUP BY Pedido.idRestaurant');
            $stmt->execute();

            $grade = $stmt->fetch();
            
            if ($grade) {
                if ($grade['restaurantGrade']) {
                    return intval($grade['restaurantGrade']);
                }
            }
            
            return 0;
        }

        static function getNumberClassifications(PDO $db, int $id) : int {
            $stmt = $db->prepare('SELECT Pedido.idRestaurant, count(FavTable.grade) as numReviews
                                FROM Pedido, (SELECT Review.idPedido, Review.grade FROM Review) as FavTable
                                WHERE (Pedido.id=FavTable.idPedido AND Pedido.idRestaurant=' . $id . 
                                ') GROUP BY Pedido.idRestaurant');
            $stmt->execute();
            $numClassifications = intval($stmt->fetch());

            return $numClassifications;
        }

        static function getProperRestaurants(PDO $db, int $userId) {
            $stmt = $db->prepare('SELECT * FROM Restaurant WHERE Restaurant.idUser = ?');
            $stmt->execute(array($userId));

            $userRestaurants = array();

            while ($restaurant = $stmt->fetch()) {
                $userRestaurants[] = new Restaurant(
                    $restaurant['id'],
                    $restaurant['idUser'],
                    $restaurant['name'],
                    $restaurant['address'],
                    $restaurant['type']
                );
            }

            return $userRestaurants;
        }

        // static function getRestaurantComments(PDO $db, int $id) {
        //     $stmt = $db->prepare('SELECT select Pedido.idRestaurant, Review.idPedido, Review.comment, Review.submissonDate, Review.submissonHour, Review.grade, Review.answer from Review,Pedido
        //                         where (Review.idPedido=Pedido.id AND Pedido.idRestaurant=?)');
            
        //     $stmt->execute(array($id));
        //     $comments = array();

        //     while ($comment = $stmt->fetch()) {
        //         $plates = new Plate(
        //             $plate['id'],
        //             $plate['idRestaurant'],
        //             $plate['name'],
        //             $plate['category'],
        //             $plate['price']
        //         );
        //     }
        // }
    }
?>
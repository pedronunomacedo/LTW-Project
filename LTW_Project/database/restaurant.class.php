<?php
    include('plate.class.php');
    class Restaurant {
        public int $id;
        public string $name;
        public string $address;
        public string $type;

        public function __construct(int $id, int $idOwner, string $name, string $address, string $type) {
            $this->id = $id;
            $this->idOwner = $idOwner;
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
                $restaurant['idOwner'],
                $restaurant['name'],
                $restaurant['address'],
                $restaurant['type'] 
            );
        }

        static function getCategoryRestaurants(PDO $db, string $category) : array {
            $stmt = $db->prepare('SELECT Restaurant.id, Restaurant.idOwner, Restaurant.name, Restaurant.address, Restaurant.type
                                FROM Restaurant, Plate 
                                WHERE (Plate.category = ? AND Plate.idRestaurant = Restaurant.id)');
            $stmt->execute(array($category));

            $categoryRestaurants = array();;

            while ($restaurant = $stmt->fetch()) {
                $categoryRestaurants[] = new Restaurant(
                    $restaurant['id'],
                    $restaurant['idOwner'],
                    $restaurant['name'],
                    $restaurant['address'],
                    $restaurant['type']
                );
            }

            return $categoryRestaurants;
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
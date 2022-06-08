<?php
    declare(strict_types = 1);
    include_once('../database/addresses.class.php');
    include_once('../database/pedido.class.php');

    class Favorite {
        public int $id;
        public int $idUser;
        public int $idRestaurant;
        
        public function __construct($id, $idUser, $idRestaurant) {
            $this->id = $id;
            $this->idUser = $idUser;
            $this->idRestaurant = $idRestaurant;
        }

        static function getFavorite(PDO $db, int $id) : Client {
            $stmt = $db->prepare('SELECT * FROM Favorite WHERE id = ?');
            $stmt->execute(array($id));
            $favorite = $stmt->fetch();

            return new Favorite(
                intval($client['id']),
                intval($client['idUser']),
                intval($client['idRestaurant'])
            );
        }

        static function getUserFavoriteRestaurants(PDO $db, int $id) : array {
            $stmt = $db->prepare('SELECT * FROM Favorites WHERE idUser = ' . $id);
            $stmt->execute(); 
            
            $favoriteRestaurants = array();

            while ($favorite = $stmt->fetch()) {
                $favoriteRestaurants[] = new Favorite(
                    intval($favorite['id']),
                    intval($favorite['idUser']),
                    intval($favorite['idRestaurant'])
                );
            }

            return $favoriteRestaurants;
        }
    }
?>
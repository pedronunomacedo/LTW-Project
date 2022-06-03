<?php
    declare(strict_types = 1);

    class Plate {
        public int $id;
        public int $idRestaurant;
        public string $name;
        public string $category;
        public float $price;

        public function __construct(int $id, int $idRestaurant, string $name, string $category, float $price) {
            $this->id = $id;
            $this->idRestaurant = $idRestaurant;
            $this->name = $name;
            $this->category = $category;
            $this->price = $price;
        }

        static function getPlate(PDO $db, int $id) : Plate {
            $stmt = $db->prepare('SELECT * FROM Plate WHERE id = ?');
            $stmt->execute(array($id));

            $plate = $stmt->fetch();

            return new Plate(
                $plate['id'],
                $plate['idRestaurant'],
                $plate['name'],
                $plate['category'],
                $plate['price']
            );
        }

        static function getRestaurantPlates(PDO $db, int $id) : array {
            $stmt = $db->prepare('SELECT * FROM Plate WHERE idRestaurant = ?');
            $stmt->execute(array($id));

            $plates = array();

            while ($plate = $stmt->fetch()) {
                $plates[] = new Plate(
                    $plate['id'],
                    $plate['idRestaurant'],
                    $plate['name'],
                    $plate['category'],
                    $plate['price']
                );
            }
            
            return $plates;
        }
    }
?>
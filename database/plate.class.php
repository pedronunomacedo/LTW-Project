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
                intval($plate['id']),
                intval($plate['idRestaurant']),
                $plate['name'],
                $plate['category'],
                floatval($plate['price'])
            );
        }

        static function getAllPlates(PDO $db) : array {
            $stmt = $db->prepare('SELECT * FROM Plate');
            $stmt->execute();

            $allPlates = array();

            while ($plate = $stmt->fetch()) {
                $allPlates[] = new Plate(
                    intval($plate['id']),
                    intval($plate['idRestaurant']),
                    $plate['name'],
                    $plate['category'],
                    floatval($plate['price'])
                );
            }
            
            return $allPlates;
        }

        static function getRestaurantPlates(PDO $db, int $id) : array {
            $stmt = $db->prepare('SELECT * FROM Plate WHERE idRestaurant = ?');
            $stmt->execute(array($id));

            $plates = array();

            while ($plate = $stmt->fetch()) {
                $plates[] = new Plate(
                    intval($plate['id']),
                    intval($plate['idRestaurant']),
                    $plate['name'],
                    $plate['category'],
                    floatval($plate['price'])
                );
            }
            
            return $plates;
        }

        static function getCategoryPlates(PDO $db, $category) {
            $stmt = $db->prepare('SELECT * FROM Plate WHERE category = ?');
            $stmt->execute(array($category));
            
            $categoryPlates = array();

            while ($plate = $stmt->fetch()) {
                $categoryPlates[] = new Plate(
                    intval($plate['id']),
                    intval($plate['idRestaurant']),
                    $plate['name'],
                    $plate['category'],
                    floatval($plate['price'])
                );
            }
            
            return $categoryPlates;
        }
    }
?>
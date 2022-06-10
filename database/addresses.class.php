<?php
    declare(strict_types = 1);

    class Address {
        public int $id;
        public int $idUser;
        public string $address;

        public function __construct(int $id, int $idUser, string $address) {
            $this->id = $id;
            $this->idUser = $idUser;
            $this->address = $address;
        }

        static function getUserAddresses(PDO $db, int $id) : array {
            $stmt = $db->prepare("SELECT * FROM Addresses WHERE idUser = " . $id);
            $stmt->execute();

            $userAddresses = array();
            
            while ($address = $stmt->fetch()) {
                $userAddresses[] = new Address (
                    $address['id'],
                    $address['idUser'], 
                    $address['address']
                );
            }
            
            return $userAddresses;
        }
    }
?>
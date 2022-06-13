<?php
    declare(strict_types = 1);
    include_once('../database/addresses.class.php');
    include_once('../database/pedido.class.php');

    class User {
        public int $id;
        public string $profilePic;
        public string $username;
        public string $password;
        public string $name;
        public int $age;
        public int $nif;
        public int $phone;
        public string $address;
        public int $client;
        
        public function __construct(int $id, string $profilePic, string $username, string $password, string $name, int $age, int $nif, int $phone, string $address, int $client) {
            $this->id = $id;
            $this->profilePic = $profilePic;
            $this->username = $username;
            $this->password = $password;
            $this->name = $name;
            $this->age = $age;
            $this->nif = $nif;
            $this->phone = $phone;
            $this->address = $address;
            $this->$client = $client;
        }

        static function getUser(PDO $db, int $id) : User {
            $stmt = $db->prepare("SELECT * FROM User WHERE id = ?");
            $stmt->execute(array($id));
            $user = $stmt->fetch();

            return new User(
                intval($user['id']),
                $user['profilePic'],
                $user['username'],
                $user['password'],
                $user['name'],
                intval($user['age']),
                intval($user['nif']),
                intval($user['phone']),
                $user['address'],
                intval($user['client'])
            );
        }

        static function userExists(PDO $db, string $username) : int {
            $stmt = $db->prepare("SELECT * FROM User WHERE username = ?");
            $stmt->execute(array($username));
            $result = $stmt->fetch();

            if (!empty($result)) { // User exists
                return 1;
            }
            else { // User does not exist
                return 0;
            }
        }

        static function getUserByUsername(PDO $db, string $username) : User {
            $stmt = $db->query("SELECT * FROM User WHERE username = :username");
            $stmt->bindParam(':username', $username);

            $stmt->execute();
            $user = $stmt->fetch();

            return new User(
                intval($user['id']),
                $user['profilePic'],
                $user['username'],
                $user['password'],
                $user['name'],
                intval($user['age']),
                intval($user['nif']),
                intval($user['phone']),
                $user['address'],
                intval($user['client'])
            );
        }

        static function getUserReviews(PDO $db, int $id) : array {
            $stmt = $db->prepare('SELECT Review.idPedido, Review.title, Review.comment, Review.submissonDate, Review.submissonHour, Review.grade, Review.answer FROM Review WHERE idUser = ?');
            $stmt->execute(array($id));
            $reviews = $stmt->fetchAll();

            return $reviews;
        }

        function save($db) {
            $stmt = $db->prepare('UPDATE User SET name = ?,
                                 username = ?,
                                 phone = ?
                                WHERE id = ?');
      
            $stmt->execute(array($this->name, $this->username, $this->phone, $this->id));
        }

        static function saveAddress(PDO $db, int $id, string $newAddress) {
            if ($newAddress != '') {
                $stmt = $db->prepare("INSERT INTO Addresses ('idUser', 'address')
                                VALUES ( ? , ? )"
                                );
                $stmt->execute(array($id, $newAddress));
            }
        }

        static function registerUser(PDO $db, string $username, string $password, string $name, int $age, int $nif, int $phone, string $address) {
            $stmt = $db->prepare("INSERT INTO User ('username','profilePic','password','name','age','nif','phone','address','client') 
            VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ?)"
            );
            $stmt->execute(array($username, "../images/profilePic.png", $password, $name, $age, $nif, $phone, $address, 1));
        }

        static function userIsClient(PDO $db, int $userId) : int {
            $stmt = $db->prepare("SELECT client FROM User WHERE id = " . $userId);
            $stmt->execute();
            $client = $stmt->fetch();

            return $client['client'];
        }
    }
?>
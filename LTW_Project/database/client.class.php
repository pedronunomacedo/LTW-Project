<?php
    declare(strict_types = 1);

    class Client {
        public int $id;
        public string $username;
        public string $password;
        public string $name;
        public int $age;
        public int $nif;
        public int $phone;
        public string $address;
        
        public function __construct($id, $username, $password, $name, $age, $nif, $phone, $address) {
            $this->id = $id;
            $this->username = $username;
            $this->password = $password;
            $this->name = $name;
            $this->age = $age;
            $this->nif = $nif;
            $this->phone = $phone;
            $this->address = $address;
        }

        public function getClient(PDO $db, int $id) {
            $stmt = $db->prepare('SELECT * FROM Client WHERE id = ?');
            $stmt->execute(array($id));
            $client = $stmt->fetch();

            return new Client(
                $client['id'],
                $client['username'],
                $client['password'],
                $client['name'],
                $client['age'],
                $client['nif'],
                $client['phone'],
                $client['address']
            );
        }

        public function getClientOrders(PDO $db, int $id) : array {
            $stmt = $db->prepare('SELECT * FROM Pedido WHERE idClient = ?');
            $stmt->execute(array($id));
            $orders = $stmt->fetchAll();

            return $orders;
        }

        public function getClientReviews(PDO $db, int $id) : array {
            $stmt = $db->prepare('SELECT Review.idPedido, Review.title, Review.comment, Review.submissonDate, Review.submissonHour, Review.grade, Review.answer FROM Review WHERE idClient = ?');
            $stmt->execute(array($id));
            $reviews = $stmt->fetchAll();

            return $reviews;
        }
    }
?>
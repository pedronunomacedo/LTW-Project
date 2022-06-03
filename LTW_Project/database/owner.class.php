<?php
    declare(strict_types = 1);

    class Owner {
        public int $id;
        public string $username;
        public string $password;
        public string $name;
        public int $age;
        public int $nif;
        public int $phone;
        public string $email;

        public function __construct($id, $username, $password, $name, $age, $nif, $phone, $email) {
            $this->id = $id;
            $this->username = $username;
            $this->password = $password;
            $this->name = $name;
            $this->age = $age;
            $this->nif = $nif;
            $this->phone = $phone;
            $this->email = $email;
        }

        public function getOwner(PDO $db, int $id) : Owner {
            $stmt = $db->prepare('SELECT * FROM Proprietario WHERE idProprietario = ?');
            $stmt->execute(array($id));
            $owner = $stmt->fetch();

            return new Owner(
                $owner['id'],
                $owner['username'],
                $owner['password'],
                $owner['name'],
                $owner['age'],
                $owner['nif'],
                $owner['phone'],
                $owner['email']
            );
        }
    }
?>
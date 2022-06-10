<?php
    declare(strict_types = 1);

    class Pedido {
        public int $id;
        public int $idRestaurant;
        public int $idUser;
        public string $state;
        public string $delieverAddress;
        public string $submissonDate;
        public string $submissonHour;

        public function __construct(int $id, int $idRestaurant, int $idUser, string $state, string $delieverAddress, string $submissonDate, string $submissonHour) {
            $this->id = $id;
            $this->idRestaurant = $idRestaurant;
            $this->idUser = $idUser;
            $this->state = $state;
            $this->delieverAddress = $delieverAddress;
            $this->submissonDate = $submissonDate;
            $this->submissonHour = $submissonHour;
        }

        static function getUserOrders(PDO $db, int $id) : array {
            $stmt = $db->prepare('SELECT * FROM Pedido WHERE idUser = ' . $id);
            $stmt->execute();
            $userOrders = array();
            
            while ($order = $stmt->fetch()) {
                $userOrders[] = new Pedido(
                    intval($order['id']),
                    intval($order['idRestaurant']),
                    intval($order['idUser']),
                    $order['state'],
                    $order['delieverAddress'],
                    $order['submissonDate'],
                    $order['submissonHour']
                );
            }

            return $userOrders;
        }

        static function getUserOrder(PDO $db, int $id) : Pedido {
            $stmt = $db->prepare('SELECT * FROM Restaurant WHERE idPedido = ?');
            $stmt->execute(array($id));
            $User = $stmt->fetch();

            return new Pedido(
                intval($User['id']),
                intval($User['idRestaurant']),
                intval($User['idUser']),
                $User['comment'],
                $User['state'],
                $User['delieverAddress'],
                $User['submissonDate'],
                $User['submissonHour']
            );
        }

        static function getUser(PDO $db, int $id) : User {
            $stmt = $db->prepare('SELECT * FROM User WHERE id = ?');
            $stmt->execute(array($id));
            $User = $stmt->fetch();

            return new $User(
                intval($User['id']),
                intval($User['idRestaurant']),
                intval($User['idClient']),
                $User['comment'],
                $User['state'],
                $User['delieverAddress'],
                $User['submissonDate'],
                $User['submissonHour']
            );
        }
    }
?>
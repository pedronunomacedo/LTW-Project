<?php
    declare(strict_types = 1);

    class Order {
        public int $idOrder;
        public string $state;
        public string $comment;
        public char $address;
        public date $submissonDate;
        public int $submissonHour;

        public function __construct($idOrder, $idCliente, $state, $comment, $address, $submissonDate, $submissonHour) {
            $this->idOrder = $idOrder;
            $this->idCliente = $idCliente;
            $this->state = $state;
            $this->comment = $comment;
            $this->address = $address;
            $this->submissonDate = $submissonDate;
            $this->submissonHour = $submissonHour;
        }

        public function getOrder(PDO $db, int $id) : Order {
            $stmt = $db->preparse('SELECT * FROM Pedido WHERE id = ?');
            $stmt->execute(array($id));
            $order = $stmt->fetch();

            return new Order(
                $order['id'],
                $order['idRestaurant'],
                $order['idClient'],
                $order['comment'],
                $order['state'],
                $order['delieverAddress'],
                $order['submissonDate'],
                $order['submissonHour']
            );
        }

        public function getOrderRestaurant(PDO $db, int $id) : Order {
            $stmt = $db->prepare('SELECT * FROM Pedido WHERE idPedido = ?');
            $stmt->execute(array($id));
            $order = $stmt->fetch();

            return new Order(
                $order['id'],
                $order['idRestaurant'],
                $order['idClient'],
                $order['comment'],
                $order['state'],
                $order['delieverAddress'],
                $order['submissonDate'],
                $order['submissonHour']
            );
        }

        public function getOrderClient(PDO $db, int $id) : Order {
            $stmt = $db->prepare('SELECT Client.id, Pedido.idRestaurant, Pedido.state, Client.password, Client.name, Client.age, Client.nif, Client.phone, Client.email
                                FROM Pedido, Client
                                WHERE (Pedido.idClient = Cliente.id AND Pedido.id = ?)'
                                );
            $stmt->execute(array($id));
            $order = $stmt->fetch();

            echo $order;

            return new $order(
                $id,
                $order['idRestaurant'],
                $order['idClient'],
                $order['comment'],
                $order['state'],
                $order['delieverAddress'],
                $order['submissonDate'],
                $order['submissonHour']
            );
        }
    }
?>
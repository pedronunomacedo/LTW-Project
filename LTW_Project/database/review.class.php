<?php
    declare(strict_types = 1);

    class Review {
        public int $id;
        public int $idClient;
        public int $idPedido;
        public string $title;
        public string $comment;
        public string $submissonDate;
        public int $submissonHour;
        public int $grade;
        public string $answer;
        public int $idOwner;
        
        public function __construct($id, $idClient, $idPedido, $title, $comment, $submissonDate, $submissonHour, $grade, $answer, $idOwner) {
            $this->id = $id;
            $this->idClient = $idClient;
            $this->idPedido = $idPedido;
            $this->title = $title;
            $this->comment = $comment;
            $this->submissonDate = $submissonDate;
            $this->submissonHour = $submissonHour;
            $this->$grade = $grade;
            $this->$answer = $answer;
            $this->$idOwner = $idOwner;
        }

        
    }
?>
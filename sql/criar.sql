DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Proprietario;
DROP TABLE IF EXISTS Morada;
DROP TABLE IF EXISTS Restaurante;
DROP TABLE IF EXISTS Prato;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS RestaurantePedidoPrato;
DROP TABLE IF EXISTS Horario;
DROP TABLE IF EXISTS RestauranteHorario;
DROP TABLE IF EXISTS ClientePedido;

CREATE TABLE Cliente(
  idCliente integer primary key,
  username varchar(12) unique,
  pass varchar(20) not null,
  nome varchar(30) not null,
  idade integer not null,
  nif integer not null unique,
  telefone integer not null unique,
  email varchar(30) not null unique
);

CREATE TABLE Proprietario(
  idProprietario integer primary key,
  username varchar(12) unique,
  pass varchar(20) not null,
  nome varchar(30) not null,
  idade integer not null,
  nif integer not null unique,
  telefone integer not null unique,
  email varchar(30) not null unique
);

CREATE TABLE Morada(
  idMorada integer primary key,
  nome varchar(50)
  client references Cliente
);

CREATE TABLE Restaurante(
  idRestaurante integer primary key,
  nome varchar(30) unique not null,
  morada integer unique not null,
  tipo varchar(30) not null
);

CREATE TABLE Prato(
  idPrato integer primary key,
  nome varchar(30) not null,
  descricao varchar(100) not null,
  tipo varchar(30) not null,
  categoria varchar(30) not null
);

CREATE TABLE Pedido(
  idPedido integer primary key,
  estado varchar(30) not null,
  comentario varchar(100),
  morada varchar(50),
  dataSub date not null,
  horaSub time not null
);

CREATE TABLE RestaurantePedidoPrato(
  restaurante references Restaurante,
  pedido references Pedido,
  prato references Prato
);

CREATE TABLE Horario(
  idHorario integer primary key,
  abertura time not null,
  encerramento not null
);

CREATE TABLE RestauranteHorario(
  restaurante references Restaurante,
  horario references Horario
);

CREATE TABLE ClientePedido(
  pedido references Pedido,
  cliente references Cliente
);

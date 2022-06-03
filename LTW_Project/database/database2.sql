DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Proper;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Restaurant;
DROP TABLE IF EXISTS Plate;

/* CREATE TABLES */

CREATE TABLE Client (
  id integer PRIMARY KEY AUTOINCREMENT,
  username varchar(12) unique,
  password varchar(20) not null,
  name varchar(30) not null,
  age integer not null,
  nif integer not null unique,
  phone integer not null unique,
  address varchar(30) not null unique
);

CREATE TABLE Proper (
  id integer PRIMARY KEY AUTOINCREMENT,
  username varchar(12) unique,
  password varchar(20) not null,
  name varchar(30) not null,
  age integer not null,
  nif integer not null unique,
  phone integer not null unique,
  email varchar(30) not null unique
);

CREATE TABLE Restaurant (
  id integer PRIMARY KEY AUTOINCREMENT,
  idOwner integer REFERENCES Owner(id),
  name varchar(255) not null,
  address varchar(255) not null,
  type varchar(255) not null
);

CREATE TABLE Pedido (
  id integer primary key,
  idRestaurant references Restaurant(id),
  idClient references Client(id),
  state varchar(30) not null,
  delieverAddress varchar(50),
  submissonDate date not null,
  submissonHour time not null
);

CREATE TABLE Review (
  id integer PRIMARY KEY AUTOINCREMENT,
  idClient integer REFERENCES Client(id),
  idPedido integer REFERENCES Pedido(id),
  title varchar(255) not null,
  comment varchar(255) not null,
  submissonDate date not null,
  submissonHour date not null,
  grade integer not null,
  answer varchar(255)
);

CREATE TABLE Plate (
    id integer PRIMARY KEY AUTOINCREMENT,
    idRestaurant integer REFERENCES Restaurant (id),
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    price FLOAT(20) NOT NULL
);

/* Povoate */

INSERT INTO Client ('username','password','name','age','nif','phone','address')
VALUES
  ("Denton Pitts","@v{6Tr(~Rj","Adam Daniels",61,"368678646","253155522","sit.amet@icloud.net"),
  ("Aspen Walters","#8E=TC6+tC","Leslie Good",72,"374287783","475788663","amet.ultricies.sem@yahoo.org"),
  ("Jameson Greene","-36Z?paU-(","Bevis Strickland",68,"349435624","285844459","nunc@icloud.edu"),
  ("Ima Carpenter","YN9K.p'der","Liberty Guthrie",18,"316523367","138734173","erat@icloud.net"),
  ("Gail Marks","(nT%_2t4M","Scott Gross",65,"654456174","415659578","sollicitudin.commodo@google.com"),
  ("Ulysses Sweeney","MdL(}Y;2XN","Rhoda Summers",52,"558777981","788164464","ac@icloud.net"),
  ("Barclay Fuller","^@9XZeyT$q","Chelsea Buck",16,"526666647","758831523","suspendisse.commodo@icloud.com"),
  ("Eleanor Durham","vYdsq4y*3b","Basil Mcmahon",87,"374645444","478614175","turpis@hotmail.couk"),
  ("Ignacia Adkins","v!X)Tz522","Kai Steele",44,"375427668","736499488","fermentum@protonmail.couk"),
  ("Emerald Hopper","cQ)@UMr4Bv","Candace Parks",67,"832437898","345281647","fringilla.cursus@outlook.org");

INSERT INTO Proper ('username','password','name','age','nif','phone','email')
VALUES
  ("Denton Pitts","cDYh+@8Yw","Adam Daniels",61,"368678646","253155522","sit.amet@icloud.net"),
  ("Aspen Walters","aNB~3Xhp~B","Leslie Good",72,"374287783","475788663","amet.ultricies.sem@yahoo.org"),
  ("Jameson Greene","Rt~E43Mf","Bevis Strickland",68,"349435624","285844459","nunc@icloud.edu"),
  ("Ima Carpenter","nTjH;&(s8;","Liberty Guthrie",18,"316523367","138734173","erat@icloud.net"),
  ("Gail Marks","K8/~(BvGhG","Scott Gross",65,"654456174","415659578","sollicitudin.commodo@google.com"),
  ("Ulysses Sweeney","{s9[pSZN%w","Rhoda Summers",52,"558777981","788164464","ac@icloud.net"),
  ("Barclay Fuller",".zk3&GR7!","Chelsea Buck",16,"526666647","758831523","suspendisse.commodo@icloud.com"),
  ("Eleanor Durham","f.57d:w*PM","Basil Mcmahon",87,"374645444","478614175","turpis@hotmail.couk"),
  ("Ignacia Adkins",">{xWwcNH8","Kai Steele",44,"375427668","736499488","fermentum@protonmail.couk"),
  ("Emerald Hopper","8G@qQDhpn","Candace Parks",67,"832437898","345281647","fringilla.cursus@outlook.org");

INSERT INTO Pedido ('idRestaurant', 'idClient', 'state', 'delieverAddress', 'submissonDate','submissonHour')
VALUES
  (1, 10, "delievered", "619-2904 Enim. Street","Dec 20, 2021","11:08 PM"),
  (1, 9, "on his way", "Ap #251-9626 In Avenue","Jul 10, 2022","12:35 AM"),
  (2, 9, "ready", "1746 Interdum. Av.","May 6, 2022","8:54 AM"),
  (3, 8, "delievered", "474-1687 Et Road","Jul 26, 2021","6:55 AM"),
  (4, 7, "on his way", "913-472 Vitae Rd.","Dec 27, 2022","9:27 AM"),
  (5, 6, "ready", "P.O. Box 382, 8614 Urna. Rd.","Dec 15, 2021","11:27 AM"),
  (6, 5, "delievered", "P.O. Box 942, 3158 Ac Avenue","Feb 21, 2022","5:52 AM"),
  (7, 4, "on his way", "Ap #306-2866 Dui. Av.","Feb 5, 2022","10:38 AM"),
  (8, 3, "ready", "P.O. Box 767, 2525 Parturient St.","Jan 9, 2022","6:28 AM"),
  (9, 1, "delievered", "7186 Diam. Street","Dec 9, 2021","5:00 AM");

INSERT INTO Review ('idClient', 'idPedido', 'title', 'comment', 'submissonDate', 'submissonHour','grade', 'answer')
VALUES
  (1, 9, "Comida","Comida muito boa!","Oct 27, 2021","12:50 PM", 5, "Obrigado pela sua presença!"),
  (2, 3, "Comida muito salgada","Achei a minha pizza muito salgada.","Oct 26, 2021","13:24 PM", 3.5, "Obrigado pela sua opinião. Iremos fazer melhor da próxima vez!"),
  (3, 9, "Ótima comida","Têm de provar as pizzas, são divinais!","Sept 13, 2021","12:30 PM", 4.4, null),
  (4, 5, "Um pouco seco","Achei o pão um pouco seco. Poderia ser do calor que fazia no dia em que fui!","Dec 26, 2021","14:00 PM", 4, null),
  (4, 5, "Não há igual","Uma das melhores comidas que poderia haver!","Feb 06, 2021","13:00 PM", 5, null),
  (6, 7, "Massa","Experimentem a massa a carbonara. Não se iram arrepender!","Oct 27, 2021","12:50 PM", 4.2, null),
  (7, 8, "Bebidas","Achei que as bebidas pdoeriam estar um pouco mais frescas. Ainda por cima nos dias quentes de verão!","Jul 11, 2021","13:32 PM", 3, null),
  (8, 6, "Arroz de tamboril","Poderiam ter servido mais arroz!","Jun 23, 2021","12:59 PM", 3.5, null),
  (9, 10, "Mousse de chocolate","Uma das melhores que já provei! As pitadas de sal dão um toque especial.", "Aug 23, 2021","14:37 PM", 4.2, null),
  (10, 1, "Peixe","Muito bom!","Apr 09, 2021","13:17 PM", 3.9, null);


INSERT INTO Restaurant ('idOwner', 'name', 'address', 'type')
VALUES
  (1,"MCDonalds","197-1124 Elementum, Rd.","burgers"),
  (2,"Burguer King","850-2661 Interdum. St.","burgers"),
  (3,"Starbucks","Ap #686-5741 Ipsum Rd.","drinks"),
  (4,"Café Costa","505-7922 Sit St.","drinks"),
  (5,"Café Aliança","Ap #333-6320 Vulputate, Road","drinks"),
  (6,"O Gato Pingado","Ap #175-3890 Curabitur Rd.","pizzaria"),
  (7,"Água na Boca","827-2876 Morbi Road","pizzaria"),
  (8,"Delícias na Panela","363-3617 Pellentesque Rd.","sushi"),
  (9,"Fogão a Lenha","663-7670 Proin Avenue","other"),
  (10,"Jogo de panela","728-6809 Purus St.","other");

INSERT INTO Plate ('idRestaurant', 'name', 'category', 'price')
VALUES
  (6, "Pepper's Pizza", "pizza", 5.23),
  (2, "Cheeseburger", "burger", 4.50),
  (4, "Meat Lover Burguer", "burger", 7.99),
  (6, "Extra Cheese Pizza", "pizza", 4.99),
  (1, "Seaside Sandwich", "burger", 5.00),
  (3, "Coca-Cola", "coldDrink", 1.88),
  (8, "Mousse de chocolate", "dessert", 1.79),
  (8, "Palito de limão", "dessert", 1.20),
  (9, "Feijoada", "extras", 0.99),
  (10, "Francesinha", "extras", 2.15),
  (8, "Sushi", "sushi", 8.99);
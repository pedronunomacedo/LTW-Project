DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Restaurant;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Plate;
DROP TABLE IF EXISTS Addresses;

/* CREATE TABLES */

CREATE TABLE User (
  id integer PRIMARY KEY AUTOINCREMENT,
  profilePic varchar(225),
  username varchar(12) unique,
  password varchar(20) not null,
  name varchar(30) not null,
  age integer not null,
  nif integer not null unique,
  phone integer not null unique,
  address varchar(30) not null unique,
  client integer
);

CREATE TABLE Restaurant (
  id integer PRIMARY KEY AUTOINCREMENT,
  idUser integer REFERENCES User(id),
  name varchar(255) not null,
  address varchar(255) not null,
  type varchar(255) not null
);

CREATE TABLE Pedido (
  id integer primary key AUTOINCREMENT,
  idRestaurant references Restaurant(id),
  idUser references User(id),
  state varchar(30) not null,
  delieverAddress varchar(50),
  submissonDate varchar(50) not null,
  submissonHour integer not null
);

CREATE TABLE Review (
  id integer PRIMARY KEY AUTOINCREMENT,
  idClient integer REFERENCES User(id),
  idPedido integer REFERENCES Pedido(id),
  title varchar(255) not null,
  comment varchar(255) not null,
  submissonDate varchar(50) not null,
  submissonHour varchar(50) not null,
  grade decimal not null,
  answer varchar(255),
  idOwner integer REFERENCES User(id)
);

CREATE TABLE Plate (
    id integer PRIMARY KEY AUTOINCREMENT,
    idRestaurant integer REFERENCES Restaurant (id),
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    price FLOAT(20) NOT NULL
);

CREATE TABLE Addresses(
  id integer PRIMARY KEY AUTOINCREMENT,
  idUser references User(id),
  address varchar(255) not null
);

CREATE TABLE Favorites(
  id integer PRIMARY KEY AUTOINCREMENT,
  idUser references User(id),
  idRestaurant references Restaurant(id)
);

/* Povoate */

INSERT INTO User ('username','profilePic','password','name','age','nif','phone','address','client')
VALUES
  ("DentonPitts", "../images/profilePic.png","@v{6Tr(~Rj","Denton Pitts",61,"368678646","253155521","sit.ametee@icloud.net",1),
  ("AspenWalters", "../images/profilePic.png","#8E=TC6+tC","Aspen Walters",72,"374287783","475788662","amet.ultriciess.sem@yahoo.org",1),
  ("JamesonGreene", "../images/profilePic.png","-36Z?paU-(","Jameson Greene",68,"349435629","285844453","nuncc@icloud.edu",1),
  ("ImaCarpenter", "../images/profilePic.png","YN9K.p'der","Ima Carpenter",18,"316523367","138734174","eratt@icloud.net",1),
  ("GailMarks", "../images/profilePic.png","nT%_2t4M","Gail Marks",65,"654456174","415659579","sollicitudinn.commodo@google.com",1),
  ("UlyssesSweeney", "../images/profilePic.png","MdL}Y;2XN","Ulysses Sweeney",52,"558777981","788164465","acc@icloud.net",1),
  ("BarclayFuller", "../images/profilePic.png","^@9XZeyT$q","Barclay Fuller",16,"526666647","758831526","suspendissee.commodo@icloud.com",1),
  ("EleanorDurham", "../images/profilePic.png","vYdsq4y*3b","Eleanor Durham",87,"374645444","478614177","turpiss@hotmail.couk",1),
  ("IgnaciaAdkins", "../images/profilePic.png","v!X)Tz522","Ignacia Adkins",44,"375427668","736499488","fermentumm@protonmail.couk",1),
  ("EmeraldHopper", "../images/profilePic.png","cQ)@UMr4Bv","Emerald Hopper",67,"832437898","345281648","fringillaa.cursus@outlook.org",1),
  ("DentonsSalt", "../images/profilePic.png","cDYh+@8Yw","Dentons Salt",61,"368678641","253155529","sit.amete@icloud.net",0),
  ("AspensSmith", "../images/profilePic.png","aNB~3Xhp~B","Aspens Smith",72,"374287782","475788661","amet.ultricies.sem@yahoo.org",0),
  ("JamesonsBlue", "../images/profilePic.png","Rt~E43Mf","Jamesons Blue",68,"349435623","285844452","nunc@icloud.edu",0),
  ("SophiesCalenski", "../images/profilePic.png","nTjH;&(s8;","Sophies Calenski",18,"316523364","138734173","erat@icloud.net",0),
  ("GailsHupkins", "../images/profilePic.png","K8/~(BvGhG","Gails Hupkins",65,"654456175","415659574","sollicitudin.commodo@google.com",0),
  ("UlyssessSweeney", "../images/profilePic.png","{s9[pSZN%w","Ulyssess Sweeney",52,"558777986","788164464","ac@icloud.net",0),
  ("BarclaysFuller", "../images/profilePic.png",".zk3&GR7!","Barclays Fuller",16,"526666648","758831529","suspendisse.commodo@icloud.com",0),
  ("EleanorsDurham", "../images/profilePic.png","f.57d:w*PM","Eleanors Durham",87,"374645447","478614175","turpis@hotmail.couk",0),
  ("IgnaciasAdkins", "../images/profilePic.png",">{xWwcNH8","Ignacias Adkins",44,"375427669","736499485","fermentum@protonmail.couk",0),
  ("EmeraldsHopper", "../images/profilePic.png","8G@qQDhpn","Emeralds Hopper",67,"832437891","345281649","fringilla.cursus@outlook.org",0);

INSERT INTO Pedido ('idRestaurant', 'idUser', 'state', 'delieverAddress', 'submissonDate','submissonHour')
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

INSERT INTO Review ('idClient', 'idPedido', 'title', 'comment', 'submissonDate', 'submissonHour', 'grade', 'answer', 'idOwner')
VALUES
  (1, 10, "Comida","Comida muito boa!","Oct 27, 2021","12:50 PM", 5, "Obrigado pela sua presença!", 10),
  (2, 9, "Comida muito salgada","Achei a minha pizza muito salgada.","Oct 26, 2021","13:24 PM", 3.5, "Obrigado pela sua opinião. Iremos fazer melhor da próxima vez!", 11),
  (3, 8, "Ótima comida","Têm de provar as pizzas, são divinais!","Sept 13, 2021","12:30 PM", 4.4, null, 12),
  (4, 7, "Um pouco seco","Achei o pão um pouco seco. Poderia ser do calor que fazia no dia em que fui!","Dec 26, 2021","14:00 PM", 4, null, 13),
  (5, 6, "Não há igual","Uma das melhores comidas que poderia haver!","Feb 06, 2021","13:00 PM", 5, null, 14),
  (6, 5, "Massa","Experimentem a massa a carbonara. Não se iram arrepender!","Oct 27, 2021","12:50 PM", 4.2, null, 15),
  (7, 4, "Bebidas","Achei que as bebidas pdoeriam estar um pouco mais frescas. Ainda por cima nos dias quentes de verão!","Jul 11, 2021","13:32 PM", 3, null, 16),
  (8, 3, "Arroz de tamboril","Poderiam ter servido mais arroz!","Jun 23, 2021","12:59 PM", 3.5, null, 17),
  (9, 2, "Mousse de chocolate","Uma das melhores que já provei! As pitadas de sal dão um toque especial.", "Aug 23, 2021","14:37 PM", 4.2, null, 18),
  (10, 1, "Peixe","Muito bom!","Apr 09, 2021","13:17 PM", 3.9, null, 19);


INSERT INTO Restaurant ('idUser', 'name', 'address', 'type')
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

INSERT INTO Addresses ('idUser', 'address')
VALUES
  (1, "Ap #969-6396 Donec Rd."),
  (4, "Ap #241-8356 Egestas Rd."),
  (7, "P.O. Box 398, 361 Proin Avenue"),
  (4, "P.O. Box 638, 5727 Curae St."),
  (1, "P.O. Box 193, 8009 Sagittis Avenue"),
  (2, "Ap #474-2691 Ut St."),
  (10, "6003 Est. Rd."),
  (10, "Ap #869-1611 Proin St."),
  (9, "525-3559 Eget St."),
  (6, "Ap #482-5667 Pellentesque Rd.");

INSERT INTO Favorites ('idUser', 'idRestaurant')
VALUES
  (1, 2),
  (1, 3),
  (2, 3),
  (2, 9),
  (9, 7),
  (3, 7),
  (10, 9),
  (10, 6),
  (9, 4),
  (6, 4);
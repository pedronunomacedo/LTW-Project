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
DROP TABLE IF EXISTS Review;

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
  nome varchar(50),
  cliente references Cliente(idCliente)
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
  categoria varchar(30) not null,
  restaurante references Restaurante,
  price integer not null
);

CREATE TABLE Pedido(
  idPedido integer primary key,
  idCliente references Cliente(idCliente),
  idRestaurante references Restaurante(idRestaurante),
  estado varchar(30) not null,
  comentario varchar(100),
  morada varchar(50),
  dataSub date not null,
  horaSub time not null
);

CREATE TABLE RestaurantePedidoPrato(
  restaurante references Restaurante not null,
  pedido references Pedido,
  prato references Prato not null
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
  idPedido references Pedido(idPedido),
  idCliente references Cliente(idCliente)
);

CREATE TABLE Review(
  idCliente references Cliente(idCliente),
  idPedido references Pedido(idPedido),
  titulo char not null,
  comentario char not null,
  dataSub date not null,
  horaSub time not null,
  avaliacao integer not null,
  resposta char
);

CREATE TABLE ADDRESSES(
  idCliente references Cliente(idCliente),
  address varchar(255) not null
);

/* Povoar */

/*100 Clientes Gerados Aleatoriamente-----------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `Cliente` (`idCliente`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (1,"Denton Pitts","magna.","Adam Daniels",61,"368678646","253155522","sit.amet@icloud.net"),
  (2,"Aspen Walters","eros","Leslie Good",72,"374287783","475788663","amet.ultricies.sem@yahoo.org"),
  (3,"Jameson Greene","Proin","Bevis Strickland",68,"349435624","285844459","nunc@icloud.edu"),
  (4,"Ima Carpenter","dictum","Liberty Guthrie",18,"316523367","138734173","erat@icloud.net"),
  (5,"Gail Marks","nulla","Scott Gross",65,"654456174","415659578","sollicitudin.commodo@google.com"),
  (6,"Ulysses Sweeney","neque.","Rhoda Summers",52,"558777981","788164464","ac@icloud.net"),
  (7,"Barclay Fuller","auctor","Chelsea Buck",16,"526666647","758831523","suspendisse.commodo@icloud.com"),
  (8,"Eleanor Durham","non","Basil Mcmahon",87,"374645444","478614175","turpis@hotmail.couk"),
  (9,"Ignacia Adkins","eros","Kai Steele",44,"375427668","736499488","fermentum@protonmail.couk"),
  (10,"Emerald Hopper","Aliquam","Candace Parks",67,"832437898","345281647","fringilla.cursus@outlook.org");
/*INSERT INTO `Cliente` (`idCliente`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (11,"Ebony Velasquez","amet,","Hu Walsh",79,"346324544","796843236","vivamus.sit.amet@aol.ca"),
  (12,"Troy Kidd","interdum","Illiana Thomas",31,"957375835","237889384","adipiscing.ligula@outlook.edu"),
  (13,"Alvin Bonner","Nunc","Graham Wise",88,"723356398","173283363","curae@hotmail.net"),
  (14,"Troy Hewitt","odio.","Sandra Carrillo",59,"383645734","135348654","ridiculus.mus@yahoo.ca"),
  (15,"Xena Mckenzie","Proin","Beatrice Ford",1,"492228688","952622464","dolor.tempus@yahoo.edu"),
  (16,"Renee Hines","ridiculus","Kenyon Mercer",9,"879397343","928362591","lorem.eu.metus@google.org"),
  (17,"Jana Clemons","ullamcorper","Zoe Frederick",4,"453147522","876471592","erat.vivamus@yahoo.com"),
  (18,"Stella Blake","tristique","Samantha Grant",36,"338284375","178796328","a@yahoo.net"),
  (19,"Demetria Welch","Cras","Kelly Richmond",58,"491232573","348445458","cursus.in@aol.com"),
  (20,"Elliott Slater","interdum","Tyler Wheeler",6,"737273223","385389344","mauris@outlook.ca");
INSERT INTO `Cliente` (`idCliente`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (21,"Dillon Shepherd","Nullam","Justin Hickman",97,"796338635","451246942","sapien.imperdiet@google.com"),
  (22,"Evangeline Norman","urna.","Natalie Workman",41,"266126444","826179564","nunc.nulla@outlook.org"),
  (23,"Chadwick Austin","nec","Alika Thompson",91,"959598269","582871545","lobortis.ultrices@aol.ca"),
  (24,"Caleb Harvey","Maecenas","Ferris Murphy",52,"425586865","762774383","vehicula@aol.ca"),
  (25,"Joel O'connor","Ut","Eleanor Kirby",43,"564665554","793814625","aliquam@aol.org"),
  (26,"Olympia Rosa","semper","Irma Whitaker",13,"627728493","721287353","mauris.magna.duis@protonmail.edu"),
  (27,"Paloma Morin","litora","Benjamin Chase",81,"892842849","584383934","venenatis.vel.faucibus@aol.edu"),
  (28,"Dexter Reynolds","nunc.","Winter Walter",72,"466144784","429333657","auctor.non@yahoo.couk"),
  (29,"Ursa Macdonald","eu","Ingrid Parrish",79,"736484264","537339731","molestie.pharetra@yahoo.org"),
  (30,"Hashim Sherman","lacinia","Hayden Aguirre",99,"825167432","566543387","dictum.ultricies@icloud.edu");
INSERT INTO `Cliente` (`idCliente`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (31,"Aurora Houston","ullamcorper","Margaret Nelson",4,"997668386","672497987","in.cursus@aol.org"),
  (32,"Myles Roth","arcu.","Palmer Mcneil",16,"284277636","147367486","orci.adipiscing@protonmail.couk"),
  (33,"Daria Orr","Integer","Mona Patton",20,"742588473","477649865","neque.nullam@aol.ca"),
  (34,"Jordan Mccullough","semper","Kelsey Smith",92,"962998565","924481535","dui@yahoo.net"),
  (35,"Abra Ortiz","Ut","Charlotte Baxter",67,"673249315","234712862","lectus@hotmail.org"),
  (36,"Sawyer Osborn","nulla","Venus Gutierrez",97,"886531262","682777342","diam@google.ca"),
  (37,"Katelyn Harrington","dignissim","Farrah Mcclain",47,"576768935","437792287","aptent.taciti@aol.edu"),
  (38,"Melyssa Sexton","lorem.","Evelyn Gonzales",42,"937321358","847795824","nunc.risus.varius@aol.com"),
  (39,"Jerry Miranda","Aenean","Orla Parsons",59,"245386874","234478443","eu.nulla.at@google.ca"),
  (40,"Dominic Daniels","Maecenas","Bryar Montoya",23,"659276444","128445781","aliquam@yahoo.org");
INSERT INTO `Cliente` (`idCliente`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (41,"Odette Coffey","at","Maggy Strong",13,"473448823","784776442","donec.luctus@protonmail.edu"),
  (42,"Hanna William","et","Christine Rutledge",99,"763432581","934458985","mollis.phasellus@protonmail.net"),
  (43,"Kerry Matthews","facilisi.","Bertha Schwartz",78,"456524262","735656829","tellus.id@aol.net"),
  (44,"Azalia Weiss","sociis","Lillian Cook",91,"372365911","464545235","interdum@icloud.net"),
  (45,"Xandra Rowe","orci","Cooper Hebert",94,"445412367","337944956","nulla.tincidunt.neque@yahoo.net"),
  (46,"Wang Armstrong","amet","Kermit Richmond",59,"661574436","755724837","montes@hotmail.ca"),
  (47,"Paul Parsons","id,","Hilel Bowers",11,"985287953","897377534","suspendisse.aliquet@aol.com"),
  (48,"Jared May","faucibus","Eagan Dyer",35,"462843628","811552476","bibendum.ullamcorper@yahoo.edu"),
  (49,"Reece Medina","nec","Laith Jimenez",12,"536779856","444787745","libero.mauris@google.com"),
  (50,"Audrey Finch","nunc","Price Potts",20,"557143647","834472735","luctus.vulputate@aol.com");
INSERT INTO `Cliente` (`idCliente`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (51,"Clare Reed","ornare,","Nicole Tyson",25,"783848968","726845415","nec.ante@icloud.com"),
  (52,"Cooper Drake","nunc","Aimee Anthony",79,"862613326","156962723","magnis.dis@google.couk"),
  (53,"Len Leonard","egestas","Vance Christian",12,"733366556","864669751","orci.ut@protonmail.com"),
  (54,"Dara Velasquez","ligula","Sydnee Lindsay",50,"455235366","482845744","dapibus.rutrum@outlook.net"),
  (55,"Nicole Simmons","nunc","Jared Finley",80,"332457535","746846782","neque.tellus.imperdiet@protonmail.couk"),
  (56,"Odessa Casey","luctus","Jin Day",83,"247268894","777317422","id.erat.etiam@icloud.com"),
  (57,"Leo Lynch","odio.","Emily Sweet",34,"682617664","854263234","facilisi@aol.edu"),
  (58,"Solomon Ramsey","et","Tiger Anthony",17,"386823247","733678573","egestas.sed.pharetra@icloud.org"),
  (59,"Baker Frank","hendrerit.","Tana Mcguire",48,"865444986","527926445","mauris@outlook.edu"),
  (60,"Shaine Dyer","cubilia","Grady Finch",18,"533225834","322883971","tempus.eu@icloud.net");
INSERT INTO `Cliente` (`idCliente`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (61,"Oren Sanders","nisi.","Audrey Watts",35,"666912389","647384126","enim@yahoo.couk"),
  (62,"Ahmed Gardner","nisi","Dieter Osborne",60,"635953784","888117725","auctor.odio@protonmail.com"),
  (63,"Grant Bowman","ut","Cathleen Ramsey",39,"315525312","367713864","erat.in.consectetuer@yahoo.couk"),
  (64,"Kelly Peck","Sed","Lunea Todd",31,"375683352","499367631","vestibulum.ante@google.ca"),
  (65,"Rhonda Kemp","Proin","Shana Rodgers",6,"482732134","352687484","quisque.ornare@google.couk"),
  (66,"Hu Summers","elementum,","Reece Reese",23,"612567643","623224249","augue.eu@aol.org"),
  (67,"Ivy Wall","neque","Jarrod Lynch",11,"847278332","339536421","dui@outlook.com"),
  (68,"Prescott Cleveland","vitae","Geoffrey Bell",87,"556942654","949337797","vitae.mauris@protonmail.couk"),
  (69,"Camden Compton","Maecenas","Brennan Battle",14,"338583569","432593418","eget.nisi@outlook.edu"),
  (70,"Chester Ferrell","nisl.","Dana Fischer",42,"634282335","772424957","arcu@yahoo.ca");
INSERT INTO `Cliente` (`idCliente`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (71,"Jade Sears","risus.","Lilah Meyer",62,"356656267","739835772","nisi.a@aol.ca"),
  (72,"Ignacia Talley","Suspendisse","Fulton Olsen",8,"177795862","532378242","amet.risus@aol.ca"),
  (73,"Drake Allison","Mauris","Tobias Joyce",62,"943226668","568733748","enim.mi@icloud.edu"),
  (74,"Gary Singleton","neque.","Elton Justice",53,"215638853","185532352","egestas.lacinia@aol.edu"),
  (75,"Knox Fitzpatrick","pede","Armando Hull",86,"487429421","545313466","facilisi@protonmail.edu"),
  (76,"Anika Watson","Nunc","Quentin Quinn",24,"723876781","738224546","scelerisque.mollis@yahoo.net"),
  (77,"Kirestin Gibson","ac","Stewart Cross",14,"878792385","477482489","mi.lorem.vehicula@aol.org"),
  (78,"Harding Newton","justo.","Conan Vinson",6,"998628449","588223583","et.eros@yahoo.org"),
  (79,"Kelsey Chang","eu","Naida Hickman",84,"292623946","945775556","fusce.mi@yahoo.ca"),
  (80,"Addison Dickson","facilisis.","Kathleen Hudson",40,"763757582","874891622","mauris@icloud.couk");
INSERT INTO `Cliente` (`idCliente`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (81,"Nero Shaffer","eget","Leah Moreno",77,"367752146","724843595","ipsum@icloud.com"),
  (82,"Lance Wheeler","enim.","Daria Emerson",81,"931568297","961557363","orci.in.consequat@hotmail.couk"),
  (83,"Madaline Koch","hendrerit","Cynthia Good",46,"327421789","549473487","velit.cras@icloud.org"),
  (84,"Catherine Randolph","Morbi","Emery Gonzalez",34,"657423448","474242481","tellus.eu.augue@protonmail.net"),
  (85,"Chaim Sanders","tincidunt","Isaiah Nixon",94,"662157115","823693882","ac@yahoo.couk"),
  (86,"Walter James","scelerisque","Malik Joseph",69,"586742926","826627465","gravida.nunc@yahoo.edu"),
  (87,"Jolene Jacobson","interdum.","Abraham Hardin",76,"487261185","525347126","ipsum.nunc@aol.com"),
  (88,"Kaitlin Chang","justo","Berk Burgess",15,"421342188","444423857","non.leo@protonmail.ca"),
  (89,"Raya Young","gravida","Xantha Woodard",83,"838124878","842434489","fusce.fermentum.fermentum@google.edu"),
  (90,"Brett Hines","lorem","Kennan Harper",11,"722855873","342848626","orci@yahoo.net");
INSERT INTO `Cliente` (`idCliente`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (91,"Alice Bates","amet,","Lila Chandler",65,"764387372","856535523","duis.sit@google.org"),
  (92,"Sigourney Parks","ligula","Beau Nicholson",40,"956854654","734974644","amet@hotmail.org"),
  (93,"Bernard Poole","mus.","Shad Cote",29,"935517734","699861848","at@aol.org"),
  (94,"Kaye Pugh","pretium","Bo Mckinney",96,"138478669","225337212","ut@icloud.ca"),
  (95,"Sheila Mathews","nibh","Keiko Mckenzie",53,"749399743","825196924","convallis.convallis@icloud.org"),
  (96,"Candace Allen","Proin","Unity Herman",22,"187553655","745345589","in.faucibus.orci@outlook.ca"),
  (97,"Kai Terrell","facilisis,","Michelle Potts",25,"768528743","678486396","gravida.praesent.eu@protonmail.net"),
  (98,"Jenette Gay","Curabitur","Brenna Moon",68,"776424433","237825387","egestas.ligula@hotmail.ca"),
  (99,"Carl Love","Nunc","Christian Dorsey",56,"883489633","631878824","aenean.euismod@icloud.ca"),
  (100,"Sybil Hatfield","tempor","Ulysses Cherry",37,"731769176","457547826","bibendum.ullamcorper@protonmail.ca");
*/


/*50 Proprietários Gerados Aleatoriamente-----------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `Proprietario` (`idProprietario`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (1,"Rooney Patton","Phasellus","Barry Wong",29,"971957534","352736672","diam.nunc@protonmail.net"),
  (2,"Tara Burton","at,","Basil Barker",6,"111935847","546652447","consequat@hotmail.couk"),
  (3,"Fatima Dean","lobortis","Beck Roach",53,"769373363","589248666","libero@outlook.ca"),
  (4,"Ivana Morton","elit","Lacy Garner",51,"188953617","357336221","lorem.luctus.ut@hotmail.edu"),
  (5,"Cassady Boyer","at","Jared Drake",36,"143533337","717562239","faucibus@hotmail.org"),
  (6,"Hiram O'Neill","nonummy","Akeem Ruiz",45,"863622348","857219574","donec@yahoo.net"),
  (7,"Castor Bernard","non","Lane Santana",92,"541456354","642768877","vulputate.mauris@protonmail.com"),
  (8,"Hollee Castro","rhoncus","Barrett Garrett",44,"548485639","552755454","orci@yahoo.ca"),
  (9,"Jonah Montoya","dui","Giselle Ross",78,"317255223","651855435","ultrices.duis@aol.couk"),
  (10,"Demetria Michael","Donec","Aladdin Acevedo",46,"946871337","498264172","ullamcorper.duis.cursus@aol.org");
/*INSERT INTO `Proprietario` (`idProprietario`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (11,"Britanney Garcia","vitae,","Hu Arnold",97,"635636848","982277647","arcu.ac@icloud.org"),
  (12,"Hedy Jenkins","semper","Cathleen Zamora",39,"183512978","374447532","donec@icloud.net"),
  (13,"Selma Park","magnis","Molly Byers",57,"137583856","762743532","consectetuer.adipiscing.elit@icloud.couk"),
  (14,"Karyn Diaz","libero.","Illana Anderson",49,"313328897","323563438","lectus.ante.dictum@aol.org"),
  (15,"Irma Daniel","sociosqu","Cedric Stein",75,"375352787","462564422","eu.neque@hotmail.couk"),
  (16,"Alexa Dickson","nunc","Gannon Steele",74,"682681556","987261817","dis.parturient.montes@aol.couk"),
  (17,"Caleb Sawyer","Proin","Linda Savage",55,"585722237","273418715","sed.eu@google.com"),
  (18,"Pascale Hughes","Donec","Colin Macdonald",41,"472298459","989482943","vel.lectus@google.com"),
  (19,"Edward Crawford","laoreet","Alden Reid",8,"727476877","221614484","taciti.sociosqu.ad@google.ca"),
  (20,"Hakeem Hendricks","nibh.","Colorado Vazquez",32,"645245536","211174755","consectetuer.mauris@yahoo.couk");
INSERT INTO `Proprietario` (`idProprietario`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (21,"Paula Perkins","tellus","Walker Franks",39,"652645937","826353376","at.sem@protonmail.edu"),
  (22,"Upton Russell","aliquam","Sarah Bass",83,"828552568","877449343","molestie@icloud.com"),
  (23,"Bruno Shaw","dui.","Janna Morrison",6,"342886654","136275693","donec.sollicitudin.adipiscing@outlook.edu"),
  (24,"Timothy Hahn","Proin","Thane Hicks",54,"471798669","463375426","non.quam@google.edu"),
  (25,"Kato Shepard","Nam","Quinlan Trevino",8,"738582322","925238456","in.aliquet@icloud.net"),
  (26,"Moana Rice","Nam","Prescott Mayer",31,"756731328","638659437","risus.morbi.metus@icloud.org"),
  (27,"Drake Johnston","mauris","Cleo Wooten",4,"564634332","637568685","blandit.congue@icloud.com"),
  (28,"William Buck","libero.","Giselle Strickland",29,"956254546","872653845","a.dui@outlook.net"),
  (29,"Lewis Pitts","varius","Beatrice Newman",22,"626251467","882356242","nunc.ullamcorper@outlook.couk"),
  (30,"Rose Mosley","nascetur","Devin Wood",81,"455816786","455555619","enim.suspendisse.aliquet@aol.couk");
INSERT INTO `Proprietario` (`idProprietario`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (31,"Myles Abbott","Pellentesque","Germane Daniels",30,"788235767","343318191","nisi.cum@outlook.com"),
  (32,"Lewis Serrano","molestie","Ivan Hurley",74,"827557774","852432272","vel@google.org"),
  (33,"Kerry Blackwell","Morbi","Kyle Mendez",60,"836781368","876168636","ut.lacus@protonmail.ca"),
  (34,"Brian Fuentes","lacus.","Rama Hutchinson",57,"385174965","555453164","nulla.eget.metus@yahoo.ca"),
  (35,"Barrett Castro","mus.","Whitney York",36,"288937884","187357871","curabitur@yahoo.com"),
  (36,"Norman Valdez","Fusce","Paula Ware",56,"654543538","828653933","aliquet@yahoo.couk"),
  (37,"Reed Parker","elit,","Leroy Butler",2,"385816379","598423138","vel.convallis@icloud.net"),
  (38,"Chava Clarke","non","MacKensie Brock",38,"423283621","896857347","tristique.pharetra@aol.net"),
  (39,"Gary Barry","dui","Jasmine Benjamin",73,"663232575","198527963","arcu.et@yahoo.com"),
  (40,"Myles Mclean","leo","Stacy Jennings",52,"834126647","972344372","aliquam.nisl@hotmail.edu");
INSERT INTO `Proprietario` (`idProprietario`,`username`,`pass`,`nome`,`idade`,`nif`,`telefone`,`email`)
VALUES
  (41,"Victoria Reed","Nullam","Hakeem Mays",11,"846364452","445435573","ipsum.non@protonmail.com"),
  (42,"Keith Woodard","lacinia","Dylan Rocha",40,"887547133","833281764","pede@yahoo.com"),
  (43,"Ferdinand Robertson","fermentum","Melvin Blankenship",91,"948815312","542595336","orci.lacus.vestibulum@outlook.couk"),
  (44,"Ishmael Le","habitant","Brian Turner",54,"819829645","442897218","vel.pede@outlook.edu"),
  (45,"Rigel Small","lorem","Ulric Noel",75,"761361234","646221676","sit@icloud.edu"),
  (46,"Adrian Tanner","sem","Plato Blake",37,"362286273","281863372","penatibus.et.magnis@aol.net"),
  (47,"Aspen Kane","sit","Barry Albert",75,"283156729","832923487","erat@outlook.net"),
  (48,"Lane Mcclure","Nunc","Uma Hurst",44,"248431284","677559198","ridiculus@outlook.couk"),
  (49,"Elizabeth Cummings","Aenean","Alvin Dickson",78,"431318387","683212546","dictum.eu@yahoo.couk"),
  (50,"Georgia Francis","amet,","Kelsie Farmer",81,"432179299","357951368","erat@outlook.ca");*/


/* 200 Moradas */
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (1,"Ap #969-6396 Donec Rd."),
  (2,"Ap #241-8356 Egestas Rd."),
  (3,"P.O. Box 398, 361 Proin Avenue"),
  (4,"P.O. Box 638, 5727 Curae St."),
  (5,"P.O. Box 193, 8009 Sagittis Avenue"),
  (6,"Ap #474-2691 Ut St."),
  (7,"6003 Est. Rd."),
  (8,"Ap #869-1611 Proin St."),
  (9,"525-3559 Eget St."),
  (10,"Ap #482-5667 Pellentesque Rd.");
/*INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (11,"846-5789 Ac Rd."),
  (12,"P.O. Box 774, 4925 Velit. Rd."),
  (13,"Ap #613-3152 Eget St."),
  (14,"Ap #432-1805 Suspendisse Av."),
  (15,"232-9503 Nisi. Av."),
  (16,"858-8997 Augue, Rd."),
  (17,"P.O. Box 773, 6470 Lacinia Rd."),
  (18,"Ap #424-1456 Pellentesque Street"),
  (19,"Ap #195-8573 Ipsum. Rd."),
  (20,"Ap #563-6680 Luctus, Road");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (21,"6915 Enim Street"),
  (22,"703-7942 Risus. Road"),
  (23,"293-174 Hendrerit Ave"),
  (24,"7997 Quisque St."),
  (25,"Ap #760-4199 Proin Av."),
  (26,"694-5213 Egestas. St."),
  (27,"P.O. Box 761, 8222 Aptent Ave"),
  (28,"722-1674 Cum Av."),
  (29,"Ap #952-482 Nec, Avenue"),
  (30,"Ap #788-4392 At Rd.");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (31,"120-5887 Sollicitudin St."),
  (32,"134-4217 Sagittis. Avenue"),
  (33,"Ap #630-9068 Est Rd."),
  (34,"176-5636 Risus Rd."),
  (35,"4633 Nibh. Rd."),
  (36,"Ap #803-2720 Sagittis Ave"),
  (37,"P.O. Box 610, 1004 Pellentesque St."),
  (38,"P.O. Box 932, 8408 Rutrum Rd."),
  (39,"P.O. Box 190, 9478 In, Rd."),
  (40,"P.O. Box 559, 7943 Egestas Avenue");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (41,"P.O. Box 843, 2000 Magna. Rd."),
  (42,"Ap #782-7452 Amet Avenue"),
  (43,"712-2129 Neque. Rd."),
  (44,"Ap #976-9778 Fusce Ave"),
  (45,"Ap #437-9731 Sit Ave"),
  (46,"Ap #734-7858 Nullam Rd."),
  (47,"707-8885 Neque Rd."),
  (48,"907-7588 Arcu Avenue"),
  (49,"366-9241 Tellus. Rd."),
  (50,"Ap #547-3434 Ornare Road");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (51,"Ap #209-103 Enim, Street"),
  (52,"P.O. Box 749, 1520 Risus. Ave"),
  (53,"659-9714 At Rd."),
  (54,"7128 Sed Avenue"),
  (55,"784-2323 Nunc Street"),
  (56,"Ap #401-7271 Felis Rd."),
  (57,"886-7340 Nulla Rd."),
  (58,"703-7483 Convallis, Road"),
  (59,"8479 Nunc Avenue"),
  (60,"234-6073 Et, Rd.");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (61,"P.O. Box 960, 7855 Cursus. Road"),
  (62,"688-1977 Nullam Street"),
  (63,"719-2813 Mollis. Rd."),
  (64,"288-8736 Arcu St."),
  (65,"Ap #173-358 Sem Rd."),
  (66,"Ap #454-723 Eu Av."),
  (67,"P.O. Box 906, 5050 Sit St."),
  (68,"102-8657 Aliquet. St."),
  (69,"155-5686 Sem St."),
  (70,"Ap #898-9425 Nulla. Av.");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (71,"820-9362 Diam Road"),
  (72,"Ap #986-8035 Elit, Av."),
  (73,"358-7536 Et Rd."),
  (74,"957-168 Quisque Road"),
  (75,"Ap #818-5215 Nisi. St."),
  (76,"8560 Pede, Rd."),
  (77,"P.O. Box 128, 9755 Tellus. Rd."),
  (78,"Ap #957-1478 Eget, St."),
  (79,"489-3773 Amet Avenue"),
  (80,"127-8958 Venenatis Av.");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (81,"399-487 Turpis Street"),
  (82,"P.O. Box 392, 3649 Nibh Ave"),
  (83,"P.O. Box 110, 5988 Orci Street"),
  (84,"779-3485 Habitant Ave"),
  (85,"6390 Enim. Ave"),
  (86,"103-2684 Orci Rd."),
  (87,"873-7216 Est St."),
  (88,"6136 Metus. Ave"),
  (89,"Ap #938-5301 Tincidunt, Rd."),
  (90,"272-1193 Nec, Street");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (91,"658-5485 Fringilla. Rd."),
  (92,"P.O. Box 883, 2874 Maecenas Rd."),
  (93,"Ap #247-9062 Orci, Ave"),
  (94,"Ap #717-5968 Proin Ave"),
  (95,"P.O. Box 635, 7901 Eu, Rd."),
  (96,"1970 Eleifend. Rd."),
  (97,"P.O. Box 105, 3272 Lectus, St."),
  (98,"P.O. Box 146, 4737 Iaculis Rd."),
  (99,"Ap #677-1975 Consectetuer Rd."),
  (100,"Ap #662-8816 Eu St.");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (101,"P.O. Box 651, 7269 Quis Road"),
  (102,"Ap #665-9106 Eget Avenue"),
  (103,"6392 Sed Street"),
  (104,"979-7215 Sed Avenue"),
  (105,"582-9427 Nunc Rd."),
  (106,"Ap #323-3574 Dui. St."),
  (107,"Ap #858-8680 Ornare Street"),
  (108,"293-6513 In, Rd."),
  (109,"Ap #580-2839 Egestas, Rd."),
  (110,"9824 Arcu. Rd.");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (111,"512-8857 Luctus Rd."),
  (112,"Ap #702-2543 Amet, Ave"),
  (113,"4388 Cursus Rd."),
  (114,"342-9444 Ipsum. Rd."),
  (115,"301-8635 Amet, St."),
  (116,"Ap #923-409 Erat Rd."),
  (117,"Ap #661-715 Magna Rd."),
  (118,"Ap #215-3852 Turpis Ave"),
  (119,"P.O. Box 775, 1252 Mauris, Rd."),
  (120,"5051 Vestibulum. Street");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (121,"4043 Vivamus Ave"),
  (122,"416-522 Urna St."),
  (123,"Ap #947-2042 Curabitur Avenue"),
  (124,"Ap #925-9503 Egestas. Ave"),
  (125,"P.O. Box 947, 4933 Sed Avenue"),
  (126,"P.O. Box 345, 241 Mauris Av."),
  (127,"Ap #907-9260 Amet Road"),
  (128,"712-9645 Tincidunt Rd."),
  (129,"Ap #797-1675 Ante. Ave"),
  (130,"8558 Turpis Ave");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (131,"1108 Duis Rd."),
  (132,"8384 Turpis. St."),
  (133,"Ap #612-1163 Sociosqu St."),
  (134,"Ap #229-9233 Ante, St."),
  (135,"P.O. Box 761, 5669 Nullam Rd."),
  (136,"382-8807 Eros. Street"),
  (137,"P.O. Box 176, 477 Viverra. Av."),
  (138,"525-914 Tristique Rd."),
  (139,"5917 Porttitor Avenue"),
  (140,"Ap #214-3201 Nulla Rd.");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (141,"745-6550 Fringilla St."),
  (142,"5339 Eu St."),
  (143,"495-1128 Nullam Rd."),
  (144,"P.O. Box 704, 6361 A St."),
  (145,"Ap #966-1390 Nulla Road"),
  (146,"P.O. Box 169, 1350 Suspendisse Street"),
  (147,"Ap #932-2979 Eu St."),
  (148,"Ap #171-8439 Tortor Rd."),
  (149,"354-1334 A, St."),
  (150,"P.O. Box 375, 4685 Dis Avenue");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (151,"P.O. Box 333, 9725 Molestie St."),
  (152,"756-6432 At St."),
  (153,"Ap #247-6087 At, Road"),
  (154,"Ap #564-2220 Orci Avenue"),
  (155,"P.O. Box 236, 7034 Semper Rd."),
  (156,"825-587 Vulputate, Av."),
  (157,"P.O. Box 595, 5394 Donec Rd."),
  (158,"Ap #297-3972 Magna. St."),
  (159,"241-8146 In Street"),
  (160,"Ap #956-4562 Fusce Avenue");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (161,"Ap #608-2690 Proin Rd."),
  (162,"P.O. Box 364, 1321 Consectetuer St."),
  (163,"1280 Nisi Road"),
  (164,"P.O. Box 384, 417 A, Ave"),
  (165,"P.O. Box 178, 9993 Facilisis. St."),
  (166,"Ap #833-6782 Quam. Rd."),
  (167,"P.O. Box 419, 7513 Non Road"),
  (168,"768 Pharetra Street"),
  (169,"468-1697 Vel St."),
  (170,"453-3854 Nostra, Av.");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (171,"Ap #110-2529 Sem Street"),
  (172,"275-2843 Dictum St."),
  (173,"747-4914 Ante St."),
  (174,"P.O. Box 260, 6957 Lectus Road"),
  (175,"637-3489 Non Rd."),
  (176,"P.O. Box 872, 6015 Feugiat Avenue"),
  (177,"122-3735 Velit. Rd."),
  (178,"616-5164 Donec Road"),
  (179,"P.O. Box 317, 7471 Diam Road"),
  (180,"Ap #173-2090 Metus Av.");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (181,"P.O. Box 210, 5215 Dolor Rd."),
  (182,"851-9203 Diam Avenue"),
  (183,"Ap #705-4692 Orci, Street"),
  (184,"783-1218 Fusce St."),
  (185,"P.O. Box 280, 2795 Magna St."),
  (186,"Ap #817-470 Eleifend Road"),
  (187,"Ap #884-3196 Ullamcorper Rd."),
  (188,"Ap #184-4957 Eget Road"),
  (189,"P.O. Box 319, 8567 Fermentum Road"),
  (190,"5572 Purus. Avenue");
INSERT INTO `Morada` (`idMorada`,`nome`)
VALUES
  (191,"3746 Eu Avenue"),
  (192,"9066 Volutpat. Rd."),
  (193,"127-1349 Diam. Rd."),
  (194,"739-1529 Arcu. Rd."),
  (195,"349-193 Convallis, Ave"),
  (196,"882-8235 Sociis Rd."),
  (197,"7076 Augue Rd."),
  (198,"Ap #392-7988 Fringilla. Ave"),
  (199,"P.O. Box 952, 9232 Egestas Road"),
  (200,"Ap #578-1859 A, Street");*/
  
  

/*50 Restaurantes Gerados Aleatoriamente--------------------------------*/
INSERT INTO `Restaurante` (`idRestaurante`,`nome`,`morada`,`tipo`)
VALUES
  (1,"MCDonals","197-1124 Elementum, Rd.","Tipo"),
  (2,"Burguer King","850-2661 Interdum. St.","Tipo"),
  (3,"Starbucks","Ap #686-5741 Ipsum Rd.","Tipo"),
  (4,"Café Costa","505-7922 Sit St.","Tipo"),
  (5,"Café Aliança","Ap #333-6320 Vulputate, Road","Tipo"),
  (6,"O Gato Pingado","Ap #175-3890 Curabitur Rd.","Tipo"),
  (7,"Água na Boca","827-2876 Morbi Road","Tipo"),
  (8,"Delícias na Panela","363-3617 Pellentesque Rd.","Tipo"),
  (9,"Fogão a Lenha","663-7670 Proin Avenue","Tipo"),
  (10,"Jogo de panela","728-6809 Purus St.","Tipo");
/*INSERT INTO `Restaurante` (`idRestaurante`,`nome`,`morada`,`tipo`)
VALUES
  (11,"Nome","204-2616 Sed Av.","Tipo"),
  (12,"Nome","5468 Ligula. Ave","Tipo"),
  (13,"Nome","Ap #200-3674 Id Av.","Tipo"),
  (14,"Nome","654-3599 Ac Street","Tipo"),
  (15,"Nome","P.O. Box 598, 5652 Pede. St.","Tipo"),
  (16,"Nome","8837 Ut Rd.","Tipo"),
  (17,"Nome","777-7862 Id Rd.","Tipo"),
  (18,"Nome","P.O. Box 840, 8983 Interdum Avenue","Tipo"),
  (19,"Nome","P.O. Box 832, 3137 Lectus Road","Tipo"),
  (20,"Nome","2823 Eu Road","Tipo");
INSERT INTO `Restaurante` (`idRestaurante`,`nome`,`morada`,`tipo`)
VALUES
  (21,"Nome","709-2201 Enim Avenue","Tipo"),
  (22,"Nome","2988 Fusce St.","Tipo"),
  (23,"Nome","Ap #492-8290 Dignissim Avenue","Tipo"),
  (24,"Nome","759-7857 Rhoncus. Avenue","Tipo"),
  (25,"Nome","Ap #734-3713 Lectus Avenue","Tipo"),
  (26,"Nome","783-5289 Ultrices Rd.","Tipo"),
  (27,"Nome","Ap #359-975 Turpis. Rd.","Tipo"),
  (28,"Nome","366-6766 Ornare, Avenue","Tipo"),
  (29,"Nome","Ap #933-7033 Turpis St.","Tipo"),
  (30,"Nome","Ap #108-520 Magnis Rd.","Tipo");
INSERT INTO `Restaurante` (`idRestaurante`,`nome`,`morada`,`tipo`)
VALUES
  (31,"Nome","Ap #263-4444 Mi. Street","Tipo"),
  (32,"Nome","P.O. Box 521, 7014 Nostra, Ave","Tipo"),
  (33,"Nome","206-7886 Arcu St.","Tipo"),
  (34,"Nome","Ap #963-5822 Donec St.","Tipo"),
  (35,"Nome","6958 Nulla Street","Tipo"),
  (36,"Nome","6851 Tristique Rd.","Tipo"),
  (37,"Nome","Ap #384-3198 Eu, St.","Tipo"),
  (38,"Nome","P.O. Box 400, 6117 Integer Road","Tipo"),
  (39,"Nome","Ap #875-9034 Vestibulum. Road","Tipo"),
  (40,"Nome","5278 Malesuada Road","Tipo");
INSERT INTO `Restaurante` (`idRestaurante`,`nome`,`morada`,`tipo`)
VALUES
  (41,"Nome","9211 Nullam Road","Tipo"),
  (42,"Nome","Ap #684-2662 Pharetra Avenue","Tipo"),
  (43,"Nome","859-3821 Sapien Rd.","Tipo"),
  (44,"Nome","Ap #528-2184 Ultrices Av.","Tipo"),
  (45,"Nome","Ap #868-5633 Hendrerit. St.","Tipo"),
  (46,"Nome","138-4295 Orci Av.","Tipo"),
  (47,"Nome","548-9347 Ultrices, Av.","Tipo"),
  (48,"Nome","P.O. Box 535, 6074 Eu, St.","Tipo"),
  (49,"Nome","P.O. Box 141, 1325 Sollicitudin St.","Tipo"),
  (50,"Nome","P.O. Box 431, 5979 Interdum. Street","Tipo");*/



/*100 Pratos -------------------------------------------------------*/
INSERT INTO `Prato` (`idPrato`,`nome`,`descricao`,`tipo`,`categoria`, 'restaurante', 'price')
VALUES
  (1,"Pepper's Pizza","Ingredients: Mozarella, Pepperoni, Tomato Sauce, Olives","plates","Pizza", 1, 5.23),
  (2,"Cheeseburger","Ingredients: Cheese, Bread, Lettuce, Tomato, Pickles and 50g Cow Beef Steak","plates","Burger", 2, 4.50),
  (3,"Meat Lover Burger","Bread, Two 100g Cow Beef Steaks, Cheese and Onion","plates","Burger", 3, 7.99),
  (4,"Extra Cheese Pizza","Four types of cheese, tomato sauce and olives","plates","Pizza", 4, 4,99),
  (5,"Seaside Sandwich","French Bread, Tuna Fish, Lettuce, Onion and Mayonnaise","plates","Sandwich", 5),
  (6,"Coca-Cola","descricao","drink","categoria", 6, 1.88),
  (7,"Nome","descricao","desserts","categoria", 7, 1.79),
  (8,"Nome","descricao","drinks","categoria", 8, 1,20),
  (9,"Nome","descricao","extras","categoria", 9, 0.99),
  (10,"Nome","descricao","desserts","categoria", 10, 2,15);
/*INSERT INTO `Prato` (`idPrato`,`nome`,`descricao`,`tipo`,`categoria`)
VALUES
  (11,"Nome","descricao","Tipo","categoria"),
  (12,"Nome","descricao","Tipo","categoria"),
  (13,"Nome","descricao","Tipo","categoria"),
  (14,"Nome","descricao","Tipo","categoria"),
  (15,"Nome","descricao","Tipo","categoria"),
  (16,"Nome","descricao","Tipo","categoria"),
  (17,"Nome","descricao","Tipo","categoria"),
  (18,"Nome","descricao","Tipo","categoria"),
  (19,"Nome","descricao","Tipo","categoria"),
  (20,"Nome","descricao","Tipo","categoria");
INSERT INTO `Prato` (`idPrato`,`nome`,`descricao`,`tipo`,`categoria`)
VALUES
  (21,"Nome","descricao","Tipo","categoria"),
  (22,"Nome","descricao","Tipo","categoria"),
  (23,"Nome","descricao","Tipo","categoria"),
  (24,"Nome","descricao","Tipo","categoria"),
  (25,"Nome","descricao","Tipo","categoria"),
  (26,"Nome","descricao","Tipo","categoria"),
  (27,"Nome","descricao","Tipo","categoria"),
  (28,"Nome","descricao","Tipo","categoria"),
  (29,"Nome","descricao","Tipo","categoria"),
  (30,"Nome","descricao","Tipo","categoria");
INSERT INTO `Prato` (`idPrato`,`nome`,`descricao`,`tipo`,`categoria`)
VALUES
  (31,"Nome","descricao","Tipo","categoria"),
  (32,"Nome","descricao","Tipo","categoria"),
  (33,"Nome","descricao","Tipo","categoria"),
  (34,"Nome","descricao","Tipo","categoria"),
  (35,"Nome","descricao","Tipo","categoria"),
  (36,"Nome","descricao","Tipo","categoria"),
  (37,"Nome","descricao","Tipo","categoria"),
  (38,"Nome","descricao","Tipo","categoria"),
  (39,"Nome","descricao","Tipo","categoria"),
  (40,"Nome","descricao","Tipo","categoria");
INSERT INTO `Prato` (`idPrato`,`nome`,`descricao`,`tipo`,`categoria`)
VALUES
  (41,"Nome","descricao","Tipo","categoria"),
  (42,"Nome","descricao","Tipo","categoria"),
  (43,"Nome","descricao","Tipo","categoria"),
  (44,"Nome","descricao","Tipo","categoria"),
  (45,"Nome","descricao","Tipo","categoria"),
  (46,"Nome","descricao","Tipo","categoria"),
  (47,"Nome","descricao","Tipo","categoria"),
  (48,"Nome","descricao","Tipo","categoria"),
  (49,"Nome","descricao","Tipo","categoria"),
  (50,"Nome","descricao","Tipo","categoria");
INSERT INTO `Prato` (`idPrato`,`nome`,`descricao`,`tipo`,`categoria`)
VALUES
  (51,"Nome","descricao","Tipo","categoria"),
  (52,"Nome","descricao","Tipo","categoria"),
  (53,"Nome","descricao","Tipo","categoria"),
  (54,"Nome","descricao","Tipo","categoria"),
  (55,"Nome","descricao","Tipo","categoria"),
  (56,"Nome","descricao","Tipo","categoria"),
  (57,"Nome","descricao","Tipo","categoria"),
  (58,"Nome","descricao","Tipo","categoria"),
  (59,"Nome","descricao","Tipo","categoria"),
  (60,"Nome","descricao","Tipo","categoria");
INSERT INTO `Prato` (`idPrato`,`nome`,`descricao`,`tipo`,`categoria`)
VALUES
  (61,"Nome","descricao","Tipo","categoria"),
  (62,"Nome","descricao","Tipo","categoria"),
  (63,"Nome","descricao","Tipo","categoria"),
  (64,"Nome","descricao","Tipo","categoria"),
  (65,"Nome","descricao","Tipo","categoria"),
  (66,"Nome","descricao","Tipo","categoria"),
  (67,"Nome","descricao","Tipo","categoria"),
  (68,"Nome","descricao","Tipo","categoria"),
  (69,"Nome","descricao","Tipo","categoria"),
  (70,"Nome","descricao","Tipo","categoria");
INSERT INTO `Prato` (`idPrato`,`nome`,`descricao`,`tipo`,`categoria`)
VALUES
  (71,"Nome","descricao","Tipo","categoria"),
  (72,"Nome","descricao","Tipo","categoria"),
  (73,"Nome","descricao","Tipo","categoria"),
  (74,"Nome","descricao","Tipo","categoria"),
  (75,"Nome","descricao","Tipo","categoria"),
  (76,"Nome","descricao","Tipo","categoria"),
  (77,"Nome","descricao","Tipo","categoria"),
  (78,"Nome","descricao","Tipo","categoria"),
  (79,"Nome","descricao","Tipo","categoria"),
  (80,"Nome","descricao","Tipo","categoria");
INSERT INTO `Prato` (`idPrato`,`nome`,`descricao`,`tipo`,`categoria`)
VALUES
  (81,"Nome","descricao","Tipo","categoria"),
  (82,"Nome","descricao","Tipo","categoria"),
  (83,"Nome","descricao","Tipo","categoria"),
  (84,"Nome","descricao","Tipo","categoria"),
  (85,"Nome","descricao","Tipo","categoria"),
  (86,"Nome","descricao","Tipo","categoria"),
  (87,"Nome","descricao","Tipo","categoria"),
  (88,"Nome","descricao","Tipo","categoria"),
  (89,"Nome","descricao","Tipo","categoria"),
  (90,"Nome","descricao","Tipo","categoria");
INSERT INTO `Prato` (`idPrato`,`nome`,`descricao`,`tipo`,`categoria`)
VALUES
  (91,"Nome","descricao","Tipo","categoria"),
  (92,"Nome","descricao","Tipo","categoria"),
  (93,"Nome","descricao","Tipo","categoria"),
  (94,"Nome","descricao","Tipo","categoria"),
  (95,"Nome","descricao","Tipo","categoria"),
  (96,"Nome","descricao","Tipo","categoria"),
  (97,"Nome","descricao","Tipo","categoria"),
  (98,"Nome","descricao","Tipo","categoria"),
  (99,"Nome","descricao","Tipo","categoria"),
  (100,"Nome","descricao","Tipo","categoria");
*/


/*Pedido ----------------------------------------------------------------*/
INSERT INTO `Pedido` (`idPedido`, `idCliente`, `idRestaurante`, `estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (1, 8, 9, "estado","comentario","619-2904 Enim. Street","Dec 20, 2021","11:08 PM"),
  (2, 6, 6, "estado","comentario","Ap #251-9626 In Avenue","Jul 10, 2022","12:35 AM"),
  (3, 1, 3, "estado","comentario","1746 Interdum. Av.","May 6, 2022","8:54 AM"),
  (4, 3, 7, "estado","comentario","474-1687 Et Road","Jul 26, 2021","6:55 AM"),
  (5, 7, 10, "estado","comentario","913-472 Vitae Rd.","Dec 27, 2022","9:27 AM"),
  (6, 4, 1, "estado","comentario","P.O. Box 382, 8614 Urna. Rd.","Dec 15, 2021","11:27 AM"),
  (7, 9, 2, "estado","comentario","P.O. Box 942, 3158 Ac Avenue","Feb 21, 2022","5:52 AM"),
  (8, 2, 4, "estado","comentario","Ap #306-2866 Dui. Av.","Feb 5, 2022","10:38 AM"),
  (9, 10, 8, "estado","comentario","P.O. Box 767, 2525 Parturient St.","Jan 9, 2022","6:28 AM"),
  (10, 5, 5, "estado","comentario","7186 Diam. Street","Dec 9, 2021","5:00 AM");
/*INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (11,"estado","comentario","926-4802 Dolor. St.","Oct 27, 2021","12:50 PM"),
  (12,"estado","comentario","Ap #476-4027 Hendrerit Av.","Dec 18, 2021","1:43 PM"),
  (13,"estado","comentario","P.O. Box 363, 8939 Aliquam Rd.","Oct 20, 2022","3:49 AM"),
  (14,"estado","comentario","P.O. Box 681, 4057 Donec Avenue","Jul 21, 2022","10:57 AM"),
  (15,"estado","comentario","P.O. Box 318, 2117 Scelerisque St.","Mar 20, 2023","1:55 AM"),
  (16,"estado","comentario","Ap #934-7206 Vitae, Ave","Jun 27, 2021","11:38 AM"),
  (17,"estado","comentario","P.O. Box 595, 779 Adipiscing. Av.","Sep 4, 2022","7:44 AM"),
  (18,"estado","comentario","Ap #417-8213 Semper, Street","Jan 4, 2023","1:42 AM"),
  (19,"estado","comentario","3110 Dolor. Ave","May 19, 2021","6:11 AM"),
  (20,"estado","comentario","Ap #357-9771 Vivamus Av.","Oct 7, 2022","12:14 AM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (21,"estado","comentario","817 Tellus St.","Feb 18, 2023","9:57 AM"),
  (22,"estado","comentario","930-6013 Ligula. St.","Apr 21, 2022","5:51 AM"),
  (23,"estado","comentario","805-5214 Semper Street","Nov 11, 2022","9:04 AM"),
  (24,"estado","comentario","P.O. Box 577, 6406 Et St.","Mar 6, 2022","5:25 PM"),
  (25,"estado","comentario","Ap #391-3700 Nibh. Road","May 4, 2021","11:46 PM"),
  (26,"estado","comentario","Ap #919-6698 Aliquam Rd.","Oct 27, 2021","4:42 PM"),
  (27,"estado","comentario","Ap #956-7220 Vestibulum Rd.","Oct 16, 2022","6:10 AM"),
  (28,"estado","comentario","Ap #412-2611 Felis St.","Jan 26, 2023","5:12 PM"),
  (29,"estado","comentario","Ap #570-3804 Auctor Ave","Mar 3, 2022","1:23 PM"),
  (30,"estado","comentario","295-2880 Bibendum Avenue","Nov 12, 2021","1:51 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (31,"estado","comentario","Ap #951-8417 Et St.","Aug 28, 2022","1:04 PM"),
  (32,"estado","comentario","Ap #392-1258 Blandit Road","Oct 11, 2021","5:24 PM"),
  (33,"estado","comentario","184-4799 Lorem Street","May 27, 2022","9:04 AM"),
  (34,"estado","comentario","125-6171 Blandit Av.","Feb 22, 2023","3:14 AM"),
  (35,"estado","comentario","5885 Quisque Avenue","Oct 29, 2021","6:15 PM"),
  (36,"estado","comentario","Ap #827-1629 Aliquet Street","Apr 15, 2023","7:02 AM"),
  (37,"estado","comentario","Ap #994-6781 Tristique St.","Jan 15, 2022","9:09 PM"),
  (38,"estado","comentario","Ap #291-5347 Morbi St.","Oct 11, 2022","3:23 AM"),
  (39,"estado","comentario","P.O. Box 794, 8847 Ac Av.","Feb 21, 2023","10:45 PM"),
  (40,"estado","comentario","1642 Volutpat St.","Nov 30, 2022","10:14 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (41,"estado","comentario","778-9124 Eros Ave","Nov 11, 2021","4:31 PM"),
  (42,"estado","comentario","Ap #152-1977 Eu Rd.","Jan 6, 2022","1:57 PM"),
  (43,"estado","comentario","7419 Odio. St.","Jun 26, 2021","2:21 AM"),
  (44,"estado","comentario","907 Consequat Avenue","Sep 26, 2022","3:19 PM"),
  (45,"estado","comentario","Ap #200-831 Donec Rd.","May 13, 2022","9:18 PM"),
  (46,"estado","comentario","416-4656 Ipsum Road","Dec 20, 2021","8:51 AM"),
  (47,"estado","comentario","P.O. Box 657, 650 Ac Street","Dec 11, 2021","10:23 PM"),
  (48,"estado","comentario","Ap #740-6499 Cursus Avenue","Mar 17, 2022","10:54 PM"),
  (49,"estado","comentario","P.O. Box 227, 1561 Semper St.","Jun 10, 2022","4:45 PM"),
  (50,"estado","comentario","671-7147 Fringilla Rd.","Apr 16, 2022","1:59 AM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (51,"estado","comentario","4126 Diam Rd.","Dec 4, 2022","9:30 PM"),
  (52,"estado","comentario","647-9499 Et St.","Nov 27, 2021","6:18 AM"),
  (53,"estado","comentario","P.O. Box 952, 2416 Sagittis Ave","Apr 23, 2022","5:32 AM"),
  (54,"estado","comentario","Ap #937-2848 Volutpat. Av.","Mar 26, 2023","4:33 PM"),
  (55,"estado","comentario","906-4192 Eget, Road","May 3, 2022","6:23 AM"),
  (56,"estado","comentario","683-4742 Facilisis Avenue","Nov 11, 2021","1:04 AM"),
  (57,"estado","comentario","480-6399 Morbi Avenue","Jul 9, 2021","2:26 PM"),
  (58,"estado","comentario","9480 Ridiculus St.","Jun 24, 2022","8:08 PM"),
  (59,"estado","comentario","Ap #409-5527 Nam St.","Aug 18, 2021","6:00 AM"),
  (60,"estado","comentario","545 Phasellus Street","Mar 26, 2023","7:00 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (61,"estado","comentario","Ap #674-7551 Malesuada Street","Jan 6, 2023","7:18 AM"),
  (62,"estado","comentario","Ap #367-9601 Vitae Street","Sep 18, 2022","1:27 PM"),
  (63,"estado","comentario","Ap #417-6187 Cras Ave","May 5, 2022","10:59 AM"),
  (64,"estado","comentario","Ap #295-3256 Orci St.","Aug 11, 2022","3:20 AM"),
  (65,"estado","comentario","Ap #327-2216 A, Rd.","May 24, 2021","9:53 AM"),
  (66,"estado","comentario","729-8945 Habitant Avenue","Dec 28, 2022","9:03 PM"),
  (67,"estado","comentario","9694 Pharetra, Rd.","Aug 27, 2021","1:22 AM"),
  (68,"estado","comentario","281-6693 Laoreet, Rd.","Jan 28, 2023","12:34 AM"),
  (69,"estado","comentario","Ap #349-342 Ut Avenue","Jun 23, 2022","1:36 PM"),
  (70,"estado","comentario","Ap #937-3000 Semper St.","Jul 30, 2021","12:01 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (71,"estado","comentario","488-5083 Sapien, Rd.","Sep 15, 2022","4:23 PM"),
  (72,"estado","comentario","Ap #197-2186 Non Street","Dec 19, 2021","3:30 PM"),
  (73,"estado","comentario","Ap #545-7502 In Rd.","Sep 11, 2021","9:09 PM"),
  (74,"estado","comentario","879-1554 Id, St.","Nov 29, 2021","3:41 PM"),
  (75,"estado","comentario","669-5485 Eu Rd.","Feb 7, 2022","7:55 PM"),
  (76,"estado","comentario","431-6172 Neque St.","Sep 28, 2021","6:44 PM"),
  (77,"estado","comentario","Ap #829-5972 Interdum Av.","Dec 24, 2021","11:18 PM"),
  (78,"estado","comentario","Ap #588-3442 Eu Avenue","Jul 24, 2021","4:13 PM"),
  (79,"estado","comentario","563-9975 Pellentesque. St.","Aug 1, 2022","7:56 PM"),
  (80,"estado","comentario","P.O. Box 830, 3155 Purus. Rd.","Aug 25, 2021","9:12 AM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (81,"estado","comentario","572-861 Fermentum St.","Jul 27, 2021","12:52 PM"),
  (82,"estado","comentario","Ap #889-5711 Integer St.","Jan 20, 2022","8:02 AM"),
  (83,"estado","comentario","3474 Vitae, Rd.","Mar 23, 2023","8:20 AM"),
  (84,"estado","comentario","Ap #457-5706 Aliquet Road","Mar 17, 2022","5:27 AM"),
  (85,"estado","comentario","P.O. Box 302, 5982 Feugiat Street","Jan 9, 2022","11:46 PM"),
  (86,"estado","comentario","7190 Ridiculus Rd.","Aug 28, 2022","9:34 PM"),
  (87,"estado","comentario","557-3850 Tempor Road","Dec 20, 2022","12:15 AM"),
  (88,"estado","comentario","Ap #451-6113 Et Road","Jan 21, 2023","4:48 AM"),
  (89,"estado","comentario","8227 Vehicula. Ave","Mar 11, 2022","5:14 PM"),
  (90,"estado","comentario","Ap #858-5847 Erat Av.","Apr 4, 2023","1:18 AM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (91,"estado","comentario","Ap #344-2043 A, Road","Mar 18, 2023","5:38 AM"),
  (92,"estado","comentario","Ap #656-9630 Donec Rd.","Nov 30, 2022","5:57 PM"),
  (93,"estado","comentario","Ap #339-6862 Nunc Road","Jul 26, 2021","6:25 AM"),
  (94,"estado","comentario","805-8782 Vel Avenue","Apr 14, 2023","5:34 PM"),
  (95,"estado","comentario","P.O. Box 888, 8928 Nisl Rd.","Jul 14, 2021","3:54 PM"),
  (96,"estado","comentario","3858 Eu, St.","Apr 12, 2023","7:21 PM"),
  (97,"estado","comentario","6200 Pellentesque Av.","Jun 28, 2022","11:21 AM"),
  (98,"estado","comentario","6458 Odio, St.","Jul 10, 2022","9:20 AM"),
  (99,"estado","comentario","553-7361 Bibendum Rd.","Jan 26, 2022","4:03 AM"),
  (100,"estado","comentario","392-7622 Fringilla Av.","Mar 28, 2022","5:45 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (101,"estado","comentario","Ap #941-2285 Ipsum St.","Jan 30, 2022","6:28 AM"),
  (102,"estado","comentario","1739 Et, St.","Apr 18, 2023","1:16 AM"),
  (103,"estado","comentario","125-6843 Malesuada Road","Apr 4, 2023","4:53 AM"),
  (104,"estado","comentario","Ap #996-2932 Velit Rd.","Apr 13, 2022","4:08 PM"),
  (105,"estado","comentario","P.O. Box 828, 6846 Egestas Avenue","Jul 7, 2022","11:20 AM"),
  (106,"estado","comentario","Ap #605-3431 Ligula Street","Apr 5, 2022","5:20 AM"),
  (107,"estado","comentario","Ap #427-1084 Lorem, St.","Sep 29, 2021","2:23 PM"),
  (108,"estado","comentario","368-1919 Leo Av.","Mar 20, 2023","2:59 PM"),
  (109,"estado","comentario","Ap #231-4492 Magna. Road","May 17, 2021","5:27 AM"),
  (110,"estado","comentario","P.O. Box 552, 4997 Porttitor Ave","May 11, 2022","7:25 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (111,"estado","comentario","Ap #367-4215 Arcu Rd.","Oct 1, 2022","10:32 PM"),
  (112,"estado","comentario","6035 Ipsum Road","Sep 19, 2021","12:27 PM"),
  (113,"estado","comentario","P.O. Box 712, 2140 Dui. Road","Oct 29, 2021","6:09 AM"),
  (114,"estado","comentario","991-8394 Senectus Ave","Nov 27, 2021","6:03 PM"),
  (115,"estado","comentario","Ap #919-2923 Cursus St.","Mar 21, 2022","9:44 AM"),
  (116,"estado","comentario","3507 A, St.","May 26, 2022","1:05 AM"),
  (117,"estado","comentario","476-9577 Metus. Av.","Sep 13, 2022","11:29 AM"),
  (118,"estado","comentario","417-2212 Tellus, Avenue","Sep 28, 2022","1:24 AM"),
  (119,"estado","comentario","5154 Sed, St.","Feb 11, 2023","7:36 AM"),
  (120,"estado","comentario","Ap #857-6000 Aliquet Rd.","Mar 12, 2022","10:30 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (121,"estado","comentario","Ap #952-9709 Mattis. Road","Dec 11, 2022","7:22 AM"),
  (122,"estado","comentario","2322 Id Av.","Dec 4, 2021","11:30 AM"),
  (123,"estado","comentario","972-5662 Egestas. Rd.","Apr 20, 2022","7:38 PM"),
  (124,"estado","comentario","9539 Nunc Ave","Jun 12, 2022","8:17 PM"),
  (125,"estado","comentario","Ap #497-3124 Proin St.","May 13, 2022","3:51 PM"),
  (126,"estado","comentario","648-9881 Hymenaeos. St.","Dec 20, 2021","2:25 AM"),
  (127,"estado","comentario","5697 Scelerisque Av.","May 13, 2021","1:30 AM"),
  (128,"estado","comentario","Ap #442-4432 Enim, Street","Jan 18, 2022","3:03 AM"),
  (129,"estado","comentario","P.O. Box 580, 1584 Est, Road","Dec 14, 2021","9:21 PM"),
  (130,"estado","comentario","218-9136 Vestibulum Ave","Sep 10, 2021","9:28 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (131,"estado","comentario","914-2157 In Rd.","Nov 24, 2022","6:08 AM"),
  (132,"estado","comentario","913-8739 Senectus Rd.","May 26, 2021","8:51 AM"),
  (133,"estado","comentario","315-3441 Consequat Road","Dec 31, 2021","12:00 PM"),
  (134,"estado","comentario","617-5892 Cum Street","Feb 27, 2023","1:51 AM"),
  (135,"estado","comentario","468-6604 Aliquam Street","May 16, 2022","4:28 AM"),
  (136,"estado","comentario","662-6640 Egestas Ave","Apr 22, 2021","2:13 AM"),
  (137,"estado","comentario","298-457 Magna. Av.","May 8, 2022","2:14 AM"),
  (138,"estado","comentario","213 Mauris Rd.","Aug 30, 2022","7:06 AM"),
  (139,"estado","comentario","412-4833 Facilisis, Road","Jan 6, 2023","9:23 PM"),
  (140,"estado","comentario","414-8611 Risus St.","Feb 14, 2023","10:47 AM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (141,"estado","comentario","548-858 Condimentum Road","Oct 27, 2022","3:31 AM"),
  (142,"estado","comentario","8575 Aenean St.","Oct 6, 2021","5:34 PM"),
  (143,"estado","comentario","832-4403 Urna. Avenue","Aug 29, 2022","6:35 PM"),
  (144,"estado","comentario","7730 Dolor Road","Dec 6, 2021","11:40 PM"),
  (145,"estado","comentario","Ap #516-5563 Aliquet. St.","Sep 3, 2021","10:07 AM"),
  (146,"estado","comentario","177-9012 Nunc. Ave","Dec 24, 2021","1:35 PM"),
  (147,"estado","comentario","8595 In Ave","Apr 21, 2023","4:57 AM"),
  (148,"estado","comentario","584-7815 Quam Av.","Aug 12, 2022","7:23 AM"),
  (149,"estado","comentario","Ap #440-8563 Nulla Avenue","Mar 6, 2022","12:15 PM"),
  (150,"estado","comentario","258-8105 Vel, Ave","Aug 8, 2022","10:16 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (151,"estado","comentario","P.O. Box 897, 518 Nunc Av.","Jan 16, 2022","9:16 PM"),
  (152,"estado","comentario","Ap #120-3484 Velit St.","Nov 27, 2022","1:49 PM"),
  (153,"estado","comentario","900-5572 Mattis. Rd.","Feb 18, 2023","11:16 AM"),
  (154,"estado","comentario","378-5200 Malesuada Ave","May 31, 2022","10:29 AM"),
  (155,"estado","comentario","725-7443 Sit Av.","May 31, 2021","4:39 PM"),
  (156,"estado","comentario","812-8981 Non, Street","Jul 12, 2022","2:20 AM"),
  (157,"estado","comentario","Ap #325-2207 Et Avenue","May 24, 2021","7:47 PM"),
  (158,"estado","comentario","351-4737 Turpis Road","Oct 8, 2021","2:56 PM"),
  (159,"estado","comentario","9104 Nunc Rd.","Oct 19, 2021","4:01 PM"),
  (160,"estado","comentario","Ap #882-6125 Arcu. Road","Sep 16, 2021","2:55 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (161,"estado","comentario","399-3888 Massa. St.","Aug 4, 2022","7:04 PM"),
  (162,"estado","comentario","7116 Lectus, Avenue","Dec 25, 2022","10:47 AM"),
  (163,"estado","comentario","Ap #184-5223 Amet St.","Jul 15, 2021","7:03 AM"),
  (164,"estado","comentario","1017 Eleifend. Ave","Jun 25, 2021","1:41 PM"),
  (165,"estado","comentario","Ap #717-5385 Dapibus St.","Feb 19, 2023","2:16 PM"),
  (166,"estado","comentario","Ap #260-9147 Eget Road","Apr 1, 2023","5:09 PM"),
  (167,"estado","comentario","Ap #767-3799 Luctus Road","Mar 10, 2022","3:53 PM"),
  (168,"estado","comentario","Ap #173-3415 Eros Street","Jan 11, 2023","1:05 AM"),
  (169,"estado","comentario","Ap #358-5825 Nonummy Road","Dec 26, 2021","7:12 AM"),
  (170,"estado","comentario","976-4970 Netus St.","Nov 1, 2022","6:59 AM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (171,"estado","comentario","Ap #591-7877 Quisque Street","Aug 8, 2022","12:04 PM"),
  (172,"estado","comentario","549-1114 Ut Avenue","Nov 7, 2021","10:41 AM"),
  (173,"estado","comentario","877-1174 Ac, St.","May 22, 2022","6:12 AM"),
  (174,"estado","comentario","Ap #102-3479 Donec Rd.","Dec 4, 2022","10:20 AM"),
  (175,"estado","comentario","Ap #669-9345 Tellus. Av.","Oct 24, 2022","9:10 PM"),
  (176,"estado","comentario","313-7513 Nisi. Road","Jul 27, 2022","10:38 AM"),
  (177,"estado","comentario","Ap #703-5429 Eget, Avenue","Dec 4, 2022","3:00 AM"),
  (178,"estado","comentario","P.O. Box 993, 6445 Morbi Ave","Jul 5, 2022","3:40 PM"),
  (179,"estado","comentario","308-5443 Semper Av.","Apr 20, 2022","11:15 AM"),
  (180,"estado","comentario","750-380 Ac Rd.","Jul 26, 2022","5:34 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (181,"estado","comentario","5942 Gravida St.","Jan 4, 2023","8:21 AM"),
  (182,"estado","comentario","1840 Mauris Street","Mar 6, 2023","11:29 AM"),
  (183,"estado","comentario","Ap #757-9403 Eleifend, Rd.","Nov 21, 2022","8:22 AM"),
  (184,"estado","comentario","557-994 Quis Street","Dec 26, 2022","8:16 AM"),
  (185,"estado","comentario","6566 Mauris Rd.","Aug 6, 2022","7:49 PM"),
  (186,"estado","comentario","Ap #136-7411 Id Rd.","Jul 17, 2022","12:35 AM"),
  (187,"estado","comentario","470 Neque Ave","May 31, 2021","9:02 PM"),
  (188,"estado","comentario","6690 Magna. Avenue","Feb 10, 2022","4:02 PM"),
  (189,"estado","comentario","Ap #556-4899 Risus Ave","Jul 18, 2021","3:43 PM"),
  (190,"estado","comentario","413-8787 Tellus Rd.","Nov 10, 2022","1:53 PM");
INSERT INTO `Pedido` (`idPedido`,`estado`,`comentario`,`morada`,`dataSub`,`horaSub`)
VALUES
  (191,"estado","comentario","1791 Non St.","Feb 10, 2023","1:18 PM"),
  (192,"estado","comentario","982-7660 Elit Avenue","Jul 14, 2022","4:49 PM"),
  (193,"estado","comentario","305-2848 Dolor Rd.","Feb 1, 2022","1:57 AM"),
  (194,"estado","comentario","Ap #293-5094 Nascetur Av.","Apr 2, 2023","1:08 AM"),
  (195,"estado","comentario","286-6651 Nam Rd.","Nov 24, 2022","5:30 AM"),
  (196,"estado","comentario","1658 Dui Street","May 1, 2022","5:58 PM"),
  (197,"estado","comentario","9666 Dui Rd.","Jan 21, 2023","3:10 AM"),
  (198,"estado","comentario","201-6370 Velit. Ave","Aug 27, 2021","12:58 AM"),
  (199,"estado","comentario","1261 Convallis Av.","Mar 31, 2022","8:34 PM"),
  (200,"estado","comentario","891 Enim. St.","Oct 11, 2022","2:01 AM");*/


/* 100 Relações RestaurantePedidoPrato */

INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (11,127,45),
  (22,5,77),
  (22,92,80),
  (39,71,35),
  (5,172,41),
  (31,157,16),
  (6,79,33),
  (13,10,16),
  (7,195,12),
  (30,126,15);
/*INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (13,22,94),
  (7,154,56),
  (42,66,41),
  (4,11,44),
  (9,77,49),
  (48,148,67),
  (18,116,31),
  (21,115,94),
  (41,41,70),
  (5,97,28);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (27,136,34),
  (17,183,96),
  (20,115,30),
  (46,138,44),
  (17,195,17),
  (35,142,52),
  (25,122,66),
  (14,97,31),
  (20,47,41),
  (29,77,17);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (12,50,34),
  (48,135,47),
  (28,122,39),
  (14,27,19),
  (6,115,95),
  (38,89,67),
  (31,34,65),
  (31,150,98),
  (36,166,31),
  (24,137,17);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (45,1,17),
  (41,113,26),
  (36,175,33),
  (26,2,3),
  (4,26,58),
  (41,105,34),
  (42,101,5),
  (42,12,11),
  (6,118,41),
  (31,22,11);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (44,138,89),
  (12,142,2),
  (4,172,50),
  (37,104,95),
  (22,81,99),
  (41,189,98),
  (11,93,56),
  (20,19,22),
  (47,22,50),
  (44,190,44);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (44,107,39),
  (20,74,70),
  (42,14,19),
  (19,177,17),
  (49,63,20),
  (49,123,8),
  (19,110,66),
  (28,77,75),
  (29,88,52),
  (32,111,23);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (11,156,17),
  (50,102,23),
  (19,151,96),
  (49,21,77),
  (11,128,63),
  (43,160,35),
  (9,91,19),
  (2,60,47),
  (30,103,65),
  (47,126,47);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (38,96,79),
  (36,156,18),
  (16,134,4),
  (30,113,55),
  (30,151,54),
  (5,19,88),
  (44,48,71),
  (5,135,27),
  (15,65,35),
  (47,147,14);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (31,101,33),
  (23,40,59),
  (37,157,34),
  (8,162,47),
  (36,31,15),
  (38,113,97),
  (46,115,27),
  (27,50,100),
  (36,197,52),
  (23,75,99);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (27,104,96),
  (30,129,28),
  (39,47,90),
  (42,85,23),
  (14,44,81),
  (19,43,22),
  (35,141,39),
  (46,65,19),
  (16,91,60),
  (42,83,17);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (19,118,38),
  (13,70,48),
  (42,62,60),
  (15,131,78),
  (31,100,28),
  (7,178,62),
  (22,116,62),
  (46,50,39),
  (26,48,72),
  (4,27,83);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (39,93,86),
  (7,27,66),
  (33,134,8),
  (39,157,76),
  (23,116,73),
  (50,69,28),
  (3,84,97),
  (5,108,4),
  (21,147,95),
  (22,1,56);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (33,54,3),
  (11,185,66),
  (47,27,56),
  (43,172,70),
  (26,90,11),
  (24,57,80),
  (10,198,29),
  (11,172,17),
  (22,182,33),
  (25,88,27);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (4,67,55),
  (39,23,15),
  (50,127,14),
  (34,145,92),
  (2,96,51),
  (16,4,38),
  (33,166,19),
  (32,109,28),
  (44,53,72),
  (41,124,17);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (50,8,14),
  (42,44,17),
  (13,88,87),
  (49,37,26),
  (49,36,75),
  (23,83,57),
  (22,13,29),
  (32,127,15),
  (4,58,58),
  (15,170,29);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (18,85,20),
  (20,182,22),
  (12,145,31),
  (42,13,25),
  (19,83,97),
  (22,119,80),
  (13,97,9),
  (14,60,24),
  (46,7,16),
  (23,58,81);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (49,64,35),
  (33,164,12),
  (21,32,76),
  (30,183,84),
  (25,174,32),
  (25,151,63),
  (33,127,48),
  (16,6,89),
  (17,138,86),
  (37,144,77);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (17,6,20),
  (25,83,71),
  (12,106,37),
  (14,5,50),
  (11,116,32),
  (17,77,56),
  (38,199,83),
  (18,185,31),
  (16,114,66),
  (16,9,69);
INSERT INTO `RestaurantePedidoPrato` (`restaurante`,`pedido`,`prato`)
VALUES
  (15,31,26),
  (33,66,89),
  (30,89,61),
  (4,42,69),
  (17,155,10),
  (46,119,64),
  (5,63,31),
  (13,146,35),
  (48,73,21),
  (10,39,88);
*/


/* 50 Horários ---------------------------------------------------------------------------------------*/
INSERT INTO `Horario` (`idHorario`,`abertura`,`encerramento`)
VALUES
  (1,"7:24 AM","11:12 PM"),
  (2,"11:17 AM","6:15 PM"),
  (3,"5:48 AM","12:46 PM"),
  (4,"7:07 AM","7:39 PM"),
  (5,"6:20 AM","6:23 PM"),
  (6,"12:29 AM","3:24 PM"),
  (7,"12:53 AM","11:02 PM"),
  (8,"4:08 AM","9:28 PM"),
  (9,"6:28 AM","4:01 PM"),
  (10,"5:47 AM","4:07 PM");
/*INSERT INTO `Horario` (`idHorario`,`abertura`,`encerramento`)
VALUES
  (11,"2:19 AM","5:03 PM"),
  (12,"10:41 AM","5:48 PM"),
  (13,"1:26 AM","8:36 PM"),
  (14,"1:10 AM","1:48 PM"),
  (15,"2:50 AM","12:39 PM"),
  (16,"4:25 AM","12:21 PM"),
  (17,"9:48 AM","2:03 PM"),
  (18,"3:37 AM","8:58 PM"),
  (19,"3:15 AM","6:00 PM"),
  (20,"7:00 AM","12:37 PM");
INSERT INTO `Horario` (`idHorario`,`abertura`,`encerramento`)
VALUES
  (21,"6:12 AM","12:59 PM"),
  (22,"5:54 AM","11:01 PM"),
  (23,"1:25 AM","3:12 PM"),
  (24,"12:21 AM","9:52 PM"),
  (25,"11:44 AM","5:28 PM"),
  (26,"2:54 AM","3:31 PM"),
  (27,"9:07 AM","2:15 PM"),
  (28,"7:09 AM","2:02 PM"),
  (29,"5:48 AM","2:49 PM"),
  (30,"12:04 AM","4:25 PM");
INSERT INTO `Horario` (`idHorario`,`abertura`,`encerramento`)
VALUES
  (31,"9:51 AM","9:15 PM"),
  (32,"4:46 AM","7:49 PM"),
  (33,"11:48 AM","4:38 PM"),
  (34,"12:45 AM","5:32 PM"),
  (35,"5:08 AM","11:11 PM"),
  (36,"9:28 AM","10:53 PM"),
  (37,"10:18 AM","4:30 PM"),
  (38,"8:58 AM","4:31 PM"),
  (39,"8:48 AM","2:21 PM"),
  (40,"5:01 AM","10:19 PM");
INSERT INTO `Horario` (`idHorario`,`abertura`,`encerramento`)
VALUES
  (41,"1:11 AM","9:23 PM"),
  (42,"10:36 AM","12:07 PM"),
  (43,"12:43 AM","12:59 PM"),
  (44,"1:38 AM","12:00 PM"),
  (45,"3:18 AM","6:41 PM"),
  (46,"11:21 AM","11:57 PM"),
  (47,"7:54 AM","2:25 PM"),
  (48,"5:26 AM","11:37 PM"),
  (49,"4:29 AM","12:52 PM"),
  (50,"9:07 AM","2:05 PM");
*/


/** 50 Relações RestauranteHorario **/
INSERT INTO `RestauranteHorario` (`restaurante`,`horario`)
VALUES
  (46,24),
  (38,8),
  (28,28),
  (48,45),
  (11,25),
  (34,7),
  (21,41),
  (19,41),
  (8,4),
  (37,11);
/*INSERT INTO `RestauranteHorario` (`restaurante`,`horario`)
VALUES
  (23,5),
  (46,10),
  (29,8),
  (34,31),
  (44,3),
  (34,5),
  (10,40),
  (46,18),
  (49,12),
  (3,27);
INSERT INTO `RestauranteHorario` (`restaurante`,`horario`)
VALUES
  (21,6),
  (15,31),
  (7,35),
  (22,10),
  (29,36),
  (45,38),
  (15,14),
  (6,2),
  (12,4),
  (40,13);
INSERT INTO `RestauranteHorario` (`restaurante`,`horario`)
VALUES
  (10,30),
  (24,29),
  (4,22),
  (26,29),
  (8,39),
  (13,9),
  (2,13),
  (39,37),
  (35,6),
  (44,35);
INSERT INTO `RestauranteHorario` (`restaurante`,`horario`)
VALUES
  (12,27),
  (34,35),
  (41,17),
  (19,44),
  (27,40),
  (22,19),
  (30,48),
  (42,12),
  (35,15),
  (5,36);

*/
INSERT INTO `ClientePedido` (`idCliente`,`idPedido`)
VALUES
  (24,166),
  (35,23),
  (25,82),
  (27,32),
  (45,83),
  (6,63),
  (78,125),
  (83,149),
  (53,58),
  (57,136);
/*
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (74,14),
  (55,103),
  (77,30),
  (76,181),
  (99,80),
  (42,188),
  (9,89),
  (18,147),
  (40,64),
  (38,170);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (29,171),
  (75,86),
  (51,50),
  (96,51),
  (60,109),
  (8,50),
  (15,31),
  (6,108),
  (67,73),
  (63,91);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (48,180),
  (10,125),
  (59,37),
  (58,3),
  (14,154),
  (95,180),
  (67,158),
  (14,28),
  (49,67),
  (13,159);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (51,195),
  (84,198),
  (78,111),
  (86,152),
  (62,110),
  (99,8),
  (65,163),
  (50,184),
  (28,163),
  (67,156);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (2,49),
  (65,44),
  (100,26),
  (23,156),
  (55,79),
  (81,25),
  (74,109),
  (5,149),
  (57,19),
  (74,38);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (91,190),
  (57,35),
  (61,65),
  (65,45),
  (61,104),
  (97,12),
  (6,22),
  (8,10),
  (84,88),
  (71,66);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (36,136),
  (85,110),
  (64,182),
  (65,154),
  (57,10),
  (67,184),
  (9,5),
  (75,169),
  (91,197),
  (66,153);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (19,92),
  (24,186),
  (35,182),
  (80,88),
  (26,146),
  (99,162),
  (36,187),
  (73,155),
  (60,75),
  (20,109);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (67,18),
  (72,122),
  (9,24),
  (55,29),
  (37,167),
  (9,140),
  (18,169),
  (26,179),
  (90,159),
  (62,179);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (98,169),
  (63,9),
  (95,126),
  (90,154),
  (71,169),
  (70,167),
  (60,51),
  (50,192),
  (26,137),
  (80,128);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (41,59),
  (66,7),
  (42,112),
  (38,5),
  (27,76),
  (52,145),
  (61,61),
  (45,177),
  (52,189),
  (14,120);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (37,102),
  (57,177),
  (66,164),
  (73,139),
  (66,187),
  (63,44),
  (21,168),
  (34,149),
  (87,88),
  (68,26);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (100,153),
  (55,50),
  (78,134),
  (67,14),
  (34,167),
  (67,162),
  (30,124),
  (83,128),
  (80,28),
  (60,51);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (63,173),
  (12,105),
  (60,76),
  (43,50),
  (19,18),
  (65,66),
  (13,178),
  (52,44),
  (73,74),
  (80,147);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (35,87),
  (6,95),
  (17,44),
  (29,129),
  (35,143),
  (12,135),
  (17,179),
  (69,10),
  (38,31),
  (28,95);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (89,78),
  (48,186),
  (25,72),
  (89,182),
  (29,89),
  (38,121),
  (71,31),
  (29,56),
  (58,65),
  (5,64);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (2,152),
  (63,106),
  (15,186),
  (81,194),
  (11,47),
  (49,149),
  (63,17),
  (50,32),
  (39,100),
  (13,28);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (31,149),
  (46,100),
  (21,47),
  (90,97),
  (85,58),
  (76,76),
  (85,89),
  (6,77),
  (96,134),
  (96,107);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (53,112),
  (81,166),
  (36,45),
  (84,10),
  (100,87),
  (82,138),
  (91,183),
  (93,52),
  (45,188),
  (77,70);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (38,106),
  (68,199),
  (91,119),
  (65,126),
  (70,105),
  (73,53),
  (93,177),
  (54,191),
  (39,149),
  (63,11);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (81,83),
  (32,143),
  (78,59),
  (88,133),
  (9,44),
  (30,25),
  (31,137),
  (28,3),
  (68,39),
  (39,76);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (54,195),
  (89,131),
  (19,94),
  (33,91),
  (40,71),
  (50,2),
  (63,61),
  (12,184),
  (93,110),
  (67,138);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (58,50),
  (15,40),
  (73,113),
  (53,177),
  (79,98),
  (13,131),
  (99,52),
  (12,130),
  (53,195),
  (74,86);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (23,186),
  (12,132),
  (12,10),
  (88,169),
  (64,55),
  (26,13),
  (21,53),
  (46,74),
  (52,141),
  (97,5);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (39,167),
  (94,179),
  (60,80),
  (92,35),
  (72,177),
  (16,9),
  (26,79),
  (11,94),
  (32,14),
  (91,7);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (34,151),
  (28,142),
  (65,193),
  (46,147),
  (57,179),
  (70,154),
  (8,108),
  (96,200),
  (16,144),
  (37,153);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (53,158),
  (70,100),
  (50,192),
  (16,26),
  (37,178),
  (55,144),
  (41,128),
  (49,185),
  (93,74),
  (83,6);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (46,50),
  (67,129),
  (50,26),
  (1,30),
  (83,96),
  (57,175),
  (61,138),
  (1,3),
  (20,162),
  (39,50);
INSERT INTO `ClientePedido` (`cliente`,`pedido`)
VALUES
  (86,190),
  (12,67),
  (92,41),
  (51,174),
  (68,150),
  (10,137),
  (84,49),
  (93,172),
  (61,79),
  (79,160);
*/

INSERT INTO `Review` (`idCliente`,`idPedido`,`titulo`,`comentario`,`dataSub`,`horaSub`,`avaliacao`,`resposta`)
VALUES
  (1, 2, "Comida","Comida muito boa!","Oct 27, 2021","12:50 PM", 5, "Obrigado pela sua presença!"),
  (2, 3, "Comida muito salgada","Achei a minha pizza muito salgada.","Oct 26, 2021","13:24 PM", 3.5, "Obrigado pela sua opinião. Iremos fazer melhor da próxima vez!"),
  (3, 4, "Ótima comida","Têm de provar as pizzas, são divinais!","Sept 13, 2021","12:30 PM", 4.4, null),
  (4, 5, "Um pouco seco","Achei o pão um pouco seco. Poderia ser do calor que fazia no dia em que fui!","Dec 26, 2021","14:00 PM", 4, null),
  (5, 6, "Não há igual","Uma das melhores comidas que poderia haver!","Feb 06, 2021","13:00 PM", 5, null),
  (6, 7, "Massa","Experimentem a massa a carbonara. Não se iram arrepender!","Oct 27, 2021","12:50 PM", 4.2, null),
  (7, 8, "Bebidas","Achei que as bebidas pdoeriam estar um pouco mais frescas. Ainda por cima nos dias quentes de verão!","Jul 11, 2021","13:32 PM", 3, null),
  (8, 9, "Arroz de tamboril","Poderiam ter servido mais arroz!","Jun 23, 2021","12:59 PM", 3.5, null),
  (9, 10, "Mousse de chocolate","Uma das melhores que já provei! As pitadas de sal dão um toque especial.", "Aug 23, 2021","14:37 PM", 4.2, null),
  (10, 1, "Peixe","Muito bom!","Apr 09, 2021","13:17 PM", 3.9, null);
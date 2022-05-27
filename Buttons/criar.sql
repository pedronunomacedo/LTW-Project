DROP TABLE IF EXISTS Restaurante;

CREATE TABLE Restaurante(
    idRestaurante integer primary key,
    nome varchar(30) unique not null,
    morada integer unique not null,
    tipo varchar(30) not null
);

INSERT INTO `Restaurante` (`idRestaurante`,`nome`,`morada`,`tipo`)
VALUES
    (1,"Nome","197-1124 Elementum, Rd.","Tipo"),
    (2,"Nome","850-2661 Interdum. St.","Tipo"),
    (3,"Nome","Ap #686-5741 Ipsum Rd.","Tipo"),
    (4,"Nome","505-7922 Sit St.","Tipo"),
    (5,"Nome","Ap #333-6320 Vulputate, Road","Tipo"),
    (6,"Nome","Ap #175-3890 Curabitur Rd.","Tipo"),
    (7,"Nome","827-2876 Morbi Road","Tipo"),
    (8,"Nome","363-3617 Pellentesque Rd.","Tipo"),
    (9,"Nome","663-7670 Proin Avenue","Tipo"),
    (10,"Nome","728-6809 Purus St.","Tipo");

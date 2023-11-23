CREATE DATABASE banco;
create table banco (
id_Banco INT primary key auto_increment,
banco_emisor VARCHAR(50) NOT NULL,
Numero_Tarjeta INT NOT NULL,
Nip INT NOT NULL,
Cantidad INT NOT NULL
)

CREATE table cajero(
id_cajero INT primary key auto_increment,
Cantidad INT
)

CREATE table registro_transaccion (
id_trasaccion INT primary key auto_increment,
codigo VARCHAR(5),
registro_T VARCHAR(150)
)
create database InternationalLibrary
use InternationalLibrary

create table Book
(
	ISBN int primary key,
	Foto VARCHAR(100),
	Cantidad int,
	Titulo varchar(100),
	Autor varchar(100),
	FechaPublicacion date,
	Precio double ,
)
SELECT * FROM Book

INSERT INTO Book (ISBN, Foto, Cantidad, Titulo, Autor, FechaPublicacion, Precio)
values(123456789 , 'sddedede', 10, 'Harry Potter', 'Juan Macarron', '2024-02-17', 22.80);




create table FavoriteBook
(
	IdFav int identity primary key,
	correo varchar(100),
	ISBN int,
)

create table Buy
(
	IdClient int primary key,
	Nombre varchar(100), 
	Email varchar(100),
	País varchar(100),
	Provincia varchar(100),
	DirecciónEntrega varchar(100),
	CódigoPostal int,
	NúmeroTarjeta int,
	FechaExpiración date,
	CVV int,
)


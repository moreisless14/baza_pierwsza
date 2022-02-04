create database [morestore]
go

use morestore
go

CREATE TABLE Klient
(
    KlientId INT IDENTITY PRIMARY  KEY,
    Imie VARCHAR(128) NOT NULL,
    nazwisko VARCHAR(128) NOT NULL,
    Data_urodzenia DATE NOT NULL
	CONSTRAINT CHK_Klient CHECK (Data_urodzenia <getdate())
	
)

CREATE TABLE Produkt
(
    ProduktId INT IDENTITY PRIMARY KEY,
    Nazwa VARCHAR(128) NOT NULL,
    Cena decimal(10,2) NOT NULL,
    
	
)

ALTER TABLE Produkt
ADD  id_kategoria_producent int 

CREATE TABLE kategoria_producent
(
     id_kategoria_producent INT IDENTITY PRIMARY KEY,
    id_kategoria INT ,
    id_producent INT
    
)
CREATE TABLE kategoria
(
     id_kategoria INT IDENTITY PRIMARY KEY,
    nazwa_kategori varchar(45) NOT NULL
    
)
CREATE TABLE sub
(
    subId INT IDENTITY PRIMARY KEY,
    Imie VARCHAR(128) NOT NULL,
    nazwisko VARCHAR(128) NOT NULL,
    Data_urodzenia DATE NOT NULL
)
Drop Table sub


Create Table  Producent (
	id_producent INT IDENTITY PRIMARY KEY ,
   Nazwa varchar (30) NOT NULL ,
	Adres varchar (30)  not NULL ,
	Rok_wspolpracy date null,
	
	)

ALTER TABLE kategoria_producent
ADD FOREIGN KEY (id_kategoria) REFERENCES kategoria(id_kategoria)

ALTER TABLE kategoria_producent
ADD FOREIGN KEY (id_producent) REFERENCES producent(id_producent)

ALTER TABLE Produkt 
ADD FOREIGN KEY (id_kategoria_producent) REFERENCES kategoria_producent(id_kategoria_producent)

CREATE TABLE zamowienia 
(
    zamowieniaID INT IDENTITY PRIMARY KEY,
	KlientId int,
    data_zlozenia_zamowienia Datetime Null,
	data_przyjecia_zamowienia datetime not null,
    data_wysylki 	datetime null
	
)

ALTER TABLE zamowienia 
ADD FOREIGN KEY (KlientId) REFERENCES Klient (KlientId)

CREATE TABLE zamowienia_produktow
(
    ID_zamowienia_produktow INT IDENTITY PRIMARY KEY,
	zamowieniaID int,
	ProduktId int 
    
	
)
ALTER TABLE zamowienia_produktow
ADD FOREIGN KEY (zamowieniaID) REFERENCES zamowienia(zamowieniaID)
ALTER TABLE zamowienia_produktow
ADD FOREIGN KEY (ProduktId) REFERENCES Produkt(ProduktId)



SELECT * INTO Test1
from  Produkt  

drop table Test1


INSERT INTO Klient 
VALUES ('Jan', 'Kowalski','1982-12-01'), ('Kamil', 'Nowak','2000-10-10')

INSERT INTO Klient 
VALUES ('Paweł', 'Kamiński','2002-11-11'), ('Wiktor', 'Nowak','1987-12-01')

UPDATE Klient SET Imie='Zofia' WHERE nazwisko='Nowak'

INSERT INTO Klient 
VALUES ('Kamila', 'Stasiak','2000-10-01'), ('Dawid', 'Palka','2000-09-01')

delete from Klient where Imie = 'Zofia'

INSERT INTO Klient 
VALUES ('Adam', 'Brudka','1999-12-12'), ('Wiktor', 'Kowalowski','1998-12-01')


INSERT INTO kategoria
VALUES ('koszulka'), ('sukienka'), ('dodatki'), ('spodnie'), ('buty'), ('stroje_kąpielowe'), ('aktywności')

INSERT INTO zamowienia
VALUES (1, '2020-01-03 20:21:00','2020-01-04 08:01:00','2020-01-04 13:00:30')
INSERT INTO zamowienia
VALUES (3, '2020-10-03 12:21:00','2020-10-03 13:01:00','2020-01-04 13:10:30'),(6, '2021-01-03 12:21:00','2021-01-03 14:21:00','2020-01-04 14:10:30'),(5, '2021-03-03 22:21:00','2021-12-04 14:21:00','2021-03-04 14:10:30')
INSERT INTO zamowienia
VALUES (7, '2021-05-03 10:21:00','2021-10-03 11:01:00','2021-10-03 13:10:30'),(8, '2021-06-03 07:01:00','2021-06-03 09:21:00','2020-06-04 12:10:30')


INSERT INTO Producent
VALUES ('4f', 'Świętochłowice Sosnowa 12','2000-01-01'),('shein','Chorzów Piaskowa 34','2000-01-01')
INSERT INTO Producent
VALUES ('ryłko', 'WłocławekGrunwaldzka 34c','2000-01-01'),('big-star', 'Przemyśl Dworcowa 1a/2','2000-01-01')

INSERT INTO kategoria_producent
VALUES (1,1),(1,2),(1,4)
INSERT INTO kategoria_producent
VALUES (2,1),(2,2),(2,4)
INSERT INTO kategoria_producent
VALUES (3,1),(3,2),(3,3),(3,4)
INSERT INTO kategoria_producent
VALUES (4,1),(4,2),(4,4)
INSERT INTO kategoria_producent
VALUES (5,1),(5,2),(5,3),(5,4)
INSERT INTO kategoria_producent
VALUES (6,1),(6,2),(6,4)
INSERT INTO kategoria_producent
VALUES (7,1),(7,2)

INSERT INTO Produkt
VALUES ('stroj kapielowy monika', '66',19), ('koszulka neme ','35',3)
INSERT INTO Produkt
VALUES ('boho boo', '123',14), ('kolo ','325',18)
INSERT INTO Produkt
VALUES ('koko sukienka', '99',6), ('top uno','70',21)
INSERT INTO Produkt
VALUES ('kubeczek stella', '59',9), ('dywanik limited','70',8)

INSERT INTO zamowienia_produktow
VALUES (1,3), (1,8),(2,3),(3,7),(4,5),(6,8),(6,3)


select * from Klient
select *  from zamowienia_produktow
select * from Produkt


select Imie,nazwisko , DATEDIFF(yy,Data_urodzenia,'2008') as 'wiek  w roku 2008' 
from Klient
order by Data_urodzenia desc

select *
from zamowienia
where KlientId = 1 and data_przyjecia_zamowienia > '2000-01-01'



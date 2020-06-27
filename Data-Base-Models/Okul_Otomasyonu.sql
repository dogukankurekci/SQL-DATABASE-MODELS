CREATE TABLE Ogrenci(
	ogrenci_id int,
	ad varchar(30),
	soyad varchar(30),
	tc varchar(30),
	PRIMARY KEY (ogrenci_id),
)

CREATE TABLE Veli(
	veli_id int,
	ogrenci_id int,
	ad varchar(30),
	soyad varchar(30),
	tc varchar(30),
	mail varchar(30),
	telefon varchar(30),
	PRIMARY KEY (veli_id),
)

ALTER TABLE Veli
ADD CONSTRAINT VeliFK FOREIGN KEY (ogrenci_id) REFERENCES Ogrenci (ogrenci_id);

CREATE TABLE Ogretmen(
	ogretmen_id int,
	ad varchar(30),
	soyad varchar(30),
	mail varchar(30),
	PRIMARY KEY (ogretmen_id),
)

CREATE TABLE Sinif(
	sinif_id int,
	sube varchar(30),
	PRIMARY KEY (Sinif_id),
)

CREATE TABLE Ogretmen_Sinif(
	ogretmen_id int,
	sinif_id int,
	ogrenci_id int,
	PRIMARY KEY (ogretmen_id, sinif_id, ogrenci_id)
)

ALTER TABLE Ogretmen_Sinif
ADD CONSTRAINT Ogretmen_SinifFK1 FOREIGN KEY (ogretmen_id) REFERENCES Ogretmen (ogretmen_id);
ALTER TABLE Ogretmen_Sinif
ADD CONSTRAINT Ogretmen_SinifFK2 FOREIGN KEY (Sinif_id) REFERENCES Sinif (Sinif_id);
ALTER TABLE Ogretmen_Sinif
ADD CONSTRAINT Ogretmen_SinifFK3 FOREIGN KEY (ogrenci_id) REFERENCES Ogrenci (ogrenci_id);

CREATE TABLE Odemeler(
	ogrenci_id int,
	odememiktari int,
	PRIMARY KEY (ogrenci_id)
)

ALTER TABLE Odemeler
ADD CONSTRAINT OdemelerFK1 FOREIGN KEY (ogrenci_id) REFERENCES Ogrenci (ogrenci_id);


INSERT INTO Ogrenci(ogrenci_id, ad, soyad, tc) VALUES
(1,'gözde','konak','11111'),
(2,'gürol','taþlý','22222'),
(3,'idris','tuzcu','33333'),
(4,'dilþah','varol','44444'),
(5,'süreyya','bilge','55555'),
(6,'feyza','ay','66666'),
(7,'reþat','dayan','77777'),
(8,'sevgi','öz','88888'),
(9,'yetkin','besi','99999');

INSERT INTO Veli(veli_id, ogrenci_id, ad, soyad, tc, mail, telefon) VALUES
(1, 1, 'ahmet','konak','11110' ,'ahmet@mail.com','55511110'),
(2, 2, 'mehmet','taþlý','22220','mehmet@mail.com','55522220'),
(3, 3, 'ayþe','tuzcu','33330','ayþe@mail.com','55533330'),
(4, 4, 'fatma','varol','44440','fatma@mail.com','55544440'),
(5, 5, 'gizem','bilge','55550','gizem@mail.com','55555550'),
(6, 6, 'nurullah','ay','66660','nurullah@mail.com','55566660'),
(7, 7, 'gizem','dayan','77770','gizem@mail.com','55577770'),
(8, 8, 'idris','öz','88880','idris@mail.com110','55588880'),
(9, 9, 'raþo','besi','99990','raþo@mail.com','55599990');

INSERT INTO Ogretmen(ogretmen_id, ad, soyad, mail) VALUES
(1,'binnur','teke','teke@mail.com'),
(2,'sinan','sever','sinan@mail.com'),
(3,'erkin','kal','erkin@mail.com');

INSERT INTO Sinif(sinif_id, sube) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

INSERT INTO Ogretmen_Sinif(ogretmen_id, sinif_id, ogrenci_id) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(2, 2, 1),
(2, 2, 2),
(2, 2, 3),
(3, 3, 1),
(3, 3, 2),
(3, 3, 3);

INSERT INTO Odemeler(ogrenci_id, odememiktari) VALUES
(1, 50),
(2, 65),
(3, 25),
(4, 70),
(5, 80),
(6, 30),
(7, 85),
(8, 50),
(9, 0);

SELECT * FROM Ogrenci;
SELECT * FROM Veli;
SELECT * FROM Ogretmen;
SELECT * FROM Sinif;
SELECT * FROM Ogretmen_Sinif;
SELECT * FROM Odemeler;

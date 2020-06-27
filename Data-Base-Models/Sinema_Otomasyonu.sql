CREATE TABLE Filmler (
	filmId int,
	filmAdi varchar(30),
	filmTuru varchar(50),
	PRIMARY KEY (filmId)
);

CREATE TABLE Seans (
	seansId int,
	seansSaati varchar(20),
	filmId int,
	PRIMARY KEY (seansId)
);

ALTER TABLE Seans
	ADD CONSTRAINT apartmanFK FOREIGN KEY (filmId) REFERENCES Filmler (filmId);

CREATE TABLE Bilet (
	biletId int,
	isimSoyisim varchar(30),
	PNRNO varchar(11),
	seansId int,
	PRIMARY KEY (biletId)
);

ALTER TABLE Bilet
	ADD CONSTRAINT BiletFK FOREIGN KEY (seansId) REFERENCES Seans (seansId);

CREATE TABLE Bilet_Koltuk (
	biletId int,
	koltukNo int,
	PRIMARY KEY (biletId)
);

ALTER TABLE Bilet_Koltuk
	ADD CONSTRAINT Bilet_KoltukFK FOREIGN KEY (biletId) REFERENCES Bilet (biletId);

CREATE TABLE Bilet_Salon (
	biletId int,
	salonNo int,
	PRIMARY KEY (biletId)
);

ALTER TABLE Bilet_Salon
	ADD CONSTRAINT Bilet_SalonFK FOREIGN KEY (biletId) REFERENCES Bilet (biletId);

INSERT INTO Filmler (filmId, filmAdi, filmTuru) VALUES
(1, 'Terminatör', 'Aksiyon'),
(2, 'Wall-e', 'Animasyon'),
(3, '7. Koðuþtaki Mucize', 'Drama'),
(4, 'Testere', 'Korku');

INSERT INTO Seans (seansId, seansSaati, filmId) VALUES
(1, '10:00', 1),
(2, '12:00', 2),
(3, '14:00', 3),
(4, '16:00', 4);

INSERT INTO Bilet (biletId, isimSoyisim, PNRNO, seansId) VALUES
(1, 'FÝKRÝ ÇALIÞICI', 'PNR0001', 1),
(2, 'ÇAÐLAR ERYILMAZ', 'PNR0002', 2),
(3, 'AHMETCAN DAÞKAYA', 'PNR0003', 3),
(4, 'YAPRAK USLUBAÞ', 'PNR0004', 4),
(5, 'DAÐHAN AK', 'PNR0005', 2);

INSERT INTO Bilet_Koltuk (biletId, koltukNo) VALUES
(1, 15),
(2, 24),
(3, 12),
(4, 14),
(5, 36);

INSERT INTO Bilet_Salon (biletId, salonNo) VALUES
(1, 10),
(2, 20),
(3, 30),
(4, 40),
(5, 20);

SELECT * FROM Filmler;
SELECT * FROM Seans;
SELECT * FROM Bilet;
SELECT * FROM Bilet_Koltuk;
SELECT * FROM Bilet_Salon;

CREATE TABLE Bolum (
	BolumID int NOT NULL,
	BolumAdi varchar(30) NOT NULL,
	Aciklama varchar(50) DEFAULT NULL,
	Eposta varchar(30) DEFAULT NULL,
	PRIMARY KEY (BolumID)
);

CREATE TABLE Ders (
	DersID int NOT NULL,
	DersAdi varchar(30) NOT NULL,
	DersKodu varchar(50) DEFAULT NULL,
	BolumID int DEFAULT NULL,
	PRIMARY KEY (DersID)
);

ALTER TABLE Ders
	ADD CONSTRAINT Ders_FK1 FOREIGN KEY (BolumID) REFERENCES Bolum (BolumID);

CREATE TABLE Ogrenci (
	OgrenciNo int NOT NULL,
	Adi varchar(30)  NOT NULL,
	Soyadi varchar(30) DEFAULT NULL,
	DogumYeri varchar(50)DEFAULT NULL,
	BolumID int DEFAULT NULL,
	PRIMARY KEY (OgrenciNo)
);

ALTER TABLE Ogrenci
	ADD CONSTRAINT Ogrenci_FK1 FOREIGN KEY (BolumID) REFERENCES Bolum (BolumID);

CREATE TABLE Ogrenci_Ders (
	OgrenciNo int NOT NULL,
	DersID int NOT NULL,
	Notu float DEFAULT NULL,
	PRIMARY KEY (OgrenciNo,DersID),
);

ALTER TABLE Ogrenci_Ders
	ADD CONSTRAINT Ogrenci_Ders_FK1 FOREIGN KEY (OgrenciNo) REFERENCES Ogrenci (OgrenciNo);
ALTER TABLE Ogrenci_Ders
	ADD CONSTRAINT Ogrenci_Ders_FK2 FOREIGN KEY (DersID) REFERENCES Ders (DersID);

CREATE TABLE Ogretmen (
	OgretmenID int NOT NULL,
	Adi varchar(30)  NOT NULL,
	Soyadi varchar(30)  DEFAULT NULL,
	DogumYeri varchar(50)  DEFAULT NULL,
	BolumID int DEFAULT NULL,
	PRIMARY KEY (OgretmenID)
);

ALTER TABLE Ogretmen
	ADD CONSTRAINT Ogretmen_FK1 FOREIGN KEY (BolumID) REFERENCES Bolum (BolumID);

CREATE TABLE Ogretmen_Ders(
	OgretmenID int NOT NULL,
	DersID int NOT NULL,
	PRIMARY KEY (OgretmenID,DersID)
);

ALTER TABLE Ogretmen_Ders
	ADD CONSTRAINT Ogretmen_Ders_FK1 FOREIGN KEY (OgretmenID) REFERENCES Ogretmen (OgretmenID);
ALTER TABLE Ogretmen_Ders
	ADD CONSTRAINT Ogretmen_Ders_FK2 FOREIGN KEY (DersID) REFERENCES Ders (DersID);


INSERT INTO Bolum (BolumID, BolumAdi, Aciklama, Eposta) VALUES
(1, 'Sayýsal', 'Sayýsal Bölümü', 'hulya@gmail.com'),
(2, 'EþitAðýrlýk', 'EþitAðýrlýk Bölümü', 'erdal@gmail.com'),
(3, 'Sözel', 'Sözel Bölümü', 'serhat@gmail.com'),
(4, 'Dil', 'Dil Bölümü', 'tuncay@gmail.com');

INSERT INTO Ders (DersID, DersAdi, DersKodu, BolumID) VALUES
(1, 'Fizik', '10', 1),
(2, 'Matematik', '20', 2),
(3, 'Türkçe', '30', 3),
(4, 'Ýngilizce', '40', 4);

INSERT INTO Ogrenci (OgrenciNo, Adi, Soyadi, DogumYeri, BolumID) VALUES
(1, 'Mustafa', 'Arslan', 'Ýstanbul', 1),
(2, 'Tolga', 'Ataç', 'Ankara', 1),
(3, 'Leyla', 'Þahin', 'Ýzmir', 1),
(4, 'Gülay', 'Türkoðlu', 'Manisa', 2),
(5, 'Aziz', 'Keskin', 'Ýstanbul', 2),
(6, 'Simge', 'Þanlý', 'Ýzmir', 3),
(7, 'Kamuran', 'Bertan', 'Adana', 3),
(8, 'Turgut', 'Cemal', 'Bursa', 4),
(9, 'Öznur', 'Alan', 'Bolu', 4),
(10, 'Pelin', 'Tugay', 'Ýzmir', 4);

INSERT INTO Ogrenci_Ders (OgrenciNo, DersID, Notu) VALUES
(1, 1, 40),
(2, 1, 60),
(3, 1, 83),
(4, 2, 20),
(5, 2, 65),
(6, 3, 80),
(7, 3, 78),
(8, 4, 15),
(9, 4, 36),
(10, 4, 50);

INSERT INTO Ogretmen (OgretmenID, Adi, Soyadi, DogumYeri, BolumID) VALUES
(1, 'Hülya', 'Týnaz', 'Antalya', 1),
(2, 'Erdal', 'Avcý', 'Bolu', 2),
(3, 'Serhat', 'Bayhan', 'Ýstanbul', 3),
(4, 'Zehra', 'Tuncay', 'Amasya', 4);

INSERT INTO Ogretmen_Ders (OgretmenID, DersID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

SELECT * FROM Bolum;
SELECT * FROM Ders;
SELECT * FROM Ogrenci;
SELECT * FROM Ogretmen;
SELECT * FROM Ogrenci_Ders;
SELECT * FROM Ogretmen_Ders;

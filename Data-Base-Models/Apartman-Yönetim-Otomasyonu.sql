CREATE TABLE Yonetici (
	yoneticiId int,
	ad varchar(30),
	soyad varchar(50),
	telNo varchar(11),
	PRIMARY KEY (yoneticiId)
);

CREATE TABLE Apartman (
	apartmanId int,
	apartmanBlok varchar(50),
	katSayisi int,
	daireSayisi int,
	yoneticiId int,
	PRIMARY KEY (apartmanId)
);

ALTER TABLE Apartman
	ADD CONSTRAINT apartmanFK FOREIGN KEY (yoneticiId) REFERENCES Yonetici (yoneticiId);

CREATE TABLE Kiraci (
	kiraciId int,
	adSoyad varchar(30),
	telNo varchar(11),
	apartmanId int,
	PRIMARY KEY (kiraciId)
);

ALTER TABLE Kiraci
	ADD CONSTRAINT kiracýFK FOREIGN KEY (apartmanId) REFERENCES Apartman (apartmanId);

CREATE TABLE Kiracý_Aidat (
	kiraciId int,
	aidat int,
	PRIMARY KEY (kiraciId)
);

ALTER TABLE Kiracý_Aidat
	ADD CONSTRAINT Kiracý_AidatFK FOREIGN KEY (kiraciId) REFERENCES Kiraci (kiraciId);

CREATE TABLE Kiracý_Duyuru (
	kiraciId int,
	duyuru varchar(50),
	PRIMARY KEY (kiraciId)
);

ALTER TABLE Kiracý_Duyuru
	ADD CONSTRAINT Kiracý_DuyuruFK FOREIGN KEY (kiraciId) REFERENCES Kiraci (kiraciId);

INSERT INTO Yonetici (yoneticiId, ad, soyad, telNo) VALUES
(1, 'Ali', 'Kara', '05123456788'),
(2, 'Veli', 'Yýlmaz', '05983651111');

INSERT INTO Apartman (apartmanId, apartmanBlok, katSayisi, daireSayisi,yoneticiId) VALUES
(1, 'A blok', 2, 3, 1),
(2, 'B blok', 3, 2, 2);

INSERT INTO Kiraci (kiraciId, adSoyad, telNo, apartmanId) VALUES
(1, 'SAÝD POLAT', '05112223355', 1),
(2, 'ÞENAY DÜZGÜN', '05223536666', 1),
(3, 'ZEKERÝYA ALKURT', '05778889999', 1),
(4, 'EYYÜP AKASLAN', '05224448888', 2),
(5, 'TANER ÖZTÜRK', '05988887755', 2);

INSERT INTO Kiracý_Aidat (kiraciId, aidat) VALUES
(1, 40),
(2, 40),
(3, 40),
(4, 60),
(5, 60);

INSERT INTO Kiracý_Duyuru (kiraciId, duyuru) VALUES
(1, 'Kiraya zam yapýlacaktýr.'),
(2, 'Kiraya zam yapýlacaktýr.'),
(3, 'Kiraya zam yapýlacaktýr.'),
(4, 'Kiraya zam yapýlacaktýr.'),
(5, 'Kiraya zam yapýlacaktýr.');

SELECT * FROM Yonetici;
SELECT * FROM Apartman;
SELECT * FROM Kiraci;
SELECT * FROM Kiracý_Aidat;
SELECT * FROM Kiracý_Duyuru

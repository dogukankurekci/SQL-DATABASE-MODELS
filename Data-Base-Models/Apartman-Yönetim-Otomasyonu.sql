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
	ADD CONSTRAINT kirac�FK FOREIGN KEY (apartmanId) REFERENCES Apartman (apartmanId);

CREATE TABLE Kirac�_Aidat (
	kiraciId int,
	aidat int,
	PRIMARY KEY (kiraciId)
);

ALTER TABLE Kirac�_Aidat
	ADD CONSTRAINT Kirac�_AidatFK FOREIGN KEY (kiraciId) REFERENCES Kiraci (kiraciId);

CREATE TABLE Kirac�_Duyuru (
	kiraciId int,
	duyuru varchar(50),
	PRIMARY KEY (kiraciId)
);

ALTER TABLE Kirac�_Duyuru
	ADD CONSTRAINT Kirac�_DuyuruFK FOREIGN KEY (kiraciId) REFERENCES Kiraci (kiraciId);

INSERT INTO Yonetici (yoneticiId, ad, soyad, telNo) VALUES
(1, 'Ali', 'Kara', '05123456788'),
(2, 'Veli', 'Y�lmaz', '05983651111');

INSERT INTO Apartman (apartmanId, apartmanBlok, katSayisi, daireSayisi,yoneticiId) VALUES
(1, 'A blok', 2, 3, 1),
(2, 'B blok', 3, 2, 2);

INSERT INTO Kiraci (kiraciId, adSoyad, telNo, apartmanId) VALUES
(1, 'SA�D POLAT', '05112223355', 1),
(2, '�ENAY D�ZG�N', '05223536666', 1),
(3, 'ZEKER�YA ALKURT', '05778889999', 1),
(4, 'EYY�P AKASLAN', '05224448888', 2),
(5, 'TANER �ZT�RK', '05988887755', 2);

INSERT INTO Kirac�_Aidat (kiraciId, aidat) VALUES
(1, 40),
(2, 40),
(3, 40),
(4, 60),
(5, 60);

INSERT INTO Kirac�_Duyuru (kiraciId, duyuru) VALUES
(1, 'Kiraya zam yap�lacakt�r.'),
(2, 'Kiraya zam yap�lacakt�r.'),
(3, 'Kiraya zam yap�lacakt�r.'),
(4, 'Kiraya zam yap�lacakt�r.'),
(5, 'Kiraya zam yap�lacakt�r.');

SELECT * FROM Yonetici;
SELECT * FROM Apartman;
SELECT * FROM Kiraci;
SELECT * FROM Kirac�_Aidat;
SELECT * FROM Kirac�_Duyuru

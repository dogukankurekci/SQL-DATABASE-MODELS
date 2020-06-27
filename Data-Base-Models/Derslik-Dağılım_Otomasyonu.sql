CREATE TABLE Derslik (
	derslikId int,
	derslikIsmi varchar(30),
	maxKapasite varchar(3),
	PRIMARY KEY (derslikId)
);

CREATE TABLE Gun (
	gunId int,
	gunIsmý varchar(30),
	PRIMARY KEY (gunId)
);


CREATE TABLE Dersler (
	dersId int,
	dersIsmi varchar(20),
	PRIMARY KEY (dersId)
);

CREATE TABLE Derslik_Dagilim (
	ddId int,
	derslikId int,
	gunId int,
	dersId int,
	PRIMARY KEY (ddId)
);

ALTER TABLE Derslik_Dagilim
	ADD CONSTRAINT Derslik_Dagilim_FK1 FOREIGN KEY (derslikId) REFERENCES Derslik (derslikId);
ALTER TABLE Derslik_Dagilim
	ADD CONSTRAINT Derslik_Dagilim_FK2 FOREIGN KEY (gunId) REFERENCES Gun (gunId);
ALTER TABLE Derslik_Dagilim
	ADD CONSTRAINT Derslik_Dagilim_FK3 FOREIGN KEY (dersId) REFERENCES Dersler (dersId);


INSERT INTO Derslik (derslikId, derslikIsmi, maxKapasite) VALUES
(1, 'A-104', '50'),
(2, 'A-105', '60'),
(3, 'A-106', '70');

INSERT INTO Gun (gunID, gunIsmý) VALUES
(1, 'Pazartesi'),
(2, 'Salý'),
(3, 'Çarþamba'),
(4, 'Perþembe'),
(5, 'Cuma');

INSERT INTO Dersler (dersId, dersIsmi) VALUES
(1, 'Analiz'),
(2, 'Veri Tabaný'),
(3, 'Elektronik'),
(4, 'Biyokimya'),
(5, 'Soyut Matematik');

INSERT INTO Derslik_Dagilim (ddId, derslikId,gunId,dersId) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 1, 4, 4),
(5, 2, 5, 5);

SELECT * FROM Derslik;
SELECT * FROM Gun;
SELECT * FROM Dersler;
SELECT * FROM Derslik_Dagilim;

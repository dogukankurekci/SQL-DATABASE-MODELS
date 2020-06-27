create table Isciler (
	isci_id int,
	isim varchar(30),
	soyisim varchar(30),
	cinsiyet varchar(30),
	Primary Key (isci_id) 
);

create table Departman (
	departman_id int,
	isci_id int,
	departman_bilgi varchar(50),
	Primary Key (departman_id) 
);

ALTER TABLE Departman
ADD CONSTRAINT DepartmanFK FOREIGN KEY (isci_id) REFERENCES Isciler (isci_id);

create table Kart_Bilgileri (
	kb_id int,
	isci_id int,
	kartno varchar(50),
	Primary Key (kb_id) 
);

ALTER TABLE Kart_Bilgileri
ADD CONSTRAINT Kart_BilgileriFK FOREIGN KEY (isci_id) REFERENCES Isciler (isci_id);

create table Giris_Cýkýs (
	gc_id int,
	kb_id int,
	giris time,
	cýkýs time,
	Primary Key (gc_id) 
);

ALTER TABLE Giris_Cýkýs
ADD CONSTRAINT Giris_CýkýsFK FOREIGN KEY (kb_id) REFERENCES Kart_Bilgileri (kb_id);

create table Gelenler (
	gelen_id int,
	gc_id int,
	geldi int
);

ALTER TABLE Gelenler
ADD CONSTRAINT GelenlerFK FOREIGN KEY (gc_id) REFERENCES Giris_Cýkýs (gc_id);

create table Gelmeyenler (
	gelmeyen_id int,
	gc_id int,
	gelmedi int
);

ALTER TABLE Gelmeyenler
ADD CONSTRAINT GelmeyenlerFK FOREIGN KEY (gc_id) REFERENCES Giris_Cýkýs (gc_id);

Insert Into Isciler (isci_id, isim, soyisim, cinsiyet) values
(1, 'UMUTCAN' , 'ÖZCAN' , 'ERKEK'),
(2, 'HÜSEYÝN' , 'KOZANOÐLU' , 'ERKEK'),
(3, 'SU' , 'TURFAN' , 'KADIN'),
(4, 'SEVGÝ' , 'TÝLBE' , 'KADIN'),
(5, 'SELÝN' , 'GÜMÜÞCÜ' , 'KADIN'),
(6, 'YÜSRA' , 'BÜYÜK' , 'KADIN'),
(7, 'CEM' , 'ATAK' , 'ERKEK'),
(8, 'ÝHSAN' , 'TAÞ' , 'ERKEK'),
(9, 'ÖMÜR' , 'ÖZGÜL' , 'KADIN'),
(10, 'MÝNA' , 'DAYANÇ' , 'KADIN'),
(11, 'SALÝH' , 'TEK' , 'ERKEK'),
(12, 'AHMET' , 'KARA' , 'ERKEK');

Insert Into Departman (departman_id, isci_id, departman_bilgi) values
(1, 1, 'Pazarlama'),
(2, 2, 'Ýnsan Kaynaklarý'),
(3, 3, 'Pazarlama'),
(4, 4, 'Ýnsan Kaynaklarý'),
(5, 5, 'Ýnsan Kaynaklarý'),
(6, 6, 'Pazarlama'),
(7, 7, 'Ýnsan Kaynaklarý'),
(8, 8, 'Ýnsan Kaynaklarý'),
(9, 9, 'Pazarlama'),
(10, 10, 'Ýnsan Kaynaklarý'),
(11, 11, 'Pazarlama'),
(12, 12, 'Ýnsan Kaynaklarý');

Insert Into Kart_Bilgileri (kb_id, isci_id, kartno) values
(1, 1, '110'),
(2, 2, '220'),
(3, 3, '330'),
(4, 4, '440'),
(5, 5, '550'),
(6, 6, '660'),
(7, 7, '770'),
(8, 8, '880'),
(9, 9, '990'),
(10, 10, '1000'),
(11, 11, '1100'),
(12, 12, '1200');

Insert Into Giris_Cýkýs (gc_id, kb_id, giris, cýkýs) values
(1, 1, '09:00', '18:00'),
(2, 2, '09:00', '18:00'),
(3, 3, '09:00', '18:00'),
(4, 4, '09:00', '18:00'),
(5, 5, '09:00', '18:00'),
(6, 6, '09:00', '18:00'),
(7, 7, '09:00', '18:00'),
(8, 8, '09:00', '18:00'),
(9, 9, '09:00', '18:00'),
(10, 10, '09:00', '18:00'),
(11, 11, '09:00', '18:00'),
(12, 12, '09:00', '18:00');



Insert Into Gelenler (gelen_id, gc_id, geldi) values
(1, 5, 1),
(2, 3, 1),
(3, 7, 1),
(4, 11, 1),
(5, 9, 1);

Insert Into Gelmeyenler (gelmeyen_id, gc_id, gelmedi) values
(1, 2, 1),
(2, 1, 1),
(3, 4, 1),
(4, 6, 1),
(5, 8, 1),
(6, 10, 1),
(7, 12, 1);

SELECT * FROM Isciler;
SELECT * FROM Departman;
SELECT * FROM Kart_Bilgileri;
SELECT * FROM Giris_Cýkýs;
SELECT * FROM Gelenler;
SELECT * FROM Gelmeyenler;

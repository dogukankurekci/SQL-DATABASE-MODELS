CREATE TABLE Kutuphaneler(
	Kutuphane_ID int,
	Isim varchar(50),
	Adres varchar(1000),
	Telefon char(10),
	CONSTRAINT pkkey1 PRIMARY KEY (Kutuphane_ID)
);

CREATE TABLE Kitaplar(
	Kitap_ID int,
	KitapIsmi varchar(50),
	Aciklama varchar(Max),
	Yil datetime,
	CONSTRAINT pkkey2 PRIMARY KEY (Kitap_ID)
);

CREATE TABLE Yazarlar(
	Yazar_ID int,
	AdSoyad varchar(50),
	DogumTarih datetime,
	Cinsiyet bit,
	Adres varchar(500),
	CONSTRAINT pkkey3 PRIMARY KEY (Yazar_ID)
);

CREATE TABLE Uyeler(
	Uye_ID int,
	AdSoyad varchar(50),
	Cinsiyet bit,
	Adres varchar(500),
	CONSTRAINT pkkey4 PRIMARY KEY (Uye_ID)
);

CREATE TABLE Kutuphane_Kitap(
	KK_Kutuphane_ID int,
	KK_Kitap_ID int,
	CONSTRAINT fkkey1 FOREIGN KEY(KK_Kutuphane_ID) REFERENCES Kutuphaneler(Kutuphane_ID),
	CONSTRAINT fkkey2 FOREIGN KEY(KK_Kitap_ID) REFERENCES Kitaplar(Kitap_ID)
);

CREATE TABLE Kitap_Yazar(
	KY_Kitap_ID int,
	KY_Yazar_ID int,
	CONSTRAINT fkkey3 FOREIGN KEY(KY_Kitap_ID) REFERENCES Kitaplar(Kitap_ID),
	CONSTRAINT fkkey4 FOREIGN KEY(KY_Yazar_ID) REFERENCES Yazarlar(Yazar_ID)
);

CREATE TABLE Kutuphane_Uye(
	KU_Kutuphane_ID int,
	KU_Uye_ID int,
	CONSTRAINT fkkey5 FOREIGN KEY(KU_Kutuphane_ID) REFERENCES Kutuphaneler(Kutuphane_ID),
	CONSTRAINT fkkey6 FOREIGN KEY(KU_Uye_ID) REFERENCES Uyeler(Uye_ID)
);

INSERT INTO Kutuphaneler(Kutuphane_ID, Isim, Adres, Telefon) VALUES 
(1,'Beyazit Devlet K�t�phanesi','Beyaz�t, �ad�rc�lar Cd. No:4, 34126 Fatih/�stanbul','2125223167');
INSERT INTO Kutuphaneler(Kutuphane_ID, Isim, Adres, Telefon) VALUES 
(2,'�zmir Milli K�t�phane','Konak, Milli K�t�phane Cd. 39-1, 35250 Konak/�zmir','2324842002');
INSERT INTO Kutuphaneler(Kutuphane_ID, Isim, Adres, Telefon) VALUES 
(3,'Kad�n Eserleri K�t�phanesi','Balat, Kadir Has Kav�a�� No:8, 34083 Fatih/�stanbul','2125349550');
INSERT INTO Kutuphaneler(Kutuphane_ID, Isim, Adres, Telefon) VALUES 
(4,'�nebey Yazma Eser K�t�phanesi','Tahtakale Mah., �nebey Cad. �nebey Sok. No:5, 16040 Osmangazi/Bursa','2242227214');

DELETE FROM Kutuphaneler WHERE Kutuphane_ID = 4;

INSERT INTO Kitaplar(Kitap_ID, KitapIsmi, Aciklama, Yil) VALUES 
(1,'�ki �ehrin Hikayesi','200 milyonun �zerindeki sat��� ile t�m zamanlar�n en me�hur edebiyat eserleri aras�ndad�r','1859-4-30');
INSERT INTO Kitaplar(Kitap_ID, KitapIsmi, Aciklama, Yil) VALUES 
(2,'Notre Dame�n Kamburu','Okunmas� gereken evrenselle�mi� ve d�nya klasiklerinin ba�yap�tlardand�r.','1831-1-1');
INSERT INTO Kitaplar(Kitap_ID, KitapIsmi, Aciklama, Yil) VALUES 
(3,'Gurur ve �nyarg�','Bir �ok film ve dizi haline getirilmi�tir','1796-1-1');

INSERT INTO Kutuphane_Kitap(KK_Kutuphane_ID, KK_Kitap_ID) VALUES 
(1, 1);
INSERT INTO Kutuphane_Kitap(KK_Kutuphane_ID, KK_Kitap_ID) VALUES 
(2, 1);

INSERT INTO Yazarlar(Yazar_ID, AdSoyad, DogumTarih, Cinsiyet, Adres) VALUES 
(1,'Charles Dickens','1812-6-9',(0),'�ngiltere');
INSERT INTO Yazarlar(Yazar_ID, AdSoyad, DogumTarih, Cinsiyet, Adres) VALUES 
(2,'Victor Hugo','1802-2-26',(0),'Fransa');
INSERT INTO Yazarlar(Yazar_ID, AdSoyad, DogumTarih, Cinsiyet, Adres) VALUES 
(3,'Jane Austen','1775-12-16',(1),'�ngiltere');

INSERT INTO Kitap_Yazar(KY_Kitap_ID, KY_Yazar_ID) VALUES 
(1, 1);
INSERT INTO Kitap_Yazar(KY_Kitap_ID, KY_Yazar_ID) VALUES 
(2, 1);

INSERT INTO Uyeler(Uye_ID, AdSoyad, Cinsiyet, Adres) VALUES 
(1,'Do�ukan K�rek�i',(0),'Antalya');
INSERT INTO Uyeler(Uye_ID, AdSoyad, Cinsiyet, Adres) VALUES 
(2,'Nurullah Ayaz',(0),'Manisa');
INSERT INTO Uyeler(Uye_ID, AdSoyad, Cinsiyet, Adres) VALUES 
(3,'Ra�it K�m�rc�',(0),'Konya');

INSERT INTO Kutuphane_Uye(KU_Kutuphane_ID, KU_Uye_ID) VALUES 
(1, 1);
INSERT INTO Kutuphane_Uye(KU_Kutuphane_ID, KU_Uye_ID) VALUES 
(2, 1);


SELECT * FROM Kutuphaneler;
SELECT * FROM Kitaplar;
SELECT * FROM Yazarlar;
SELECT * FROM Uyeler;

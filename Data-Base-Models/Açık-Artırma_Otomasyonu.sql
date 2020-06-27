CREATE TABLE URUN_KATEGOR�S�(
UK_ID INT,
isim VARCHAR(50),
aciklama VARCHAR(500),
PRIMARY KEY (UK_ID)
);

CREATE TABLE URUN_DURUMU(
UD_ID INT,
isim VARCHAR(50),
aciklama VARCHAR(500),
PRIMARY KEY (UD_ID)
);

CREATE TABLE SATICILAR(
saticilar_ID INT,
detaylar VARCHAR(500),
PRIMARY KEY (saticilar_ID)
);

CREATE TABLE ACIK_ARTIRMA_OGELERI(
AAO_ID INT,
UK_ID INT,
UD_ID INT,
saticilar_ID INT,
urun_ismi VARCHAR(50),
istenen_fiyat INT,
satis_fiyati INT,
urun_aciklama VARCHAR(500),
sunulan_tarih DATETIME,
sat�lan_tarih DATETIME
PRIMARY KEY (AAO_ID)
);

ALTER TABLE ACIK_ARTIRMA_OGELERI
ADD CONSTRAINT ACIK_ARTIRMA_OGELERI_FK1 FOREIGN KEY (UK_ID) REFERENCES URUN_KATEGOR�S� (UK_ID);

ALTER TABLE ACIK_ARTIRMA_OGELERI
ADD CONSTRAINT ACIK_ARTIRMA_OGELERI_FK2 FOREIGN KEY (UD_ID) REFERENCES URUN_DURUMU (UD_ID);

ALTER TABLE ACIK_ARTIRMA_OGELERI
ADD CONSTRAINT ACIK_ARTIRMA_OGELERI_FK3 FOREIGN KEY (saticilar_ID) REFERENCES SATICILAR (saticilar_ID);

CREATE TABLE TEKLIFCI(
teklifci_ID INT,
bilgiler VARCHAR(500),
PRIMARY KEY (teklifci_ID)
);

CREATE TABLE TEKLIF(
teklif_ID INT,
teklifci_ID INT,
AAO_ID INT,
teklif_tarihi DATETIME,
teklifin_degeri INT,
PRIMARY KEY (teklif_ID)
);

ALTER TABLE TEKLIF
ADD CONSTRAINT TEKLIF_FK1 FOREIGN KEY (teklifci_ID) REFERENCES TEKLIFCI (teklifci_ID);

ALTER TABLE TEKLIF
ADD CONSTRAINT TEKLIF_FK2 FOREIGN KEY (AAO_ID) REFERENCES ACIK_ARTIRMA_OGELERI (AAO_ID);

CREATE TABLE GONDERILER(
gonderi_ID INT,
teklif_ID INT,
detaylar VARCHAR(500),
PRIMARY KEY (gonderi_ID)
);

ALTER TABLE GONDERILER
ADD CONSTRAINT GONDERILER_FK1 FOREIGN KEY (teklif_ID) REFERENCES TEKLIF (teklif_ID);

CREATE TABLE URUN_PAKETLERI(
UP_ID INT,
teklif_ID INT,
AAO_ID INT,
PRIMARY KEY (UP_ID)
);

ALTER TABLE URUN_PAKETLERI
ADD CONSTRAINT URUN_PAKETLERI_FK1 FOREIGN KEY (teklif_ID) REFERENCES TEKLIF (teklif_ID);

ALTER TABLE URUN_PAKETLERI
ADD CONSTRAINT URUN_PAKETLERI_FK2 FOREIGN KEY (AAO_ID) REFERENCES ACIK_ARTIRMA_OGELERI (AAO_ID);

INSERT INTO URUN_KATEGOR�S�(UK_ID, isim, aciklama) VALUES
(1,'Mobil cihazlar','Telefon, tablet vb. �r�nler'),
(2,'Otomobil','2.El terk edilmi� ara�lar'),
(3,'Ev E�yas�','Eskilerden kalma ev e�yalar�'),
(4,'Arsa','Arazi, tarla vb. sat��lar�'),
(5,'Tak�','Kolye, bilezik vb. �r�nler');

INSERT INTO URUN_DURUMU(UD_ID, isim, aciklama) VALUES
(1,'Telefon','Apple marka telefon'),
(2,'Tablet','Samsung marka tablet'),
(3,'Ak�ll� Saat','Apple marka saat'),
(4,'Opel Corsa','2016 model araba'),
(5,'Ford Mondeo','2002 model araba'),
(6,'Avize','80 y�ll�k'),
(7,'Vazo','150 y�ll�k'),
(8,'Tablo','65 y�ll�k'),
(9,'Tarla','5 d�n�m'),
(10,'Y�z�k','5 ta�');

INSERT INTO SATICILAR(saticilar_ID, detaylar) VALUES
(1,'Mobil cihazlar satan'),
(2,'Otomobil  satan'),
(3,'Ev E�yas�  satan'),
(4,'Arsa  satan'),
(5,'Tak�  satan');

INSERT INTO ACIK_ARTIRMA_OGELERI(AAO_ID, UK_ID, UD_ID, saticilar_ID, urun_ismi, istenen_fiyat, satis_fiyati, urun_aciklama, sunulan_tarih, sat�lan_tarih) VALUES
(1, 1, 1, 1, 'Telefon', 3000, 4000, 'Apple marka telefon', '2020-6-24', '2020-7-1'),
(2, 1, 2, 1, 'Tablet', 1000, 1500, 'Samsung marka tablet', '2020-6-25', '2020-7-2'),
(3, 1, 3, 1, 'Ak�ll� Saat', 2500, 3000, 'Apple marka saat', '2020-6-26', '2020-7-3'),
(4, 2, 4, 2, 'Opel Corsa', 25000, 26000, '2016 model araba', '2020-6-15', '2020-6-27'),
(5, 2, 5, 2, 'Ford Mondeo', 15000, 17000, '2002 model araba', '2020-6-18', '2020-6-25'),
(6, 3, 6, 3, 'Avize', 500, 1700, '80 y�ll�k', '2020-6-24', '2020-6-29'),
(7, 3, 7, 3, 'Vazo', 2300, 5000, '150 y�ll�k', '2020-6-24', '2020-6-29'),
(8, 3, 8, 3, 'Tablo', 4050, 6300, '65 y�ll�k', '2020-6-24', '2020-6-29'),
(9, 4, 9, 4, 'Tarla', 25000, 30000, '5 d�n�m', '2020-7-13', '2020-7-25'),
(10, 5, 10, 5, 'Y�z�k', 2200, 4050, '5 ta�', '2020-6-23', '2020-7-19');

INSERT INTO TEKLIFCI(teklifci_ID, bilgiler) VALUES
(1,'Asl� Sar�'),
(2,'Nil Usta'),
(3,'Halil S�zen'),
(4,'Azim R�zgar'),
(5,'G�ne� Yak�n'),
(6,'Ali ���t'),
(7,'Tu��e Er'),
(8,'Tuncay Ay'),
(9,'Mehmet Kaya'),
(10,'Murat demir');

INSERT INTO TEKLIF(teklif_ID, teklifci_ID, AAO_ID, teklif_tarihi, teklifin_degeri) VALUES
(1, 1, 1, '2020-7-1', 4000),
(2, 2, 2, '2020-7-2', 1500),
(3, 3, 3, '2020-7-3', 3000),
(4, 4, 4, '2020-6-27', 26000),
(5, 5, 5, '2020-6-25', 17000),
(6, 6, 6, '2020-6-29', 1700),
(7, 7, 7, '2020-6-29', 5000),
(8, 8, 8, '2020-6-29', 6300),
(9, 9, 9, '2020-7-25', 30000),
(10, 10, 10, '2020-7-19', 4050);

INSERT INTO GONDERILER(gonderi_ID, teklif_ID, detaylar) VALUES
(1, 1, '�letildi'),
(2, 2, '�letildi'),
(3, 3, '�letildi'),
(4, 4, '�letildi'),
(5, 5, '�letildi'),
(6, 6, '�letildi'),
(7, 7, '�letildi'),
(8, 8, '�letildi'),
(9, 9, '�letildi'),
(10, 10, '�letildi');

INSERT INTO URUN_PAKETLERI(UP_ID, teklif_ID, AAO_ID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

SELECT * FROM URUN_KATEGOR�S�;
SELECT * FROM URUN_DURUMU;
SELECT * FROM SATICILAR;
SELECT * FROM ACIK_ARTIRMA_OGELERI;
SELECT * FROM TEKLIFCI;
SELECT * FROM TEKLIF;
SELECT * FROM GONDERILER;
SELECT * FROM URUN_PAKETLERI;

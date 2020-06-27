CREATE TABLE MUSTERÝLER(
Musteri_ID INT,
Isim VARCHAR(30),
Soyisim VARCHAR(30),
Mail VARCHAR(50),
Telefon_No VARCHAR(30),
Ulke VARCHAR(30),
Sehir VARCHAR(30),
Ilce VARCHAR(30),
PRIMARY KEY (Musteri_ID)
);

CREATE TABLE SIPARISLER(
Siparis_ID INT,
Musteri_ID INT,
Siparis_Tarihi DATETIME,
PRIMARY KEY (Siparis_ID)
);

ALTER TABLE SIPARISLER
ADD CONSTRAINT SIPARISLER_FK FOREIGN KEY (Musteri_ID) REFERENCES MUSTERÝLER (Musteri_ID);

CREATE TABLE ODEME_YONTEMI(
Odeme_Yontemi_ID INT,
Musteri_ID INT,
Kredi_Kartý_No INT,
PRIMARY KEY (Odeme_Yontemi_ID)
);

ALTER TABLE ODEME_YONTEMI
ADD CONSTRAINT ODEME_YONTEMI_FK FOREIGN KEY (Musteri_ID) REFERENCES MUSTERÝLER (Musteri_ID);

CREATE TABLE FATURALAR(
Fatura_Numarasi_ID INT,
Siparis_ID INT,
Fatura_Tarihi DATETIME,
Fatura_Ayrintilari VARCHAR(100),
PRIMARY KEY (Fatura_Numarasi_ID)
);

ALTER TABLE FATURALAR
ADD CONSTRAINT FATURALAR_FK FOREIGN KEY (Siparis_ID) REFERENCES SIPARISLER (Siparis_ID);

CREATE TABLE ODEMELER(
Odeme_ID INT,
Fatura_Numarasi_ID INT,
Odeme_Tarihi DATETIME,
Odeme_Mýiktarý INT,
PRIMARY KEY (Odeme_ID)
);

ALTER TABLE ODEMELER
ADD CONSTRAINT ODEMELER_FK FOREIGN KEY (Fatura_Numarasi_ID) REFERENCES FATURALAR (Fatura_Numarasi_ID);

CREATE TABLE GONDERILER(
Gonderi_ID INT,
Siparis_ID INT,
Fatura_Numarasi_ID INT,
Gonderi_Takip_No INT,
Gonderi_Tarihi DATETIME,
PRIMARY KEY (Gonderi_ID)
);

ALTER TABLE GONDERILER
ADD CONSTRAINT GONDERILER_FK1 FOREIGN KEY (Siparis_ID) REFERENCES SIPARISLER (Siparis_ID);
ALTER TABLE GONDERILER
ADD CONSTRAINT GONDERILER_FK2 FOREIGN KEY (Fatura_Numarasi_ID) REFERENCES FATURALAR (Fatura_Numarasi_ID);

CREATE TABLE URUNLER(
Urün_ID INT,
Urün_Isim VARCHAR(30),
Urün_Fiyat INT,
Urün_Aciklama VARCHAR(30),
PRIMARY KEY (Urün_ID)
);

CREATE TABLE SIPARIS_OGELERI(
Siparis_Oge_ID INT,
Urün_ID INT,
Siparis_ID INT,
Siparis_Oge_Fiyati INT,
Siparis_Oge_Miktarý INT,
PRIMARY KEY (Siparis_Oge_ID)
);

ALTER TABLE SIPARIS_OGELERI
ADD CONSTRAINT SIPARIS_OGELERI_FK1 FOREIGN KEY (Urün_ID) REFERENCES URUNLER (Urün_ID);
ALTER TABLE SIPARIS_OGELERI
ADD CONSTRAINT SIPARIS_OGELERI_FK2 FOREIGN KEY (Siparis_ID) REFERENCES SIPARISLER (Siparis_ID);

CREATE TABLE GONDERI_OGELERI(
Gonderi_ID INT,
Siparis_Oge_ID INT,
PRIMARY KEY (Gonderi_ID,Siparis_Oge_ID)
);

ALTER TABLE GONDERI_OGELERI
ADD CONSTRAINT GONDERI_OGELERI_FK1 FOREIGN KEY (Gonderi_ID) REFERENCES GONDERILER (Gonderi_ID);
ALTER TABLE GONDERI_OGELERI
ADD CONSTRAINT GONDERI_OGELERI_FK2 FOREIGN KEY (Siparis_Oge_ID) REFERENCES SIPARIS_OGELERI (Siparis_Oge_ID);


INSERT INTO MUSTERÝLER(Musteri_ID, Isim, Soyisim, Mail, Telefon_No, Ulke, Sehir, Ilce) VALUES
(1,'Ahmet','Kara','ahmetkara@mail.com', '05551115555', 'Türkiye', 'Ýstanbul', 'Kadýköy');

INSERT INTO MUSTERÝLER(Musteri_ID, Isim, Soyisim, Mail, Telefon_No, Ulke, Sehir, Ilce) VALUES
(2,'Fatma','Yýlmaz','fatmayýlmaz@mail.com', '05552225555', 'Türkiye', 'Antalya', 'Kepez');

INSERT INTO MUSTERÝLER(Musteri_ID, Isim, Soyisim, Mail, Telefon_No, Ulke, Sehir, Ilce) VALUES
(3,'Selin','Kaya','selinkaya@mail.com', '05553335555', 'Türkiye', 'Ýstanbul', 'Beylikdüzü');



INSERT INTO SIPARISLER(Siparis_ID, Musteri_ID, Siparis_Tarihi) VALUES
(1, 1, '2020-5-25');

INSERT INTO SIPARISLER(Siparis_ID, Musteri_ID, Siparis_Tarihi) VALUES
(2, 2, '2020-5-15');

INSERT INTO SIPARISLER(Siparis_ID, Musteri_ID, Siparis_Tarihi) VALUES
(3, 3, '2020-5-03');

INSERT INTO SIPARISLER(Siparis_ID, Musteri_ID, Siparis_Tarihi) VALUES
(4, 1, '2020-5-17');



INSERT INTO ODEME_YONTEMI(Odeme_Yontemi_ID, Musteri_ID, Kredi_Kartý_No) VALUES
(1, 1, 123);

INSERT INTO ODEME_YONTEMI(Odeme_Yontemi_ID, Musteri_ID, Kredi_Kartý_No) VALUES
(2, 2, 456);

INSERT INTO ODEME_YONTEMI(Odeme_Yontemi_ID, Musteri_ID, Kredi_Kartý_No) VALUES
(3, 3, 789);



INSERT INTO FATURALAR(Fatura_Numarasi_ID, Siparis_ID, Fatura_Tarihi, Fatura_Ayrintilari) VALUES
(1, 1, '2020-5-25', 'Tek çekim');

INSERT INTO FATURALAR(Fatura_Numarasi_ID, Siparis_ID, Fatura_Tarihi, Fatura_Ayrintilari) VALUES
(2, 2, '2020-5-15', 'Tek çekim');

INSERT INTO FATURALAR(Fatura_Numarasi_ID, Siparis_ID, Fatura_Tarihi, Fatura_Ayrintilari) VALUES
(3, 3, '2020-5-03', 'Tek çekim');

INSERT INTO FATURALAR(Fatura_Numarasi_ID, Siparis_ID, Fatura_Tarihi, Fatura_Ayrintilari) VALUES
(4, 4, '2020-5-17', 'Tek çekim');



INSERT INTO ODEMELER(Odeme_ID, Fatura_Numarasi_ID, Odeme_Tarihi, Odeme_Mýiktarý) VALUES
(1, 1, '2020-5-25', 125);

INSERT INTO ODEMELER(Odeme_ID, Fatura_Numarasi_ID, Odeme_Tarihi, Odeme_Mýiktarý) VALUES
(2, 2, '2020-5-15', 50);

INSERT INTO ODEMELER(Odeme_ID, Fatura_Numarasi_ID, Odeme_Tarihi, Odeme_Mýiktarý) VALUES
(3, 3, '2020-5-03', 45);

INSERT INTO ODEMELER(Odeme_ID, Fatura_Numarasi_ID, Odeme_Tarihi, Odeme_Mýiktarý) VALUES
(4, 4, '2020-5-17', 250);



INSERT INTO GONDERILER(Gonderi_ID, Siparis_ID, Fatura_Numarasi_ID, Gonderi_Takip_No, Gonderi_Tarihi) VALUES
(1, 1, 1, 101, '2020-6-02');

INSERT INTO GONDERILER(Gonderi_ID, Siparis_ID, Fatura_Numarasi_ID, Gonderi_Takip_No, Gonderi_Tarihi) VALUES
(2, 2, 2, 202, '2020-5-22');

INSERT INTO GONDERILER(Gonderi_ID, Siparis_ID, Fatura_Numarasi_ID, Gonderi_Takip_No, Gonderi_Tarihi) VALUES
(3, 3, 3, 303, '2020-5-10');

INSERT INTO GONDERILER(Gonderi_ID, Siparis_ID, Fatura_Numarasi_ID, Gonderi_Takip_No, Gonderi_Tarihi) VALUES
(4, 4, 4, 404, '2020-5-30');


INSERT INTO URUNLER(Urün_ID, Urün_Isim, Urün_Fiyat, Urün_Aciklama) VALUES
(1, 'Telefon', 125, 'Teknoloji ürünleri');

INSERT INTO URUNLER(Urün_ID, Urün_Isim, Urün_Fiyat, Urün_Aciklama) VALUES
(2, 'Masa', 50, 'Ev ürünleri');

INSERT INTO URUNLER(Urün_ID, Urün_Isim, Urün_Fiyat, Urün_Aciklama) VALUES
(3, 'Pantolon', 45, 'Kýyafet ürünleri');



INSERT INTO SIPARIS_OGELERI(Siparis_Oge_ID, Urün_ID, Siparis_ID, Siparis_Oge_Fiyati, Siparis_Oge_Miktarý) VALUES
(1, 1, 1, 125, 1);

INSERT INTO SIPARIS_OGELERI(Siparis_Oge_ID, Urün_ID, Siparis_ID, Siparis_Oge_Fiyati, Siparis_Oge_Miktarý) VALUES
(2, 2, 2, 100, 2);

INSERT INTO SIPARIS_OGELERI(Siparis_Oge_ID, Urün_ID, Siparis_ID, Siparis_Oge_Fiyati, Siparis_Oge_Miktarý) VALUES
(3, 3, 3, 45, 1);

INSERT INTO SIPARIS_OGELERI(Siparis_Oge_ID, Urün_ID, Siparis_ID, Siparis_Oge_Fiyati, Siparis_Oge_Miktarý) VALUES
(4, 1, 4, 250, 2);



INSERT INTO GONDERI_OGELERI(Gonderi_ID, Siparis_Oge_ID) VALUES
(1, 1);

INSERT INTO GONDERI_OGELERI(Gonderi_ID,Siparis_Oge_ID) VALUES
(2, 2);

INSERT INTO GONDERI_OGELERI(Gonderi_ID, Siparis_Oge_ID) VALUES
(3, 3);

INSERT INTO GONDERI_OGELERI(Gonderi_ID, Siparis_Oge_ID) VALUES
(4, 4);

SELECT * FROM MUSTERÝLER;
SELECT * FROM SIPARISLER;
SELECT * FROM ODEME_YONTEMI;
SELECT * FROM FATURALAR;
SELECT * FROM ODEMELER;
SELECT * FROM GONDERILER;
SELECT * FROM URUNLER;
SELECT * FROM SIPARIS_OGELERI;
SELECT * FROM GONDERI_OGELERI;



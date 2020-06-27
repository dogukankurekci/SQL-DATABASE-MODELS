create table Yurt (
yurt_id int,
oda_sayisi int,
ogrenci_sayisi int,
yillik_gider int,
yer varchar(10),
primary key (yurt_id)
);

create table Oda(
oda_id int,
yurt_id int,
kapasite int,
oda_durumu varchar(10),
primary key (oda_id),
foreign key (yurt_id) references Yurt (yurt_id)
);

create table Ogrenci (
ogrenci_id int,
yurt_id int,
oda_id int,
isim_soyisim varchar(40),
adres varchar(40),
telefon_no varchar(20),
yas int,
primary key (ogrenci_id),
foreign key (yurt_id) references Yurt (yurt_id),
foreign key (oda_id) references Oda (oda_id)
);

create table Yemekhane (
yemekhane_id int,
kahvaltý_saati varchar(45),
aksam_yemegi_saati varchar(45),
primary key (yemekhane_id)
);

create table Personel (
personel_id int,
yurt_id int,
yemekhane_id int,
isim varchar(40),
adres varchar(50),
maas int,
telefon_no varchar(20),
calisma_alani varchar(20),
primary key (personel_id),
foreign key (yurt_id) references Yurt (yurt_id),
foreign key (yemekhane_id) references Yemekhane (yemekhane_id)
);

CREATE table Ziyaretci (
ziyaretci_id int,
ogrenci_id int,
isim varchar(40),
giris_saati varchar(40),
cikis_saati varchar(40),
ogrenci_ismi varchar(40),
primary key (ziyaretci_id),
foreign key (ogrenci_id) references Ogrenci (ogrenci_id)
);

create table Oda_Mobilya (
OM_id varchar(34),
oda_id int,
mobilya_tipi varchar(40),
primary key (OM_id),
foreign key (oda_id) references Oda (oda_id)
);

create table Ucret (
ucret_id int,
ogrenci_id int,
odeme_durumu varchar(40),
primary key (ucret_id,ogrenci_id),
foreign key (ogrenci_id) references Ogrenci (ogrenci_id)
);


insert into Yurt values
(1,'25','50','1450000','Ýstanbul'),
(2,'30','60','2550000','Ýstanbul'),
(3,'31','62','3570000','Ýstanbul'),
(4,'22','44','1320000','Ýstanbul');

insert into Oda values
(1, 1, 2,'full'),
(2, 1, 2,'full'),
(3, 1, 2,'full'),
(4, 1, 2,'full'),
(5, 1, 2,'full'),
(6, 1, 2,'full'),
(7, 1, 2,'full'),
(8, 1, 2,'full'),
(9, 1, 2,'full'),
(10, 1, 2,'full');

insert into Ogrenci values
(101,1,1,'Ahmet Özgür','Antalya','05xxxxxxxxx',20),
(102,1,2,'Levent Öz','Antalya','05xxxxxxxxx',21),
(103,1,2,'Mürsel Býçak','Antalya','05xxxxxxxxx',22),
(104,1,5,'Sema Ýlkay','Antalya','05xxxxxxxxx',20),
(105,1,5,'Berke Gök','Antalya','05xxxxxxxxx',21),
(106,1,6,'Osman Kale','Antalya','05xxxxxxxxx',23),
(107,1,7,'Said Kaya','Antalya','05xxxxxxxxx',24),
(108,1,8,'Özgür El','Antalya','05xxxxxxxxx',21),
(109,1,10,'Mehmet Ay','Antalya','05xxxxxxxxx',20),
(110,1,10,'Kaan Taþ','Antalya','05xxxxxxxxx',21);


insert into Yemekhane values
(10,'7:00 AM to 8:45 AM','18:00 AM to 20:00 AM');

insert into Personel values
(1,1,10,'Ali','Konya',3000,'05xxxxxxxxx','Yemekhane'),
(2,1,10,'Veli','Konya',3000,'05xxxxxxxxx','Yemekhane'),
(3,1,10,'Fatma','Konya',3000,'05xxxxxxxxx','Yemekhane');

insert into Ziyaretci values
(1,101,'Mehmet Özgür','15:00','16:00','Ahmet Özgür'),
(2,104,'Ayþe Ýlkay','15:00','16:00','Sema Ýlkay'),
(3,106,'Ahmet Kale','15:00','16:00','Osman Kale'),
(4,103,'Kerim Býçak','15:00','16:00','Mürsel Býçak'),
(5,108,'Zeynep El','15:00','16:00','Özgür El');

insert into Oda_Mobilya values
('AK97',1,'yatak'),
('AK98',1,'Öðrenci masasý'),
('AK99',2,'yatak'),
('AK10',2,'Öðrenci masasý'),
('AK11',2,'Öðrenci masasý'),
('AK12',3,'yatak'),
('AK13',4,'Öðrenci masasý');

insert into Ucret values
(1,101,'Ödendi'),
(2,105,'Ödendi'),
(3,106,'Ödendi'),
(4,108,'Ödendi');

SELECT * FROM Yurt;
SELECT * FROM Oda;
SELECT * FROM Ogrenci;
SELECT * FROM Yemekhane;
SELECT * FROM Personel;
SELECT * FROM Ziyaretci;
SELECT * FROM Oda_Mobilya;
SELECT * FROM Ucret;

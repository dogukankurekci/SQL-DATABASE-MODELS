create table Yayinci (
yayinci_id int,
isim varchar(50),
primary key (yayinci_id)
);

create table Dergi (
dergi_id int,
dergi_adi varchar(50),
primary key (dergi_id)
);

create table Dergi_Icerik (
dergi_icerik_id int,
dergi_id int,
tur varchar(50),
sayfa_sayisi int,
primary key (dergi_icerik_id),
foreign key (dergi_id) references Dergi (dergi_id)
);

create table Ucret (
dergi_id int,
dergi_icerik_id int,
fiyat int,
primary key (dergi_id,dergi_icerik_id),
foreign key (dergi_id) references Dergi (dergi_id),
foreign key (dergi_icerik_id) references Dergi_Icerik (dergi_icerik_id)
);

create table Dergi_Yayinci (
dergi_id int,
yayinci_id int,
yayin_tarihi varchar(40),
primary key (dergi_id,yayinci_id),
foreign key (dergi_id) references Dergi (dergi_id),
foreign key (yayinci_id) references Yayinci (yayinci_id)
);

create table Musteri (
musteri_id int,
isim_soyisim varchar(50),
adres varchar(40),
telefon_no varchar(20),
mail varchar(40),
primary key (musteri_id)
);

create table Abonelik (
musteri_id int,
dergi_id int,
baslangic_tarihi varchar(40),
bitis_tarihi varchar(40),
primary key (musteri_id,dergi_id),
foreign key (musteri_id) references Musteri (musteri_id),
foreign key (dergi_id) references Dergi (dergi_id)
);

create table Fatura (
fatura_id int,
musteri_id int,
fatura_tutari int,
primary key (musteri_id),
foreign key (musteri_id) references Musteri (musteri_id)
);

insert into Yayinci values
(1,'kalem yayýnlarý'),
(2,'kus yayýnlarý'),
(3,'gök yayýnlarý');

insert into Dergi values
(10,'Kafka Okur Fikir Sanat ve Edebiyat Dergisi'),
(20,'National Geographic Türkiye'),
(30,'Socrates Dergi');

insert into Dergi_Icerik values
(10, 10, 'Edebiyat', 50),
(20, 20, 'Belgesel', 60),
(30, 30, 'Felsefe', 55);

insert into Ucret values
(10, 10, 30),
(20, 20, 25),
(30, 30, 30);

insert into Dergi_Yayinci values
(10, 1, '4-6-2020'),
(20, 2, '2-7-2020'),
(30, 3, '5-8-2020');

insert into Musteri values
(101, 'Ahmet Zeki', 'Ýzmir', '05555555555', 'ahmet@mail.com'),
(202, 'Fatma Kaya', 'Çanakkale', '05444444444', 'fatma@mail.com'),
(303, 'Zeynep Kale', 'Ýstanbul', '05333333333', 'zeynep@mail.com');

insert into Abonelik values
(101, 10, '20-6-2020', '20-7-2020'),
(202, 20, '15-9-2020', '15-9-2020'),
(303, 30, '5-12-2020', '5-7-2020');

insert into Fatura values
(1011, 101, 30),
(2022, 202, 25),
(3033, 303, 30);

SELECT * FROM Yayinci;
SELECT * FROM Dergi;
SELECT * FROM Dergi_Icerik;
SELECT * FROM Ucret;
SELECT * FROM Dergi_Yayinci;
SELECT * FROM Musteri;
SELECT * FROM Abonelik;
SELECT * FROM Fatura;

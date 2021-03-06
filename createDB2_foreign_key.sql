SHOW ENGINE INNODB STATUS;
use pizzeriadb;
drop database mapevent;

SET SQL_SAFE_UPDATES=0;

create database mapevent;

use mapevent;

CREATE TABLE Users
(
U_Id int NOT NULL AUTO_INCREMENT,
Username varchar(255) UNIQUE,
FullName varchar(255),
Email varchar(255) UNIQUE,
Password varchar(255),
Gender varchar(255),
Enable boolean,
PRIMARY KEY (U_Id)
);

CREATE TABLE Categories
(
Cat_Id int NOT NULL AUTO_INCREMENT,
Cat_Prnt_Id int DEFAULT NULL,
Title varchar(255),
PRIMARY KEY (Cat_Id),
FOREIGN KEY (Cat_Prnt_Id) REFERENCES Categories(Cat_Id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Places
(
Plc_Id int NOT NULL AUTO_INCREMENT,
Plc_Id_Google varchar(255),
Address_Line_1 varchar(255),
Address_Line_2 varchar(255),
City varchar(255),
State varchar(255),
Country varchar(255),
Lat Decimal(9,6) NOT NULL,
Lng Decimal(9,6) NOT NULL,
PRIMARY KEY (Plc_Id)
);

CREATE TABLE Events
(
Ev_Id int NOT NULL AUTO_INCREMENT,
U_Id int,
Cat_Id int,
Plc_Id int,
Title varchar(255),
Have_Imgs boolean NOT NULL DEFAULT 0,
Start datetime,
Finish datetime,
Discription text,
PRIMARY KEY (Ev_Id),
FOREIGN KEY (U_Id) REFERENCES Users(U_Id) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (Cat_Id) REFERENCES Categories(Cat_Id) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (Plc_Id) REFERENCES Places(Plc_Id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Favorites
(
F_Id int NOT NULL AUTO_INCREMENT,
U_Id int,
Ev_Id int,
PRIMARY KEY (F_Id),
FOREIGN KEY (U_Id) REFERENCES Users(U_Id) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (Ev_Id) REFERENCES Events(Ev_Id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Images
(
Img_Id int NOT NULL AUTO_INCREMENT,
Address_Img varchar(255),
Ev_Id int,
PRIMARY KEY (Img_Id),
FOREIGN KEY (Ev_Id) REFERENCES Events(Ev_Id) ON DELETE CASCADE
);

CREATE TABLE Waitconfirms
(
WC_Id int NOT NULL AUTO_INCREMENT,
Username varchar(255) UNIQUE,
FullName varchar(255),
Email varchar(255) UNIQUE,
Password varchar(255),
Gender varchar(255),
HashConfirm varchar(255),
Send_Email datetime,
PRIMARY KEY (WC_Id)
);



CREATE TABLE Users
(
U_Id int NOT NULL AUTO_INCREMENT,
Username varchar(255) UNIQUE,
FullName varchar(255),
Email varchar(255) UNIQUE,
Password varchar(255),
Gender varchar(255),
Enable boolean,
PRIMARY KEY (U_Id)
);

CREATE TABLE Categories
(
Cat_Id int NOT NULL AUTO_INCREMENT,
Cat_Prnt_Id int DEFAULT NULL,
Title varchar(255),
PRIMARY KEY (Cat_Id)
);

CREATE TABLE Places
(
Plc_Id int NOT NULL AUTO_INCREMENT,
Plc_Id_Google varchar(255),
Address_Line_1 varchar(255),
Address_Line_2 varchar(255),
City varchar(255),
State varchar(255),
Country varchar(255),
Lat Decimal(9,6) NOT NULL,
Lng Decimal(9,6) NOT NULL,
PRIMARY KEY (Plc_Id)
);

CREATE TABLE Events
(
Ev_Id int NOT NULL AUTO_INCREMENT,
U_Id int,
Cat_Id int,
Plc_Id int,
Title varchar(255),
Have_Imgs boolean NOT NULL DEFAULT 0,
Start datetime,
Finish datetime,
Discription text,
PRIMARY KEY (Ev_Id)
);

CREATE TABLE Favorites
(
F_Id int NOT NULL AUTO_INCREMENT,
U_Id int,
Ev_Id int,
PRIMARY KEY (F_Id)
);

CREATE TABLE Images
(
Img_Id int NOT NULL AUTO_INCREMENT,
Address_Img varchar(255),
Ev_Id int,
PRIMARY KEY (Img_Id)
);

CREATE TABLE Waitconfirms
(
WC_Id int NOT NULL AUTO_INCREMENT,
Username varchar(255) UNIQUE,
FullName varchar(255),
Email varchar(255) UNIQUE,
Password varchar(255),
Gender varchar(255),
HashConfirm varchar(255),
Send_Email datetime,
PRIMARY KEY (WC_Id)
);

ALTER TABLE events DROP FOREIGN KEY `events_ibfk_1`;
ALTER TABLE events DROP FOREIGN KEY `events_ibfk_2`;
ALTER TABLE events DROP FOREIGN KEY `events_ibfk_3`;
ALTER TABLE categories DROP FOREIGN KEY `categories_ibfk_1`;
ALTER TABLE images DROP FOREIGN KEY `images_ibfk_1`;
ALTER TABLE favorites DROP FOREIGN KEY `favorites_ibfk_1`;
ALTER TABLE favorites DROP FOREIGN KEY `favorites_ibfk_2`;


ALTER TABLE places DROP FOREIGN KEY `places_ibfk_1`;
ALTER TABLE categories DROP FOREIGN KEY `categories_ibfk_2`;
ALTER TABLE categories DROP FOREIGN KEY `categories_ibfk_4`;
ALTER TABLE users DROP FOREIGN KEY `users_ibfk_1`;
ALTER TABLE events DROP FOREIGN KEY `events_ibfk_4`;
ALTER TABLE users DROP FOREIGN KEY `users_ibfk_2`;
ALTER TABLE events DROP FOREIGN KEY `events_ibfk_5`;

ALTER TABLE events ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (Plc_Id) REFERENCES places(Plc_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE events ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (Cat_Id) REFERENCES categories(Cat_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE events ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (U_Id) REFERENCES users(U_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE categories ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (Cat_Prnt_Id) REFERENCES categories(Cat_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Images ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (Ev_Id) REFERENCES events(Ev_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE favorites ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (U_Id) REFERENCES Users(U_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE favorites ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (Ev_Id) REFERENCES Events(Ev_Id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE events ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (Plc_Id) REFERENCES places(Plc_Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE events ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (Cat_Id) REFERENCES categories(Cat_Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE events ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (U_Id) REFERENCES users(U_Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE categories ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (Cat_Prnt_Id) REFERENCES categories(Cat_Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE Images ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (Ev_Id) REFERENCES events(Ev_Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE favorites ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (U_Id) REFERENCES Users(U_Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE favorites ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (Ev_Id) REFERENCES Events(Ev_Id) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE events ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (Plc_Id) REFERENCES places(Plc_Id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE events ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (Cat_Id) REFERENCES categories(Cat_Id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE events ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (U_Id) REFERENCES users(U_Id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE categories ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (Cat_Prnt_Id) REFERENCES categories(Cat_Id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE Images ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (Ev_Id) REFERENCES events(Ev_Id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE favorites ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (U_Id) REFERENCES Users(U_Id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE favorites ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (Ev_Id) REFERENCES Events(Ev_Id) ON DELETE NO ACTION ON UPDATE NO ACTION;



ALTER TABLE places ADD CONSTRAINT `places_ibfk_1` FOREIGN KEY (Plc_Id) REFERENCES events(Plc_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE categories ADD CONSTRAINT `categories_ibfk_2` FOREIGN KEY (Cat_Id) REFERENCES events(Cat_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE categories ADD CONSTRAINT `categories_ibfk_4` FOREIGN KEY (Cat_Id) REFERENCES categories(Cat_Prnt_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE users ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (U_Id) REFERENCES events(U_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE events ADD CONSTRAINT `events_ibfk_4` FOREIGN KEY (Ev_Id) REFERENCES images(Ev_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE users ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (U_Id) REFERENCES favorites(U_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE events ADD CONSTRAINT `events_ibfk_5` FOREIGN KEY (Ev_Id) REFERENCES favorites(Ev_Id) ON DELETE CASCADE ON UPDATE CASCADE;


insert into categories (Title) values("Бизнес");
insert into categories (Title) values("Кино");
insert into categories (Title) values("Концерты");
insert into categories (Title) values("Танцы");
insert into categories (Title) values("Выставки");
insert into categories (Title) values("Игры");
insert into categories (Title) values("Фестивали");
insert into categories (Title) values("Театр");
insert into categories (Title) values("Спорт");
insert into categories (Title) values("Квесты");
insert into categories (Title) values("Благотворительность");
insert into categories (Title) values("Встречи");
insert into categories (Title) values("Comedy");

insert into users (Username, FullName, Email, Password, Gender, Enable) values("dima", "D M", "viva-barca@i.ua", "b59c67bf196a4758191e42f76670ceba", "male", false);
insert into places (Plc_Id_Google, Address_Line_1, Address_Line_2, City, State, Country, Lat, Lng) values("asca", "casv" ,"vdsv", "vds", "csac", "casc", 4.535642, 7.536743);
insert into favorites (Ev_Id, U_Id) value (2, 1);
insert into favorites (Ev_Id, U_Id) value (1, 1);


use mapevent;
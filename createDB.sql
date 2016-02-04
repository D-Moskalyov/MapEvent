select * from Users;
select * from categories;
select * from events;
select * from images;
select * from places;
select * from waitconfirms;
select * from favorites;


select * from events
join
favorites
on events.Ev_Id=favorites.Ev_Id
where favorites.U_Id=1;


use pizzeriadb;
drop database mapevent;

create database mapevent;
SET SQL_SAFE_UPDATES=0;
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

insert into users (Username, FullName, Email, Password, Gender, Enable) values("dima", "D M", "viva-barca@i.ua", "b59c67bf196a4758191e42f76670ceba", "male", false);
insert into places (Plc_Id_Google, Address_Line_1, Address_Line_2, City, State, Country, Lat, Lng) values("asca", "casv" ,"vdsv", "vds", "csac", "casc", 4.535642, 7.536743);
insert into favorites (Ev_Id, U_Id) value (2, 1);
insert into favorites (Ev_Id, U_Id) value (1, 1);

delete from favorites where Ev_Id=1;

use mapevent;





select * from places where Plc_Id_Google="ChIJBVXQG_CgJ0ERON-jp0YRZE0" and 
						   Address_Line_1="вулиця Сумська" and 
                           Address_Line_2="2" and 
                           City="Харків" and 
                           State="Харківська" and 
                           Country="Украина" and 
                           Lat="49.993351" and 
                           Lng="36.232372";

delete from users;
drop table categories;

insert into Images (Address_Img, Ev_Id) values("sadd", 5);
delete from Images where Address_Img="sadd";
drop table events;
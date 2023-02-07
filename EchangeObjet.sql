create database objet;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

use objet;

create table User 
(
    idUser integer(30) primary key AUTO_INCREMENT,
    email varchar(100) unique not null,
    mdp varchar(100) unique not null,
    nom varchar(100) unique not null,
    identification integer unique not null
)engine=innodb;


create or replace view membre as(select * from User where identification = 0);
create or replace view adminn as(select * from User where identification = 1);

create table Objet 
(
    idObjet integer(30) primary key AUTO_INCREMENT,
    idUser integer(30),
    nomObjet varchar(100)unique not null,
    prix smallint(250)unique not null,
    foreign key (idUser) references User(idUser)
)engine=innodb;

create table photos 
(
    idPhotos integer(30) primary key AUTO_INCREMENT,
    idObjet integer(30),
    photos varchar(50),
    foreign key (idObjet) references Objet(idObjet)
)engine=innodb;


insert into User values (1,"admin@gmail.com","admin","admin",1);
insert into User values (2,"Rudy@gmail.com","rudy","Rudy",0);
insert into User values (3,"Mendrika@gmail.com","mendrika","Mendrika",2);
insert into User values (4,"Kristy@gmail.com","christ","ChristyJesoa",3);
insert into User values (5,"Rody@gmail.com","rody","Rody",4);

insert into Objet values (1,1,"Scoobi-doo",2500);
insert into Objet values (2,2,"gant",1000);
insert into Objet values (3,2,"ecouteurs",5000);
insert into Objet values (4,3,"pot",8000);
insert into Objet values (5,3,"casque",3000);
insert into Objet values (6,3,"short",6000);
insert into Objet values (7,2,"tshirt",9000);
insert into Objet values (8,4,"soutien",3000);
insert into Objet values (9,4,"chaussette",5500);
insert into Objet values (10,4,"sac",1000);
insert into Objet values (11,5,"nike",7000);
insert into Objet values (12,5,"montre",4000);

-- insert into Photos values (1,2,"gant");
-- insert into Photos values (2,3,"casque");
-- insert into Photos values (3,4,"chaussette");
-- insert into Photos values (4,4,"soutien");
-- insert into Photos values (5,4,"sac");
-- insert into Photos values (6,3,"pot");
-- insert into Photos values (7,3,"short");
-- insert into Photos values (8,2,"ecouteurs");
-- insert into Photos values (9,2,"tshirt");
-- insert into Photos values (10,1,"Scoobi-doo");


create view photosObjet as
(
    select Photos.idPhotos from Photos inner join on Objet.idObjet = Photos.idObjet
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- --foreign key (idMarque) references marque(idMarque)
-- select*from Objet  WHERE idUser = 2 GROUP BY nomObjet;
-- select*from Objet  WHERE idUser = 3 GROUP BY nomObjet;
-- select*from Objet  WHERE idUser = 4 GROUP BY nomObjet;


-- CREATE VIEW film_list
-- AS
-- SELECT film.film_id AS FID, film.title AS title, film.description AS description, category.name AS category, film.rental_rate AS price,
-- 	film.length AS length, film.rating AS rating, GROUP_CONCAT(CONCAT(actor.first_name, _utf8' ', actor.last_name) SEPARATOR ', ') AS actors
-- FROM category LEFT JOIN film_category ON category.category_id = film_category.category_id LEFT JOIN film ON film_category.film_id = film.film_id
--         JOIN film_actor ON film.film_id = film_actor.film_id
-- 	JOIN actor ON film_actor.actor_id = actor.actor_id
-- GROUP BY film.film_id, category.name;


-- CREATE VIEW sales_by_store
-- AS
-- SELECT
-- CONCAT(c.city, _utf8',', cy.country) AS store
-- , CONCAT(m.first_name, _utf8' ', m.last_name) AS manager
-- , SUM(p.amount) AS total_sales
-- FROM payment AS p
-- INNER JOIN rental AS r ON p.rental_id = r.rental_id
-- INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
-- INNER JOIN store AS s ON i.store_id = s.store_id
-- INNER JOIN address AS a ON s.address_id = a.address_id
-- INNER JOIN city AS c ON a.city_id = c.city_id
-- INNER JOIN country AS cy ON c.country_id = cy.country_id
-- INNER JOIN staff AS m ON s.manager_staff_id = m.staff_id
-- GROUP BY s.store_id
-- ORDER BY cy.country, c.city;

--liste produit
select * from Objet where idUser !=1;
--
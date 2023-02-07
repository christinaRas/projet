create database objet;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

use objet;

create table User 
(
    idUser integer(30) primary key AUTO_INCREMENT,
    email varchar(100)  not null,
    mdp varchar(100)  not null,
    nom varchar(100)  not null,
    identification integer not null
)engine=innodb;


create or replace view membre as(select * from User where identification = 0);
create or replace view adminn as(select * from User where identification = 1);

create table Objet 
(
    idObjet integer(30) primary key AUTO_INCREMENT,
    idUser integer(30),
    nomObjet varchar(100) not null,
    prix smallint(250) not null,
    Photos varchar(100),
    foreign key (idUser) references User(idUser)
)engine=innodb;


insert into User values (1,"admin@gmail.com","admin","admin",1);
insert into User values (2,"Rudy@gmail.com","rudy","Rudy",0);

insert into Objet values (1,1,"Scoobi-doo",2500);
insert into Objet values (2,2,"gant",1000);
insert into Objet values (3,2,"ecouteurs",5000);
insert into Objet values (4,2,"pot",8000);
-- insert into Objet values (5,3,"casque",3000);
-- insert into Objet values (6,3,"short",6000);
-- insert into Objet values (7,2,"tshirt",9000);
-- insert into Objet values (8,4,"soutien",3000);
-- insert into Objet values (9,4,"chaussette",5500);
-- insert into Objet values (10,4,"sac",1000);
-- insert into Objet values (11,5,"nike",7000);
-- insert into Objet values (12,5,"montre",4000);


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
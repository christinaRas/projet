
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


create table User 
(
    idUser integer(30) primary key AUTO_INCREMENT,
    email varchar(100)  not null,
    mdp varchar(100)  not null,
    nom varchar(100)  not null,
    identification integer not null,
    photo varchar(100)
)engine=innodb;

insert into user values (null,'admin@a.admin','admin','admin',0,'assets/img/admin.jpg');
insert into user values (null,'Mendrika@gmail.com','men','men',0,'assets/img/men.jpg');
insert into user values (null,'christ@gmail.com','c','christ',0,'assets/img/christ.jpg');
insert into user values (null,'rudy@gmail.com','rudy','rudy',0,'assets/img/rudy.jpg');


create or replace view membre as(select * from User where identification = 1);
create or replace view adminn as(select * from User where identification = 0);

create table categorie 
(
    idC integer primary key AUTO_INCREMENT,
    nomC varchar(100)
);
insert into categorie values (null,"chaussures");
insert into categorie values (null,"gant");
insert into categorie values (null,"Technologie");


create table Objet 
(
    idObjet integer(30) primary key AUTO_INCREMENT,
    idUser integer(30),
    nomObjet varchar(100) not null,
    descri varchar(100),
    prix integer not null,
    Photos varchar(100),
    categorie varchar(100) not null ,
    foreign key (idUser) references User(idUser)

)engine=innodb;


SET @chaussure = (SELECT nomC FROM categorie WHERE idC = 1);
SET @gant     = (SELECT nomC FROM categorie WHERE idC = 2);
SET @Technologie     = (SELECT nomC FROM categorie WHERE idC = 3);

insert into objet values(null,1,'Sandale','Bien confortable et a bas prix','30000','assets/img/c2.jpg',(SELECT nomC FROM categorie WHERE idC = 1));
insert into objet values(null,1,'Converse','A la mode et bien basique','60000','assets/img/c1.jpg',(SELECT nomC FROM categorie WHERE idC = 1));
insert into objet values(null,1,'Stan Smith','Pour toutes types de personnes','70000','assets/img/c3.jpg',(SELECT nomC FROM categorie WHERE idC = 1));

insert into objet values(null,2,'Gant','Bien chaud et confortable','10000','assets/img/g1.jpg',(SELECT nomC FROM categorie WHERE idC = 2));
insert into objet values(null,3,'Casque','Casque a la mode avec une bonne son','100000','assets/img/t2.jpg',(SELECT nomC FROM categorie WHERE idC = 3));
insert into objet values(null,4,'Ordinateur','Tres pratique pour le travail','2000000','assets/img/t3.jpg',(SELECT nomC FROM categorie WHERE idC = 3));


create view photosObjet as
(
    select Photos.idPhotos from Photos inner join on Objet.idObjet = Photos.idObjet
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

 select count(idUser) as user from user where identification!=1;

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
create table etat
(
    idEtat integer primary key AUTO_INCREMENT,
    nom varchar(100)
);
insert into etat values(null,"demande");
insert into etat values(null,"accepter");

create table echange
(
    idEchange integer primary key AUTO_INCREMENT,
    idUser_echange integer,
    idObjet integer ,
    idObjet_echange integer,
    idEtat integer ,
    foreign key (idUser_echange) references User(idUser),
        foreign key (idEtat) references etat(idEtat),
    foreign key (idObjet_echange) references objet(idObjet)
);
insert into echange values (null,2,4,5,1);


--demande
create or replace view dmd as select user.nom as USER,etat.nom,objet.idObjet as ID_OBJET,echange.idObjet_echange as ECHANGE from echange 
join user on echange.idUser_echange = user.idUser  
join objet on echange.idObjet = objet.idObjet 
join etat on echange.idEtat = etat.idEtat where etat.idEtat =1;


--
--stat echange
create or replace view nombre as select user.nom as USER,etat.nom,objet.idObjet as ID_OBJET,echange.idObjet_echange as ECHANGE from echange 
join user on echange.idUser_echange = user.idUser  
join objet on echange.idObjet = objet.idObjet 
join etat on echange.idEtat = etat.idEtat where etat.idEtat =2;

select count(user)as n from nombre;
--acceptation
--echange process
update echange set idEtat = 2
where idUser_echange = 2;



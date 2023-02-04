DROP DATABASE IF EXISTS assurPro;  -- creer la base avant
CREATE DATABASE assurPro;
USE assurPro;

CREATE TABLE Administrateur(
   Id_Administrateur INT,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   email VARCHAR(50),
   PRIMARY KEY(Id_Administrateur)
);

CREATE TABLE syndic(
   Id_syndic INT,
   nom VARCHAR(50),
   Adresse VARCHAR(50),
   nom_dirigeant VARCHAR(50),
   prenom_dirigeant VARCHAR(50),
   PRIMARY KEY(Id_syndic)
);

CREATE TABLE gestionnaire(
   Id_gestionnaire INT,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   email VARCHAR(50),
   Id_syndic INT NOT NULL,
   PRIMARY KEY(Id_gestionnaire),
   FOREIGN KEY(Id_syndic) REFERENCES syndic(Id_syndic) on delete cascade
);

CREATE TABLE assureur(
   Id_assureur INT,
   nom VARCHAR(50),
   adresse VARCHAR(50),
   tel VARCHAR(50),
   mail VARCHAR(50),
   PRIMARY KEY(Id_assureur)
);

CREATE TABLE sinistre(
   Id_sinistre INT,
   reference VARCHAR(50),
   montant VARCHAR(50),
   descriptif VARCHAR(50),
   PRIMARY KEY(Id_sinistre)
);

CREATE TABLE immeuble(
   Nom VARCHAR(50),
   adresse VARCHAR(50),
   année_construction VARCHAR(50),
   nb_batiment VARCHAR(50),
   superficie VARCHAR(50),
   class_patrimoine VARCHAR(50),
   Id_gestionnaire INT NOT NULL,
   Id_assureur INT NOT NULL,
   Id_Administrateur INT NOT NULL,
   PRIMARY KEY(Nom),
   FOREIGN KEY(Id_gestionnaire) REFERENCES gestionnaire(Id_gestionnaire) on delete cascade,
   FOREIGN KEY(Id_assureur) REFERENCES assureur(Id_assureur) on delete cascade,
   FOREIGN KEY(Id_Administrateur) REFERENCES Administrateur(Id_Administrateur) on delete cascade
);

CREATE TABLE lien(
   Id_Administrateur INT,
   Id_gestionnaire INT,
   PRIMARY KEY(Id_Administrateur, Id_gestionnaire),
   FOREIGN KEY(Id_Administrateur) REFERENCES Administrateur(Id_Administrateur) on delete cascade,
   FOREIGN KEY(Id_gestionnaire) REFERENCES gestionnaire(Id_gestionnaire) on delete cascade
);

CREATE TABLE ouvrir(
   Nom VARCHAR(50),
   Id_sinistre INT,
   date_survenance VARCHAR(50),
   PRIMARY KEY(Nom, Id_sinistre),
   FOREIGN KEY(Nom) REFERENCES immeuble(Nom) on delete cascade,
   FOREIGN KEY(Id_sinistre) REFERENCES sinistre(Id_sinistre) on delete cascade
);



--  creation admin values 
insert into Administrateur values (1, "Utrera", "Ludovic", "ludovic@mail.com");
insert into Administrateur values (2, "Malerba", "Sylvain", "sylvain@mail.com");
insert into Administrateur values (3, "Bouzidi", "Samah", "samah@mail.com");

-- creation syndic values
insert into syndic values (1,"Aflokkat","4 a murza", "Pereney", "Benjamin");
insert into syndic values (2,"Grimaldi","rue des pins", "Lemaire", "Gregory");

--  creation gestionnaire values
insert into gestionnaire values (1,"Sabini", "Laetitia", "laeti@mail.com", 2);
insert into gestionnaire values (2,"Pereney", "Benjamin", "benj@mail.com", 1);

-- creation assureur values
insert into assureur values (1,"Groupama","4 rue des moulins","0606060606","group@mail.com");
insert into assureur values (2,"Helvetia", "6 rue des moulins", "0707070707","helv@mail.com");

--  creation sinistre values
insert into sinistre values (1, "casse", "2022", "casse toi");
insert into sinistre values (2, "fellure", "2021", "fellure toi");
insert into sinistre values (3, "fellure", "3333", "fellure toi 3333");
insert into sinistre values (4, "fellure", "3333", "fellure toi 3333");
insert into sinistre values (5, "fellure", "3333", "fellure toi 3333");
insert into sinistre values (6, "fellure", "3333", "fellure toi 3333");



--  creation immeuble values
INSERT INTO immeuble values ("a murza", "lieu dit furiani", "2021", "1","200","0", 1, 1, 1 );
INSERT INTO immeuble values ("a casuccia", "lieu dit corte", "1995", "1","140","0",1 ,1,1);
INSERT INTO immeuble values ("a supprimer", "empty street", "2001", "2","250","0",2,2,2);
INSERT INTO immeuble values ("museum", "rue de l'histoire", "1980", "1","300","1",1,2,3);

-- creation lien values
insert into lien values (1,1);
insert into lien values (1,2);
insert into lien values (2,1);
insert into lien values (2,2);
insert into lien values (3,1);
insert into lien values (3,2);

--  creation ouvrir values 
insert into ouvrir values ("a murza", 1, "2022");
insert into ouvrir values ("a casuccia", 2, "2022");
insert into ouvrir values ("a casuccia", 3, "2021");
insert into ouvrir values ("a casuccia", 4, "2021");
insert into ouvrir values ("a casuccia", 5, "2021");
insert into ouvrir values ("a casuccia", 6, "2021");



-- 2 Partie 2 : LDD - LMD - LCD
-- 1+2 ( voir dossier zip avec les create table )

-- 3 )
-- DELETE from immeuble where Nom = "a supprimer";

-- 4)
-- select * from immeuble;

-- 5)
-- update immeuble set année_construction = "2022" where Nom = "a murza";

-- 3 Partie 3 : Sous requête

-- 1)
-- select Nom from immeuble where Nom not in ( select Nom from ouvrir where date_survenance = "2020" );

-- 2)
-- select * from immeuble where id_gestionnaire = ( select Id_gestionnaire from gestionnaire where Prenom like "L%");

-- 3)
-- select Nom from immeuble where Nom not in ( select Nom from ouvrir where date_survenance = "2020" ) and id_gestionnaire = ( select Id_gestionnaire from gestionnaire where Prenom like "L%" or "B%");





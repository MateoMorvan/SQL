drop schema if exists STOCK cascade;
create schema STOCK;
set schema 'STOCK';


TABLE CREATE _Competences(
   lib_competence VARCHAR(20) PRIMARY KEY
CONSTRAINT _Competences PRIMARY KEY(lib_Competences)

);


TABLE CREATE _Activites(
   lib_activite VARCHAR(20) PRIMARY KEY,
   lib_competence VARCHAR(20),
   PRIMARY KEY(lib_activite),
FOREIGN KEY(lib_competence) REFERENCES _Competences(lib_competence)
);


TABLE CREATE _Niveau(
   numero_N INTEGER(5) PRIMARY KEY
);


TABLE CREATE _Semestre(
   numero_N INTEGER(5),
   numero_sem VARCHAR(20) PRIMARY KEY,
   PRIMARY KEY(numero_N),
FOREIGN KEY(numero_N) REFERENCES _Niveau(numero_N)
);


TABLE CREATE _UE(
   code_UE VARCHAR(20) PRIMARY KEY,
   numero_sem VARCHAR(20),
   lib_activite VARCHAR(20),
   PRIMARY KEY(lib_activite, numero_sem)
FOREIGN KEY(numero_sem) REFERENCES _Semestre(numero_sem)
FOREIGN KEY(lib_activite) REFERENCES _Activites(lib_activite)
);

CREATE TABLE _Parcours(
   code_P CHAR(2) PRIMARY KEY,
   libelle_parcours VARCHAR(20) NOT NULL,
   nbre_gpe_TD_P INTEGER,
   nbre_gpe_TP_P INTEGER
);

CREATE TABLE _correspond(
   numero_N INTEGER(5),
   lib_activite VARCHAR(20),
   code_P CHAR(2),
   PRIMARY KEY(numero_N, lib_activite, code_P),
FOREIGN KEY(numero_N) REFERENCES _Niveau(numero_N)
FOREIGN KEY(lib_activite) REFERENCES Activites(lib_activite)
FOREIGN KEY(code_P) REFERENCES _Parcours(code_P)
);


CREATE TABLE _Ressource (	
	numero_sem VARCHAR(20),
	code_R VARCHAR(2) PRIMARY KEY,
	lib_R VARCHAR(20) NOT NULL,
	nb_h_CM_PN INT,
	nb_h_TD_PN INT,
	nb_h_TP_PN INT,
	PRIMARY KEY(numero_sem)
FOREIGN KEY(numero_sem) REFERENCES _Semestre(numero_sem)
);

CREATE TABLE _SAE (
	code_SAE VARCHAR(255) PRIMARY KEY,
	lib_SAE VARCHAR(255) not null,
	nb_h_TD_enc INT,
	nb_h_TD_projet_autonomie INT
  );

CREATE TABLE comprend_R (
	code_SAE VARCHAR(255),
	code_R VARCHAR(2),
	nb_h_TD_C INT,
	nb_h_TP_C INT,
	PRIMARY KEY (code_SAE, code_R),
	FOREIGN KEY (code_SAE) REFERENCES _SAE(code_SAE),
	FOREIGN KEY (code_R) REFERENCES _ressource(code_R)
);



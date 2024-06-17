drop schema if exists STOCK cascade;
create schema STOCK;
set schema 'STOCK';

TABLE CREATE Competences(
    lib_competence VARCHAR(20) PRIMARY KEY
);

TABLE CREATE Activites(
    lib_activite VARCHAR(20) PRIMARY KEY,
    lib_competence VARCHAR(20),
    CONSTRAINT Activites_pk PRIMARY KEY(lib_competence)
);

TABLE CREATE Niveau(
    numero_N INTEGER(5) PRIMARY KEY
);

TABLE CREATE Semestre(
    numero_N INTEGER(5),
    numero_sem VARCHAR(20) PRIMARY KEY,
    CONSTRAINT Semestre_pk PRIMARY KEY(numero_N)
);

TABLE CREATE UE(
    code_UE VARCHAR(20) PRIMARY KEY,
    numero_sem VARCHAR(20),
    lib_competence VARCHAR(20),
    CONSTRAINT UE_pk PRIMARY KEY(numero_sem),
    CONSTRAINT UE_pk PRIMARY KEY(lib_competence)
    
);

CREATE TABLE parcours(
    code_P CHAR(2) PRIMARY KEY,
    libelle_parcours VARCHAR(20) NOT NULL,
    nbre_gpe_TD_P INTEGER,
    nbre_gpe_TP_P INTEGER
);

CREATE TABLE correspond(
    numero_N INTEGER(5),
    lib_activite VARCHAR(20),
    code_P CHAR(2),
    CONSTRAINT correspond_pk PRIMARY KEY(numero_N),
    CONSTRAINT correspond_pk PRIMARY KEY(lib_activite),
    CONSTRAINT correspond_pk PRIMARY KEY(code_P)
);


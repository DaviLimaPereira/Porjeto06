drop table users;
CREATE TABLE USERS(
    id BIGINT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    role VARCHAR(200) NOT NULL,
    name VARCHAR(200) NOT NULL,
    login VARCHAR(20) NOT NULL,
    passwordHash BIGINT NOT NULL
);
INSERT INTO USERS VALUES(default,
    'ADMIN', 'Administrador', 'admin', 1509442);
INSERT INTO USERS VALUES(default,
    'OPERADOR', 'Fulano da Silva', 'fulano', 1509442);

drop table students;
CREATE TABLE STUDENTS(
    id BIGINT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(200) NOT NULL,
    dataNasc date NOT NULL,
    address VARCHAR(200) NOT NULL,
    phone varchar(14) NOT NULL
);
INSERT INTO STUDENTS VALUES(default,
    'JOSE', 30-05-2019 , 'RUA DAS FLORES, 15', '+551334715263');

drop table classes;
create table classes(
    id BIGINT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    class_name VARCHAR(200) NOT NULL,
    class_period varchar(14) NOT NULL);
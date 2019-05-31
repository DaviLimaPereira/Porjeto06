DROP TABLE USERS;
CREATE TABLE USERS(
    ID BIGINT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    ROLE VARCHAR(200) NOT NULL,
    NAME VARCHAR(200) NOT NULL,
    LOGIN VARCHAR(20) NOT NULL,
    PASSWORDHASH BIGINT NOT NULL);
INSERT INTO USERS VALUES(DEFAULT,
    'ADMIN', 'Administrador', 'admin', 1509442);
INSERT INTO USERS VALUES(DEFAULT,
    'OPERADOR', 'Fulano da Silva', 'fulano', 1509442);
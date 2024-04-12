USE Lab6db;
GO

CREATE TABLE student (
    id int PRIMARY KEY,
    fname varchar(30),
    lname varchar(30)
);

CREATE TABLE wykladowca (
    id int PRIMARY KEY,
    fname varchar(30),
    lname varchar(30)
);

CREATE TABLE przedmiot (
    id int PRIMARY KEY,
    name varchar(50)
);

CREATE TABLE grupa (
    id_wykl int,
    id_stud int,
    id_przed int,
    FOREIGN KEY (id_wykl) REFERENCES wykladowca(id),
    FOREIGN KEY (id_stud) REFERENCES student(id),
    FOREIGN KEY (id_przed) REFERENCES przedmiot(id),
    PRIMARY KEY (id_wykl, id_stud, id_przed)
);
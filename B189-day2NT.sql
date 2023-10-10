------------------------DAY'2 NT---------------------
----------------------tekrar-------------------------
CREATE TABLE sairler(
id int,
name VARCHAR(50),
email VARCHAR(50)
);

INSERT INTO sairler VALUES(1001,'Can Yücel','sair@gmail.com');
INSERT INTO sairler VALUES(1001,'Necip Fazıl','sair@gmail.com');
INSERT INTO sairler VALUES (1002,'','sair@gmail.com');

INSERT INTO sairler(name) VALUES('Nazım Hikmet');

SELECT * FROM sairler;

-- 9- tabloya UNIQUE constrainti ekleme
CREATE TABLE it_persons( 
id SERIAL,
name VARCHAR(50),
email VARCHAR(50) UNIQUE,
salary REAL,
prog_lang VARCHAR(20)
);

INSERT INTO it_persons(name,email,salary,prog_lang)
VALUES('Yusuf Kaplan','dev@gmail.com',5000,'Java');

INSERT INTO it_persons(name,email,salary,prog_lang)
VALUES('Akın Kaldiroglu','developer@gmail.com',5000,'Java');

INSERT INTO it_persons(name,email,salary)
VALUES('Buse Hanım','tester@gmail.com',5000);

SELECT * FROM it_persons;

-- 10- tabloya NOT NULL constrainti (kısıtlama) ekleme

CREATE TABLE doctors(
id SERIAL,
name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
salary REAL
);

INSERT INTO doctors(name,email,salary) VALUES ('Fatma Hoca','dr@gmail.com',7000); 

INSERT INTO doctors(email,salary) VALUES ('dr@gmail.com',7000); 

INSERT INTO doctors(name,email,salary) VALUES ('Dr.Gregory House','doctor@gmail.com',7000); 
INSERT INTO doctors(name,email,salary) VALUES ('','doctor@email.com',7000);
--NOT NULL empty kabul eder.
SELECT * FROM doctors;

-- 11- tabloya primary key constrainti ekleme
CREATE TABLE students2(
id int PRIMARY KEY,--UNIQOUE , NOT NULL, başka bir tablo ile ilişkilendirmek için kullanılacak
name VARCHAR(50),
grade REAL,
register_date DATE
);
SELECT * FROM students2;

-- 11- tabloya primary key constrainti ekleme: 2.YÖNTEM
CREATE TABLE students3(
id int,--UNIQOUE , NOT NULL, başka bir tablo ile ilişkilendirmek için kullanılacak
name VARCHAR(50),
grade REAL,
register_date DATE,
CONSTRAINT std_pk PRIMARY KEY(id)
);
SELECT * FROM students3;


--composite key
CREATE TABLE students4(
id int,
name VARCHAR(50),
grade REAL,
register_date DATE,
CONSTRAINT composite_pk PRIMARY KEY(id,name)	
);
SELECT * FROM students4;

-- 12-tabloya FK constrainti ekleme
CREATE TABLE adress3(
adress_id int,
street VARCHAR(50),
city VARCHAR(20),
student_id int, --FK olsun
CONSTRAINT add_fk FOREIGN KEY(student_id) REFERENCES students3(id)	
);

SELECT * FROM adress3;

-- 13-tabloya CHECK constrainti ekleme
CREATE TABLE personel(
id int,
name VARCHAR(50),
salary REAL CHECK(salary>5000),
age int CHECK(age>0 AND age<50) --Negatif olmamalı
);

INSERT INTO personel VALUES (11,'Ali Can',2000,25); -- salary 5000den fazla değil error verdi
INSERT INTO personel VALUES (11,'Ali Can',7000,55); -- yas kosullar arasında değil
INSERT INTO personel VALUES (11,'Ali Can',7000,32);





















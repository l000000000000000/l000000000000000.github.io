-- Database: aug5

-- DROP DATABASE aug5;

CREATE DATABASE aug5
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30) NOT NULL,
    date_of_birth DATE, 
    nationality VARCHAR(20)
);
	CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender CHAR(1),
    date_of_birth DATE 
);

	CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(30),
    movie_length VARCHAR(30),
    gender CHAR(1),
    date_of_birth DATE 
);


	select * from examples2

	CREATE TABLE examples2 (
	id serial primary key,
	first_name varchar(30),
	last_name varchar(30)
)

INSERT INTO examples2(first_name, LAST_NAME)
VALUES
('John', 'Doe'),
('John', 'D')

INSERT INTO examples2(id, first_name, LAST_NAME)
VALUES
('3', 'John', 'Doe'),
('6', 'John', 'D')

INSERT INTO examples2(id, first_name, LAST_NAME)
VALUES
('3','Kate','Doe'),
('6', 'Mark','D')

--ADD EMAIL COLUMN TO examples2, add constraint UNIQUE

ALTER TABLE examples2
ADD COLUMN EMail VARCHAR(100) UNIQUE; --This will add a email column

ALTER TABLE examples2
ALTER COLUMN LAST_NAME SET NOT NULL

UPDATE examples2
SET email = 'john@gmail.com'
WHERE ID = 1;
SET email = 'johndoe1@gmail.com'
WHERE ID = 2;
SET email = 'johndoe2@gmail.com' --Emails are unique, can't be the same.
WHERE ID = 3;
SET email = 'johndoe3@gmail.com'
WHERE ID = 4;

select * from examples2

UPDATE examples2
SET email='john_doe1'
WHERE ID= '2'

-- update examples
-- set email='new_email'
-- where id in(

SELECT ID FROM examples2
WHERE email = 'john_doe1'
--)

SELECT * FROM movies
WHERE movie_lang = 'English'

SELECT * FROM movies
WHERE movie_lang LIKE '-------e%'

SELECT * FROM movies
WHERE movie_lang LIKE '%e%' AND movie_name LIKE '%Mood%'


SELECT * FROM movies
WHERE movie_LENGTH > 120 --see movies over 2hrs

SELECT * FROM actors
WHERE first_name LIKE 'M%' OR last_name LIKE 'M%' AND gender = 'M' -- shows first name and last name starting with M

-- comparing

SELECT first_name, last_name, date_of_birth FROM actors
WHERE date_of_birth < '1980-01-01' -- prints all the actors <1980

SELECT first_name, last_name, date_of_birth FROM actors
WHERE date_of_birth <= '1980-01-01' AND date_of_birth >= '1970-01-01' -- using boolean logic

SELECT * FROM movies
WHERE movie_lang <'E' -- should filter movie languages


-- select the movie_name and release_date of every movie
SELECT movie_name, release_date FROM movies;

--select the first and last names of all American directors
SELECT first_name, last_name FROM directors
WHERE nationality = 'American';

--select all male actors born after the 1st of january 1970
SELECT * FROM actors
WHERE gender = 'M' AND date_of_birth > '1970-01-01';


--select the names of all movies whiich are over 90 minutes long and movie language is english
SELECT movie_name FROM movies
WHERE movie_lang = 'English' AND movie_LENGTH > 90 -- to show you just highlight the text you want, and press the play button(f5)

--PRACTICE 2:
SELECT movie_name, movie_lang FROM movies 
WHERE movie_lang = 'English, Spanish, Korean'

SELECT first_name, last_name FROM actors 
LIKE 'M%'

--ORDER: DATE, INTEGER, STRING

--7:45pm time of class
SELECT first_name, last_name, date_of_birth
FROM actors
WHERE gender = 'f'
ORDER BY first_name ASC -- or DESC

SELECT * FROM movie_revenues
ORDER BY domestic_takings IS NOT null
LIMIT 3 -- this shows only top3 earnings

SELECT * FROM movie_revenues
WHERE domestic_takings > 400 AND domestic_takings < 600
ORDER BY domestic_takings DESC

SELECT * FROM movie_revenues
ORDER BY domestic_takings IS NOT null
LIMIT 7 OFFSET 3 -- this shows top10 but excludes the top3 of the movie revenues

SELECT * FROM movie_revenues
ORDER BY international_takings DESC
FETCH FIRST 3 ROWS ONLY -- this only shows first 3 rows of the descending values


-- Assignment try
SELECT * FROM actors
SELECT date_of_birth FROM directors DESC
WHERE nationality = 'American'; 

SELECT DISTINCT * from actors
SELECT nationality FROM directors

SELECT * FROM actors
SELECT first_name, last_name, date_of_birth AND gender= 'F';
ORDER BY first_name DESC
LIMIT 10

SELECT first_name FRIST, last_name lastname FROM actors
WHERE first_name= 'Tim'

SELECT first_name FRIST, last_name lastname FROM actors
WHERE first_name LIKE 'A%'
ORDER BY lastname


SELECT 'firstname' || '' || 'lastname' AS fullname --concatenate two strings together || this just combines two columns into one.
-- fullname is the column name

SELECT CONCAT(first_name,' ',last_name) AS full_name FROM actors -- this combines two columns into one
ORDER BY full_name DESC


SELECT CONCAT(first_name,' ',last_name, ' ',date_of_birth) AS full_name FROM actors -- this combines two columns into one
ORDER BY full_name DESC -- adds three columns into one

SELECT CONCAT_WS(' ', last_name, first_name, date_of_birth) -- This is a shortcut of code above, don't have to keep retyping.

INSERT INTO actors (first_name, last_name, gender, date_of_birth) VALUES ('Malin','Akerman','F','1978-05-12'),
('Tim','Allen','M','1953-06-13'),
('Julie','Andrews','F','1935-10-01'),
('Ivana','Baquero','F','1994-06-11'),
('Lorraine','Bracco','F','1954-10-02'),
('Alice','Braga','F','1983-04-15'),
('Marlon','Brando','M','1924-04-03'),
('Adrien','Brody','M','1973-04-14'),
('Peter','Carlberg','M','1950-12-08'),
('Gemma','Chan','F','1982-11-29'),
('Chen','Chang','M','1976-10-14'),
('Graham','Chapman','M','1941-01-08'),
('Pei-pei','Cheng','F','1946-12-04'),
('Maggie ','Cheung','F','1964-09-20'),
('Min-sik','Choi','M','1962-05-30'),
('Yun-fat','Chow','M','1955-05-18'),
('John','Cleese','M','1939-10-27'),
('Paddy','Considine','M','1973-09-05'),
('Abbie','Cornish','F','1982-08-07'),
('Brian','Cox','M','1946-06-01'),
('Scatman','Crothers','M','1910-05-23'),
('Russell','Crowe','M','1964-04-07'),
('Tom','Cruise','M','1962-07-03'),
('Darlan','Cunha','M','1988-07-26'),
('Willem','Dafoe','M','1955-07-22'),
('Paul','Dano','M','1984-06-19'),
('Daniel','Day-Lewis','M','1957-04-29'),
('Robert','De Niro','M','1943-08-17'),
(null,'Denden','M','1950-01-23'),
('Leonardo','DiCaprio','M','1974-11-11'),
('Peter','Dinklage','M','1969-06-11'),
('Hiroki','Doi','M','1999-08-10'),
('Kirsten','Dunst','F','1982-04-30'),
('Shelley','Duvall','F','1949-07-07'),
('Ralph','Fiennes','M','1962-12-22'),
('Leandro','Firmino','M','1978-06-23'),
('Carrie','Fisher','F','1956-10-21'),
('Harrison','Ford','M','1942-07-13'),
('Jodie','Foster','F','1962-11-19'),
('James','Franco','M','1978-04-19'),
('Dillon','Freasier','M','1996-03-06'),
('Tatsuya','Fujiwara','M','1982-05-15'),
('Mitsuru','Fukikoshi','M','1965-02-17'),
('Clark','Gable','M','1901-02-01'),
('Mason','Gamble','M','1986-01-16'),
('Xian','Gao','M',null),
('Andrew','Garfield','M','1983-08-20'),
('Judy','Garland','F','1922-06-10'),
('Martina','Gedeck','F','1961-09-14'),
('Jeff','Goldblum','M','1952-10-22'),
('Carla','Gugino','F','1971-08-29'),
('Alec','Guiness','M','1914-04-02'),
('Jackey','Haley','M','1961-07-14'),
('Mark','Hamill','M','1951-09-25'),
('Tom','Hanks','M','1956-07-09'),
('Daryl','Hannah','F','1958-12-03'),
('Woody','Harrelson','M','1961-07-23'),
('Rutger','Hauer','M','1944-01-23'),
('Sally','Hawkins','F','1976-04-27'),
('Kare','Hedebrant','M','1995-06-28'),
('Rumi','Hiiragi','F','1987-08-01'),
('Ian','Holm','M','1931-09-12'),
('Dennis','Hopper','M','1936-05-17'),
('Eric','Idle','M','1943-03-29'),
('Miyu','Irino','M','1988-02-19'),
('Samuel','Jackson','M','1948-12-21'),
('Terry','Jones','M','1942-02-01'),
('Milla','Jovovich','F','1975-12-17'),
('Megumi','Kagurazaka','F','1981-09-28'),
('Takeshi','Kaneshiro','M','1973-10-11'),
('Hei-Jung','Kang','F','1982-01-04'),
('Irfan','Khan','M','1967-01-07'),
('Nicole','Kidman','F','1967-06-20'),
('Val','Kilmer','M','1959-12-31'),
('Takeshi','Kitano','M','1947-01-18'),
('Keira','Knightley','F','1985-03-26'),
('Sebastian','Koch','M','1962-05-31'),
('Asuka','Kurosawa','F','1971-12-22'),
('Andy','Lau','M','1961-09-27'),
('Jude','Law','M','1972-12-29'),
('Lina','Leandersson','F','1995-09-27'),
('Bruce','Lee','M','1940-11-27'),
('Vivien','Leigh','F','1913-11-05'),
('Tony','Leung','M','1962-06-27'),
('Ray','Liotta','M','1954-12-18'),
('Danny','Lloyd','M','1972-10-13'),
('Sihung','Lung','M','1930-01-01'),
('Aki','Maeda','F','1985-07-11'),
('Tobey','Maguire','M','1975-06-27'),
('Francis','McDormand','F','1957-06-23'),
('Malcolm','McDowell','M','1943-06-13'),
('Alfred','Molina','M','1953-05-24'),
('Cathy','Moriarty','F','1960-11-29'),
('Ulrich','Muhe','M','1953-06-20'),
('Carey','Mulligan','F','1985-05-28'),
('Bill','Murray','M','1950-09-21'),
('Mari','Natsuki','F','1952-05-02'),
('Jack','Nicholson','M','1937-04-22'),
('Connie','Nielsen','F','1965-07-03'),
('Ika','Nord','F','1960-04-29'),
('Chuck','Norris','M','1940-03-10'),
('Edward','Norton','M','1969-08-18'),
('Gary','Oldman','M','1958-03-21'),
('Yasmin','Paige','F','1991-06-24'),
('Michael','Palin','M','1943-05-05'),
('Rebecca','Pan','F','1931-12-29'),
('Joe','Pesci','M','1943-02-09'),
('Joaquin','Phoenix','M','1974-10-28'),
('Natilie','Portman','F','1981-06-09'),
('Per','Ragnar','M','1941-05-29'),
('Oliver','Reed','M','1938-02-13'),
('Jean','Reno','M','1948-07-30'),
('Tony','Revolori','M','1996-04-28'),
('Craig','Roberts','M','1991-01-21'),
('Sam','Rockwell','M','1968-11-05'),
('Alexandre','Rodrigues','M','1983-05-21'),
('Saoirse','Ronan','F','1994-04-12'),
('Roy','Scheider','M','1932-11-10'),
('Jason','Schwartzmann','M','1980-06-26'),
('Suraj','Sharma','M','1993-03-21'),
('Martin','Sheen','M','1940-08-03'),
('Douglas','Silva','M','1988-09-27'),
('Dandan','Song','F','1961-08-25'),
('Rafe','Spall','M','1983-03-10'),
('Tilda','Swinton','F','1960-11-05'),
('George','Tokoro','M','1955-01-26'),
('Noah','Taylor','M','1969-09-04'),
('Uma','Thurman','F','1970-04-29'),
('John','Travolta','M','1954-02-18'),
('Chris','Tucker','M','1971-08-31'),
('Dick','Van Dyke','M','1925-12-13'),
('Hugo','Weaving','M','1960-04-04'),
('Olivia','Williams','F','1968-07-26'),
('Mykelti','Williamson','M','1957-03-04'),
('Bruce','Willis','M','1955-03-19'),
('Luke','Wilson','M','1971-09-21'),
('Owen','Wilson','M','1968-11-18'),
('Patrick','Wilson','M','1973-07-03'),
('Kate','Winslet','F','1975-10-05'),
('Faye','Wong','F','1969-08-08'),
('Robin','Wright','F','1966-04-08'),
('Michelle','Yeoh','F','1962-08-06'),
('Ji-tae','Yoo','M','1976-04-13'),
('Jin-seo','Yoon','F','1983-08-05'),
('Sean','Young','F','1959-11-20'),
('Billy','Zane','M','1966-02-24'),
('Ziyi','Zhang','F','1979-02-09');

INSERT INTO movies (movie_name, movie_length, movie_lang, release_date, age_certificate, director_id) VALUES ('A Clockwork Orange','112','English','1972-02-02','18','13'),
('Apocalypse Now','168','English','1979-08-15','15','9'),
('Battle Royale ','111','Japanese','2001-01-04','18','10'),
('Blade Runner ','121','English','1982-06-25','15','27'),
('Chungking Express','113','Chinese','1996-08-03','15','35'),
('City of God','145','Portuguese','2003-01-17','18','20'),
('City of Men','140','Portuguese','2008-02-29','15','22'),
('Cold Fish','108','Japanese','2010-09-12','18','30'),
('Crouching Tiger Hidden Dragon','139','Chinese','2000-07-06','12','15'),
('Eyes Wide Shut','130','English','1999-07-16','18','13'),
('Forrest Gump','119','English','1994-07-06','PG','36'),
('Gladiator','165','English','2000-05-05','15','27'),
('Gone with the Wind','123','English','1939-12-15','PG','8'),
('Goodfellas','148','English','1990-09-19','15','26'),
('Grand Budapest Hotel','117','English','2014-07-03','PG','3'),
('House of Flying Daggers','134','Chinese','2004-03-12','12','37'),
('In the Mood for Love','124','Chinese','2001-02-02','12','35'),
('Jaws','134','English','1975-06-20','12','31'),
('Leon','123','English','1994-11-18','15','5'),
('Let the Right One In','128','Swedish','2008-10-24','15','1'),
('Life of Brian','126','English','1979-08-17','15','12'),
('Life of Pi','129','English','2012-11-21','PG','15'),
('Mary Poppins','87','English','1964-08-29','U','32'),
('Never Let Me Go','117','English','2010-09-15','15','25'),
('Oldboy','130','Korean','2005-03-25','18','23'),
('Pans Labyrinth','98','Spanish','2006-12-29','PG','7'),
('Ponyo','107','Japanese','2009-08-14','U','21'),
('Pulp Fiction','136','English','1994-10-14','15','33'),
('Raging Bull','132','English','1980-11-14','18','26'),
('Rushmore','104','English','1998-11-12','12','3'),
('Spider-Man','118','English','2002-05-03','PG','24'),
('Spider-Man 2','115','English','2004-06-30','PG','24'),
('Spider-Man 3','112','English','2007-05-04','PG','24'),
('Spirited Away','120','Japanese','2001-06-19','U','21'),
('Star Wars: A New Hope','123','English','1977-05-25','PG','17'),
('Star Wars: Empire Strikes Back','150','English','1980-05-21','PG','17'),
('Star Wars: Return of the Jedi','139','English','1983-05-25','PG','17'),
('Submarine','115','English','2011-06-03','15','4'),
('Taxi Driver','117','English','1976-02-7','15','26'),
('The Darjeeling Limited','119','English','2007-09-29','PG','3'),
('The Fifth Element','149','English','1997-05-09','12','5'),
('The Lives of Others','165','German','2007-02-09','15','11'),
('The Shining','126','English','1980-05-23','18','13'),
('The Sound of Music','91','English','1965-03-02','U','34'),
('The Wizard of Oz','120','English','1939-08-25','U','8'),
('There Will Be Blood','168','English','2007-12-26','15','2'),
('Three Billboards Outside Ebbing, Missouri ','134','English','2017-11-10','15','18'),
('Titanic','143','English','1997-12-19','12','6'),
('Top Gun','121','English','1986-05-16','12','28'),
('Toy Story','95','English','1995-11-22','U','14'),
('V for Vendetta','140','English','2006-03-17','12','19'),
('Watchmen','138','English','2009-03-06','12','29'),
('Way of the Dragon ','99','Chinese','1972-06-01','12','16');


INSERT INTO directors (first_name, last_name, date_of_birth, nationality) VALUES ('Tomas','Alfredson','1965-04-01','Swedish'),
('Paul','Anderson','1970-06-26','American'),
('Wes','Anderson','1969-05-01','American'),
('Richard','Ayoade','1977-06-12','British'),
('Luc','Besson','1959-03-18','French'),
('James','Cameron','1954-08-16','American'),
('Guillermo','del Toro','1964-10-09','Mexican'),
('Victor','Fleming','1889-02-23','American'),
('Francis','Ford Coppola','1939-04-07','American'),
('Kinji','Fukasaku','1930-07-03','Japanese'),
('Florian ','Henckel von Donnersmarck','1973-05-02','German'),
('Terry','Jones','1942-02-01','British'),
('Stanley','Kubrick','1928-07-26','American'),
('John','Lasseter','1957-01-12','American'),
('Ang','Lee','1954-10-23','Chinese'),
('Bruce','Lee','1940-11-27','Chinese'),
('George','Lucas','1944-05-14','American'),
('Martin','McDonagh','1970-03-26','British'),
('James','McTeigue','1967-12-29','Australian'),
('Fernando','Meirelles','1955-11-09','Brazilian'),
('Hayao ','Miyazaki','1941-01-05','Japanese'),
('Paulo','Morelli','1966-03-10','Brazilian'),
('Chan-wook','Park','1963-08-23','South Korean'),
('Sam','Raimi','1959-10-23','American'),
('Mark','Romanek','1959-09-18','American'),
('Martin','Scorsese','1942-11-17','American'),
('Ridley','Scott','1937-11-30','British'),
('Tony','Scott','1944-06-21','British'),
('Zack','Snyder','1966-03-01','American'),
('Sion','Sono','1961-12-18','Japanese'),
('Steven','Spielberg','1946-12-18','American'),
('Robert','Stevenson','1905-03-31','British'),
('Quentin','Tarantino','1963-03-27','American'),
('Robert','Wise','1914-09-10','American'),
('Kar Wai','Wong','1958-07-17','Chinese'),
('Robert','Zemeckis','1952-05-14','American'),
('Yimou','Zhang','1950-04-02','Chinese');


CREATE TABLE movies(
movie_id SERIAL PRIMARY KEY,
movie_name VARCHAR(50),
movie_length INT,
movie_lang VARCHAR(20),
release_date DATE,
age_certificate VARCHAR(5),
director_id INT REFERENCES directors(director_id)
);


CREATE TABLE movies_actors(
movie_id SERIAL,
CONSTRAINT fk_movie FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
actor_id SERIAL,
CONSTRAINT fk_actor FOREIGN KEY(actor_id) REFERENCES actors(actor_id),
PRIMARY KEY(movie_id, actor_id)
	);
	
	
INSERT INTO movie_actors (actor_id, movie_id) VALUES ('1','52'),
('2','50'),
('3','23'),
('4','26'),
('5','14'),
('6','6'),
('7','2'),
('8','15'),
('8','40'),
('9','20'),
('10','38'),
('11','9'),
('12','21'),
('13','9'),
('14','17'),
('15','25'),
('16','9'),
('17','21'),
('18','38'),
('19','47'),
('20','30'),
('21','43'),
('22','12'),
('23','10'),
('23','49'),
('24','7'),
('25','15'),
('25','31'),
('25','32'),
('25','33'),
('26','46'),
('27','46'),
('28','14'),
('28','29'),
('28','39'),
('29','8'),
('30','48'),
('31','47'),
('32','27'),
('33','31'),
('33','32'),
('33','33'),
('34','43'),
('35','15'),
('36','6'),
('37','35'),
('37','36'),
('37','37'),
('38','2'),
('38','4'),
('38','35'),
('38','36'),
('38','37'),
('39','39'),
('40','31'),
('40','32'),
('40','33'),
('41','46'),
('42','3'),
('43','8'),
('44','13'),
('45','30'),
('46','9'),
('47','24'),
('48','45'),
('49','42'),
('50','15'),
('51','52'),
('52','35'),
('53','52'),
('54','35'),
('54','36'),
('54','37'),
('55','11'),
('55','50'),
('56','4'),
('57','47'),
('58','4'),
('59','24'),
('59','38'),
('60','20'),
('61','27'),
('61','34'),
('62','41'),
('63','2'),
('64','21'),
('65','34'),
('66','28'),
('67','21'),
('68','41'),
('69','10'),
('70','5'),
('70','16'),
('71','25'),
('72','22'),
('73','10'),
('74','49'),
('75','3'),
('76','24'),
('77','42'),
('78','8'),
('79','16'),
('80','15'),
('81','20'),
('82','53'),
('83','13'),
('84','5'),
('84','17'),
('85','14'),
('86','43'),
('87','9'),
('88','3'),
('89','31'),
('89','32'),
('89','33'),
('90','47'),
('91','1'),
('92','32'),
('93','29'),
('94','42'),
('95','24'),
('96','15'),
('96','30'),
('97','34'),
('98','43'),
('99','12'),
('100','20'),
('101','53'),
('102','15'),
('103','19'),
('103','41'),
('104','38'),
('105','21'),
('106','17'),
('107','14'),
('107','29'),
('108','12'),
('109','19'),
('109','51'),
('110','20'),
('111','12'),
('112','19'),
('113','15'),
('114','38'),
('115','47'),
('116','6'),
('117','15'),
('118','18'),
('119','15'),
('119','40'),
('120','22'),
('121','2'),
('122','7'),
('123','16'),
('124','22'),
('125','15'),
('126','27'),
('127','38'),
('128','28'),
('129','28'),
('130','41'),
('131','33'),
('132','51'),
('133','15'),
('134','11'),
('135','28'),
('135','41'),
('136','30'),
('137','15'),
('137','40'),
('138','52'),
('139','48'),
('140','5'),
('141','11'),
('142','9'),
('143','25'),
('144','25'),
('145','4'),
('146','48'),
('147','9'),
('147','16');

CREATE TABLE movie_revenues(
	revenue_id SERIAL PRIMARY KEY,
	movie_id INT REFERENCES movies (movie_id),
	domestic_takings NUMERIC(6,2),
	international_takings NUMERIC (6,2)
);


INSERT INTO movie_revenues (revenue_id, movie_id, domestic_takings, international_takings) VALUES ('1','45','22.2','1.3'),
('2','13','199.4','201.2'),
('3','23','102.1',null),
('4','44','158.7',null),
('6','1','27.1',null),
('7','53',null,null),
('17','18','260.3','210.9'),
('9','39','28.1',null),
('5','35','461.2','314.2'),
('13','2','83.4',null),
('15','21','19.6',null),
('8','36','290.3','247.8'),
('11','43','44.1',null),
('12','29','23.1',null),
('14','4','33.3',null),
('10','37','309.1','166.2'),
('16','49','180.1','177.3'),
('18','14','46.6',null),
('21','11','330.3','348.1'),
('20','28','107.9','106.2'),
('19','19',null,null),
('23','50','192.1','182.4'),
('22','5',null,null),
('27','41','64.1','200.3'),
('24','48','659.2','1528.1'),
('25','30','16.9',null),
('26','10','55.7','106.3'),
('30','12','188.2','273.4'),
('28','9','128.1','85.1'),
('29','3',null,null),
('32','17','2.9','10.2'),
('31','34','11.1','265.4'),
('33','31','404.1','418.1'),
('37','6','8.2','23.5'),
('35','16','11.1','82.5'),
('36','32','374.1','410.4'),
('34','25','1.1','13.8'),
('38','51','71.2','62.5'),
('40','26','37.8','46.4'),
('48','42','11.3','66.1'),
('39','33','337','554'),
('51','40','11.9','23.2'),
('41','46','39.9','35.8'),
('42','7','0.3','2.2'),
('49','20','2.1','9.1'),
('45','52','107.5','77.5'),
('44','27','15.1','186.7'),
('47','8',null,null),
('46','24','2.4','7.1'),
('43','38','0.5','0.4'),
('50','22','124.9','484.1'),
('52','15','59.3','115.5'),
('53','47','54.5','104.7');


SELECT * FROM movies

select * from movie_revenues



INSERT INTO movies_actors (actor_id, movie_id) VALUES ('1','52'),
('2','50'),
('3','23'),
('4','26'),
('5','14'),
('6','6'),
('7','2'),
('8','15'),
('8','40'),
('9','20'),
('10','38'),
('11','9'),
('12','21'),
('13','9'),
('14','17'),
('15','25'),
('16','9'),
('17','21'),
('18','38'),
('19','47'),
('20','30'),
('21','43'),
('22','12'),
('23','10'),
('23','49'),
('24','7'),
('25','15'),
('25','31'),
('25','32'),
('25','33'),
('26','46'),
('27','46'),
('28','14'),
('28','29'),
('28','39'),
('29','8'),
('30','48'),
('31','47'),
('32','27'),
('33','31'),
('33','32'),
('33','33'),
('34','43'),
('35','15'),
('36','6'),
('37','35'),
('37','36'),
('37','37'),
('38','2'),
('38','4'),
('38','35'),
('38','36'),
('38','37'),
('39','39'),
('40','31'),
('40','32'),
('40','33'),
('41','46'),
('42','3'),
('43','8'),
('44','13'),
('45','30'),
('46','9'),
('47','24'),
('48','45'),
('49','42'),
('50','15'),
('51','52'),
('52','35'),
('53','52'),
('54','35'),
('54','36'),
('54','37'),
('55','11'),
('55','50'),
('56','4'),
('57','47'),
('58','4'),
('59','24'),
('59','38'),
('60','20'),
('61','27'),
('61','34'),
('62','41'),
('63','2'),
('64','21'),
('65','34'),
('66','28'),
('67','21'),
('68','41'),
('69','10'),
('70','5'),
('70','16'),
('71','25'),
('72','22'),
('73','10'),
('74','49'),
('75','3'),
('76','24'),
('77','42'),
('78','8'),
('79','16'),
('80','15'),
('81','20'),
('82','53'),
('83','13'),
('84','5'),
('84','17'),
('85','14'),
('86','43'),
('87','9'),
('88','3'),
('89','31'),
('89','32'),
('89','33'),
('90','47'),
('91','1'),
('92','32'),
('93','29'),
('94','42'),
('95','24'),
('96','15'),
('96','30'),
('97','34'),
('98','43'),
('99','12'),
('100','20'),
('101','53'),
('102','15'),
('103','19'),
('103','41'),
('104','38'),
('105','21'),
('106','17'),
('107','14'),
('107','29'),
('108','12'),
('109','19'),
('109','51'),
('110','20'),
('111','12'),
('112','19'),
('113','15'),
('114','38'),
('115','47'),
('116','6'),
('117','15'),
('118','18'),
('119','15'),
('119','40'),
('120','22'),
('121','2'),
('122','7'),
('123','16'),
('124','22'),
('125','15'),
('126','27'),
('127','38'),
('128','28'),
('129','28'),
('130','41'),
('131','33'),
('132','51'),
('133','15'),
('134','11'),
('135','28'),
('135','41'),
('136','30'),
('137','15'),
('137','40'),
('138','52'),
('139','48'),
('140','5'),
('141','11'),
('142','9'),
('143','25'),
('144','25'),
('145','4'),
('146','48'),
('147','9'),
('147','16');

select * from movies_actors

select first_name, last_name from directors
where nationality = ('British, French, German');

select * from actors
where last_name = 'm%' and date_of_birth > '1970-01-01' -- The reason why this didn't work was because it's taking case sensitive lower-case m.

SELECT first_name, last_name, nationality, date_of_birth -- A #3
FROM DIRECTORS
WHERE nationality IN ('French', 'German', 'British')
AND date_of_birth BETWEEN '1950-01-01' AND '1980-12-31';

SELECT * FROM movies
WHERE movie_lang IN ('English', 'Spanish', 'Korean'); -- A - #1


SELECT first_name, last_name, date_of_birth FROM actors -- #A)2)
WHERE last_name LIKE 'M%' 
AND date_of_birth BETWEEN '01/01/1940' AND '12/31/1969';



select first_name, last_name, date_of_birth from directors
where nationality = ('American') ORDER BY date_of_birth ASC; -- B)1)

SELECT DISTINCT nationality FROM directors; -- b/2

SELECT DISTINCT first_name, last_name, date_of_birth FROM actors -- B #3
WHERE gender = 'F' ORDER BY date_of_birth DESC
LIMIT 10;

SELECT international_takings,revenue_id, movie_id  FROM movie_revenues
ORDER BY international_takings DESC; --C #1


SELECT CONCAT(first_name,' ',last_name) AS full_naem FROM directors-- this combines two columns into one
ORDER BY full_naem ASC -- adds three columns into one // TTHIS IS QUESTION C #2

SELECT * from actors
SELECT (first_name + date_of_birth)
WHERE first_name IS NULL;


-- Joining Tables
-- inner join, left join, right join, full join -- some examples of joining tables


SELECT 

INSERT INTO directors (first_name, last_name, date_of_birth, nationality)
VALUES ('Christopher', 'Nolan', '1978-07-30', 'British') -- added a value into directors

SELECT * FROM directors
Where nationality = 'British' -- then you can find him into the database.


SELECT directors.director_id, directors.first_name, directors.last_name, movies.movie_name, movies.movie_lang
FROM directors 
INNER JOIN movies
ON directors.director_id = movies.director_id
WHERE movies.movie_lang = 'English'
ORDER BY movies.movie_length;

SELECT directors.director_id, directors.first_name || directors.last_name AS director_NAME, movies.movie_name, movies.movie_length
FROM directors 
INNER JOIN movies
ON directors.director_id = movies.director_id
WHERE movies.movie_lang = 'Japanese'
ORDER BY movies.movie_length;


SELECT m.movie_name, r.domestic_takings, r.international_takings --shortcut on how to type this all out, have to declare it 
FROM movies AS m
JOIN movie_revenues r -- this just makes movie_revenues = r
ON m.movie_id = r.movie_id -- here you are declaring the variables as shorter names
WHERE r.domestic_takings IS NOT NULL
ORDER BY r.domestic_takings DESC -- this was for the assignment

SELECT m.movie_name, r.domestic_takings, r.international_takings --shortcut on how to type this all out, have to declare it 
FROM movies AS m
JOIN movie_revenues r -- this just makes movie_revenues = r
ON m.movie_id = r.movie_id -- here you are declaring the variables as shorter names
WHERE r.domestic_takings IS NOT NULL AND r.domestic_takings BETWEEN 400 AND 600 AND r.international_takings BETWEEN 100 AND 900-- another requirement just as an example
ORDER BY r.domestic_takings DESC -- this was for the assignment


SELECT m.movie_name, r.domestic_takings FROM
movies m JOIN movie_revenues r
ON m.movie_id = r.movie_id
WHERE m.age_certificate IN ('12', '15', '18') IS NOT NULL
ORDER BY r.international_takings DESC -- another example of shortcuts\


SELECT COUNT date_of_birth FROM actors
WHERE date_of_birth > '1970-01-01'

--Use a left join to select teh first and last names of all British directors and the names and age
--certificates of teh movies that they directed.

--Count the number of movies that each director has directed


SELECT d.first_name, d.last_name, COUNT (mo.movie_id) FROM directors d -- order by count
LEFT JOIN movies mo ON d.director_id = mo.director_id
WHERE mo.movie_lang= 'English'
GROUP BY d.first_name, d.last_name

----Join more than 2 tables-----

-- SELECT t1.column, t2.column, t3.column FROM table1 t1
-- JOIN table2 t2 ON t1.column = t2.column
-- JOIN table3 t3 ON t2.column = t1.column

SELECT d.first_name, d.last_name, mo.movie_name, r.international_takings, r.domestic_takings
FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
JOIN movie_revenues r ON r.movie_id = mo.movie_id
WHERE mo.movie_lang = 'English'
ORDER BY last_name, first_name, domestic_takings;

SELECT d.first_name, d.last_name, mo.movie_name, ac.first_name, ac.last_name, r.international_takings, r.domestic_takings
FROM directors d
JOIN movies mo ON d.director_id= mo.director_id
JOIN movie_revenues r ON r.movie_id=mo.movie_id -- Multiple Tables in 1
JOIN movies_actors mo_ac ON mo_ac.movie_id=mo.movie_id
JOIN actors ac ON ac.actor_id = mo_ac.actor_id



SELECT first_name, last_name FROM directors
UNION ALL
SELECT first_name, last_name FROM actors

-- WHO IS BOTH DIRECTOR AND ACTOR?

SELECT d.first_name, d.last_name FROM directors d -- Answers question above. If you want them listed once do SELECT DISTINCT
JOIN actors ac ON ac.first_name=d.first_name AND ac.last_name=d.last_name

SELECT first_name, last_name, nationality FROM directors
WHERE nationality = 'American'
UNION ALL
SELECT first_name, last_name, gender FROM actors
WHERE gender = 'F';



-- except-- you only want to see a specific part

SELECT first_name, last_name FROM directors
EXCEPT
SELECT first_name, last_name FROM actors -- this excludes teh first,last  name from actors

SELECT first_name, last_name FROM directors -- this shows the actors that are both directors and actors
INTERSECT
SELECT first_name, last_name FROM actors


SELECT first_name FROM actors
WHERE gender = 'M'
EXCEPT
SELECT first_name FROM directors
WHERE nationality = 'British'

SELECT d.first_name, d.last_name, COUNT (mo.movie_id) FROM directors d -- order by count
LEFT JOIN movies mo ON d.director_id = mo.director_id
WHERE mo.movie_lang= 'English'
GROUP BY d.first_name, d.last_name

SELECT COUNT (first_name) 
FROM actors
WHERE date_of_birth > '01-01-1970'


SELECT MAX(domestic_takings) FROM movie_revenues
SELECT MIN(domestic_takings) FROM movie_revenues

SELECT MIN(domestic_takings), MAX(domestic_takings)
FROM movie_revenues

SELECT SUM(movie_length) from movies
WHERE age_certificate > '15';


SELECT DISTINCT * FROM directors
WHERE nationality = 'Japanese';

SELECT AVG (movie_length) FROM movies
WHERE movie_lang = 'Chinese';

SELECT COUNT(DISTINCT nationality) 
from directors;

SELECT d1.first_name, d1.last_name 
FROM directors d1
WHERE date_of_birth > '1970-04-01'

(SELECT MIN(date_of_birth)FROM directors d2
WHERE d2.nationality = d1.nationality); -- not sure why not working


SELECT movie_name, movie_length FROM movies
WHERE movie_length > (SELECT AVG (movie_length) FROM movies)
ORDER BY movie_length DESC

SELECT first_name, last_name, date_of_birth FROM directors
WHERE date_of_birth >
(SELECT date_of_birth FROM directors WHERE first_name ='Sam' AND last_name ='Raimi')
ORDER BY date_of_birth

SELECT first_name, last_name, date_of_birth FROM directors
ORDER BY date_of_birth
WHERE first_name ='Sam' AND last_name = 'Raimi'


SELECT MIN(movie_length), MAX(movie_length) FROM movies

SELECT AVG(domestic_takings) FROM movie_revenues

--Coorelated Subqueries--

SELECT d.first_name, d.last_name, d.date_of_birth
FROM directors d
WHERE d.date_of_birth=
(SELECT MIN(date_of_birth) FROM directors)

SELECT mo.movie_length, mo.

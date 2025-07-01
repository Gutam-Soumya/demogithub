#select Query
#=============
SELECT title FROM Movies;
SELECT director FROM Movies;
SELECT title, director FROM Movies;
SELECT title, year FROM Movies;
SELECT * FROM Movies;

#Queries with constraints-pt-1
#===============================
SELECT * FROM movies WHERE id = 6;
SELECT * FROM movies WHERE year BETWEEN 2000 and 2010;
SELECT * FROM movies WHERE year NOT BETWEEN 2000 and 2010;
SELECT title, year FROM movies LIMIT 5;

#Queries with constraints-pt-2
#=============================
SELECT * FROM movies WHERE title LIKE "Toy Story%";
SELECT * FROM movies WHERE director = "John Lasseter";
SELECT * FROM movies WHERE director != "%John Lasseter%";
SELECT * FROM movies WHERE title LIKE "WALL%"

#Filtering and sorting Query results
#=====================================
SELECT distinct director FROM movies ORDER BY director ASC;
SELECT * FROM movies ORDER BY year DESC LIMIT 4;
SELECT * FROM movies ORDER BY title ASC LIMIT 5;
SELECT * FROM movies ORDER BY title ASC LIMIT 5 offSET 5;

#Simple SELECT Queries
#====================
SELECT * FROM North_american_cities WHERE country = "Canada";
SELECT * FROM north_american_cities WHERE country = "United States" ORDER BY latitude DESC;
SELECT * FROM north_american_cities WHERE longitude < -87.629798 ORDER BY longitude ASC;
SELECT * FROM north_american_cities WHERE country = "Mexico" ORDER BY population DESC LIMIT 2;
SELECT * FROM North_american_cities WHERE country="United States" ORDER BY population DESC LIMIT 2 offSET 2;

#Multi-table queries with joins
#==============================
SELECT m.title, b.domestic_sales, b.international_sales FROM Movies m
JOIN Boxoffice b on m.id = b.movie_id;
SELECT m.title, b.domestic_sales, b.international_sales FROM Movies m
JOIN Boxoffice b on m.id = b.movie_id WHERE b.international_sales > b.domestic_sales;
SELECT m.title, b.rating FROM Movies m
JOIN Boxoffice b on m.id = b.movie_id ORDER BY b.rating desc;

#OUTER JOINs
#============
SELECT distinct building FROM employees;
SELECT building_name,capacity FROM buildings;
SELECT b.building_name, e.role FROM buildings b
JOIN employees e ON b.building_name = e.building
GROUP BY b.building_name, e.role ORDER BY b.building_name;

#Short note on NULLs
#======================
SELECT name, role FROM employees WHERE building is null;
SELECT b.building_name FROM buildings b
JOIN employees e ON b.building_name = e.building WHERE building is null;


#Queries with expressions
#========================
SELECT m.Title,round((b.Domestic_sales + b.International_sales)/1000000.0 ,2)as combined_sales FROM Movies m JOIN Boxoffice b on m.id= b.movie_id;
SELECT m.Title,b.rating*10 as rating_percent FROM Movies m JOIN Boxoffice b on m.id= b.movie_id;
SELECT title , year FROM movies WHERE year%2 = 0;

#Queries with aggregates-pt-1
SELECT max(years_employed) as longest_year_at_studio FROM employees;
SELECT role,round(avg(years_employed),2) as avg_years_emp FROM employees GROUP BY role;
SELECT building,sum(years_employed) FROM employees GROUP BY building;

#Queries with aggregates-pt-2
#============================
SELECT COUNT(*) AS artist_count FROM employees WHERE role = 'Artist';
SELECT role,COUNT(*) AS employee_count FROM employees GROUP BY role;
SELECT SUM(years_employed) AS total_engineer_years FROM employees
WHERE role = 'Engineer';


#Order of execution of a query
#=============================
SELECT director,COUNT(*) AS Movies_directed FROM Movies GROUP BY director;
SELECT m. Director, SUM (b. Domestic_sales + b. International_sales) AS total_ combined_ sales FROM Movies m
JOIN Boxoffice b ON m. Id = b. Movie_ id GROUP BY m. Director;


#Inserting rows
#==============
INSERT INTO Movies (id, title, director, year, length_minutes) VALUES (15, 'Toy Story 4', 'Josh Cooley', 2019, 100);
INSERT INTO Boxoffice (movie_id, rating, domestic_sales, international_sales)
VALUES (15, 8.7, 340000000, 270000000);

#Updating rows
#=============
UPDATE Movies SET director = 'John Lasseter' WHERE title = 'A Bug''s Life';
UPDATE Movies SET year =1999 WHERE title = 'Toy Story 2';
UPDATE Movies SET title = 'Toy Story 3',director = 'Lee Unkrich’ WHERE title = 'Toy Story 8';

#Deleting rows
#=============
DELETE FROM Movies WHERE year < 2005;
DELETE FROM movies WHERE director = "Andrew Stanton";

#alter the table
#===============
ALTER TABLE Movies ADD COLUMN Aspect_ratio FLOAT;
ALTER TABLE Movies ADD COLUMN language text default "English";

#drop the table
#==============
DROP table Movies;
DROP table Boxoffice;

#Creating a table
#=================
CREATE TABLE Database (Name TEXT, Version REAL, Download_count INTEGER);
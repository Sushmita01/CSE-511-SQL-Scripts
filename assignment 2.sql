CREATE TABLE query1 AS
SELECT genres.name, count(hasagenre.movieid) as moviecount
FROM  hasagenre JOIN genres ON hasagenre.genreid = genres.genreid
GROUP BY genres.name;


CREATE TABLE query2 AS
SELECT genres.name, AVG(ratings.rating) AS rating
FROM  hasagenre JOIN genres ON hasagenre.genreid = genres.genreid JOIN ratings ON hasagenre.movieid = ratings.movieid
GROUP BY genres.name;


CREATE TABLE query3 AS
SELECT movies.title, COUNT(ratings.rating) as countofratings
FROM  movies JOIN ratings ON movies.movieid = ratings.movieid
GROUP BY movies.title HAVING COUNT(ratings.rating)>=10;


CREATE TABLE query4 AS
SELECT movies.movieid, movies.title
FROM  movies JOIN hasagenre ON movies.movieid = hasagenre.movieid 
JOIN genres ON hasagenre.genreid = genres.genreid
WHERE genres.name = "Comedy";


CREATE TABLE query5 AS
SELECT movies.title, AVG(ratings.rating) as average
FROM  movies JOIN ratings ON movies.movieid = ratings.movieid
GROUP BY movies.title;


CREATE TABLE query6 AS
SELECT AVG(ratings.rating) AS average
FROM  movies JOIN ratings ON movies.movieid = ratings.movieid 
JOIN hasagenre ON movies.movieid = hasagenre.movieid
JOIN genres ON hasagenre.genreid = genres.genreid
WHERE genres.name = "Comedy"
GROUP BY genres.name;


CREATE TABLE query7 AS
SELECT AVG(ratings.rating) as average
FROM  movies JOIN hasagenre ON movies.movieid = hasagenre.movieid 
JOIN ratings ON movies.movieid = ratings.movieid
JOIN genres ON hasagenre.genreid = genres.genreid
WHERE genres.name = "Comedy" AND movies.movieid IN 
(SELECT movies.movieid 
FROM  movies JOIN hasagenre ON movies.movieid = hasagenre.movieid 
JOIN genres ON hasagenre.genreid = genres.genreid
WHERE genres.name = "Romance");


CREATE TABLE query8 AS
SELECT AVG(ratings.rating) as average
FROM  movies JOIN hasagenre ON movies.movieid = hasagenre.movieid 
JOIN ratings ON movies.movieid = ratings.movieid
JOIN genres ON hasagenre.genreid = genres.genreid
WHERE genres.name = "Romance" AND movies.movieid NOT IN 
(SELECT movies.movieid 
FROM  movies JOIN hasagenre ON movies.movieid = hasagenre.movieid 
JOIN genres ON hasagenre.genreid = genres.genreid
WHERE genres.name = "Comedy");


CREATE TABLE query9 AS
SELECT ratings.movieid, ratings.rating
FROM users JOIN ratings ON users.userid = ratings.userid
WHERE users.userid = :v1;

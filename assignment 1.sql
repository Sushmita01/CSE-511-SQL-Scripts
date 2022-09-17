CREATE TABLE users( 
userid INT unsigned NOT NULL,  
name VARCHAR(255) NOT NULL, 
PRIMARY KEY (userid) );



CREATE TABLE movies(
movieid INT unsigned NOT NULL, 
title VARCHAR(255) NOT NULL,
PRIMARY KEY (movieid)
);



CREATE TABLE taginfo(
tagid INT unsigned NOT NULL, 
content VARCHAR(255) NOT NULL,
PRIMARY KEY (tagid)
);



CREATE TABLE genres(
genreid INT unsigned NOT NULL, 
name VARCHAR(255) NOT NULL,
PRIMARY KEY (genreid)
);



CREATE TABLE ratings(
userid INT unsigned NOT NULL, 
movieid INT unsigned NOT NULL, 
rating NUMERIC(3,2) NOT NULL CONSTRAINT CHK_rating CHECK (rating>= 0 AND 
rating <= 5),
timestamp BIGINT NOT NULL,
PRIMARY KEY (userid, movieid),
FOREIGN KEY (userid)
	REFERENCES users(userid),
FOREIGN KEY (movieid)
	REFERENCES movies(movieid)   
);



CREATE TABLE tags(
userid INT unsigned NOT NULL, 
movieid INT unsigned NOT NULL, 
tagid INT unsigned NOT NULL, 
timestamp BIGINT NOT NULL,
PRIMARY KEY (userid, movieid, tagid),
FOREIGN KEY (userid)
	REFERENCES users(userid),
FOREIGN KEY (movieid)
	REFERENCES movies(movieid),
FOREIGN KEY (tagid)
	REFERENCES taginfo(tagid) 
);



CREATE TABLE hasagenre(
movieid INT unsigned NOT NULL, 
genreid INT unsigned NOT NULL, 
PRIMARY KEY (movieid, genreid),
FOREIGN KEY (movieid)
	REFERENCES movies(movieid),
FOREIGN KEY (genreid)
	REFERENCES genres(genreid)
);



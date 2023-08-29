-- Exercise 2

SELECT name AS 'Band Name' FROM bands;

-- Exercise 3

SELECT * FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year
LIMIT 1;

-- Exercise 4

SELECT DISTINCT b.name AS 'Band Name' 
FROM bands AS b
INNER JOIN albums AS a
WHERE b.id = a.band_id;

-- Exercise 5

SELECT bands.name AS 'Band Name'
FROM bands
LEFT JOIN albums
ON albums.band_id = bands.id
WHERE albums.release_year IS NULL;

-- Exercise 6

SELECT
	albums.name AS 'Name',
    albums.release_year AS 'Release Year',
	sum(songs.length) AS 'Duration'
FROM songs
LEFT JOIN albums
ON albums.id = songs.album_id
GROUP BY albums.name, albums.release_year
ORDER BY sum(songs.length) DESC
LIMIT 1;

-- Exercise 7

UPDATE albums
SET release_year = 1986
WHERE id = 4;

-- Exercise 8

SELECT * FROM bands;
INSERT INTO bands(id,name) VALUES (8,'Tame Impala');

SELECT * FROM albums;
INSERT INTO albums(id,name,release_year,band_id) VALUES (19,'Currents',2015,8);

-- Exercise 9

DELETE FROM bands WHERE id = 8;
DELETE FROM albums WHERE id = 19;

-- Exercise 10

SELECT avg(length) AS 'Average Song Duration' FROM songs;

-- Exercise 11

SELECT 
	albums.name as 'Album',
    albums.release_year as 'Release Year',
    max(songs.length) as 'Duration'
FROM albums
JOIN songs ON albums.id = songs.album_id
GROUP BY songs.album_id;

-- Exercise 12

SELECT 
	bands.name as 'Band',
    count(songs.id) as 'Number of Songs'
FROM bands
INNER JOIN albums ON bands.id = albums.band_id
INNER JOIN songs ON albums.id = songs.album_id
GROUP BY bands.name
ORDER BY count(songs.id) DESC;

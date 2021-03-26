PRACTICE JOINS

#1
SELECT * FROM invoice
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
WHERE invoice_line.unit_price >= 0.99;

#2
SELECT invoice.invoice_date, customer.first_name, customer.last_name, total FROM invoice
JOIN customer on invoice.invoice_id = customer.customer_id

#3
SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name FROM customer
JOIN employee on customer.support_rep_id = employee.employee_id 

#4
SELECT album.title, artist.name
FROM album 
JOIN artist  ON album.artist_id = artist.artist_id;

#5
SELECT playlist_track.track_id
FROM playlist_track
JOIN playlist ON playlist_track.playlist_id = playlist.playlist_id 
WHERE playlist.name = 'Music'

#6
SELECT track.name
FROM track
JOIN playlist_track ON track.track_id = playlist_track.track_id
WHERE playlist_id = 5

#7
SELECT track.name, playlist.name
FROM track
JOIN playlist_track ON track.track_id = playlist_track.track_id
JOIN playlist ON playlist_track.playlist_id = playlist.playlist_id

#8
SELECT track.name, album.title
FROM track
JOIN album ON track.album_id = album.album_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Alternative & Punk'

NESTED QUERIES

#1
SELECT *
FROM invoice
WHERE invoice_id in (SELECT invoice_id FROM invoice_line WHERE unit_price >= 0.99)

#2
SELECT *
FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE name = 'Music')

#3
SELECT name
FROM track
WHERE track_id  IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5)

#4
SELECT *
FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy')

#5
SELECT *
FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball')

#6
SELECT *
FROM track
WHERE album_id IN ( 
  SELECT album_id FROM album WHERE artist_id IN ( 
    SELECT artist_id FROM artist WHERE name = 'Queen'
  )
); 

UPDATING ROWS

#1
UPDATE customer
SET fax = null
WHERE fax IS not null

#2
UPDATE customer
SET company = 'Self'
WHERE company IS null

#3
UPDATE customer
SET last_name = 'Thompson'
WHERE last_name = 'Barnett';
SELECT * FROM customer WHERE last_name = 'Thompson'

#4
UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';
SELECT * FROM customer WHERE support_rep_id = 4

#5
UPDATE track
SET composer = "The darkness around us"
WHERE genre_id (SELECT genre_id IN genre WHERE name = 'Metal') AND composer IS null;

GROUP BY

#1
SELECT COUNT(*), genre.name
FROM track
JOIN genre ON track.genre_id = genre.genre_id
GROUP BY genre.name

#2
select count(*), genre.name
FROM track
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Pop' OR genre.name = 'Rock'
GROUP BY genre.name

#3
SELECT artist.name, COUNT(*)
FROM album
JOIN artist ON artist.artist_id = album.artist_id
GROUP BY artist.name

DISTINCT

#1
SELECT DISTINCT composer
FROM track

#2
SELECT DISTINCT billing_postal_code
FROM invoice

#3
SELECT DISTINCT company
FROM customer

DELETE

#1
DELETE FROM practice_delete WHERE type = 'bronze'

#2
DELETE FROM practice_delete WHERE type = 'silver'

#3
DELETE FROM practice_delete WHERE value = 150




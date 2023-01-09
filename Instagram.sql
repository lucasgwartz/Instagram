SHOW DATABASES;
USE ig_clone;
SHOW TABLES;

#5 Longest Users
SELECT *
FROM users
ORDER BY created_at
LIMIT 5;

#Day Most Users Register On
SELECT DAYNAME(created_at) AS day
FROM users
GROUP BY day
LIMIT 3;

#Users with most photo uploads
SELECT COUNT(users.id),photos.user_id, users.username
FROM users
INNER JOIN photos ON photos.user_id = users.id
GROUP by users.id
ORDER BY COUNT(users.id) DESC
LIMIT 5;

#Most Likes on a Single Photo
SELECT username, photos.id, COUNT(*) as total
FROM photos
INNER JOIN likes ON likes.photo_id = photos.id
INNER JOIN users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

#Top 5 Hashtags
SELECT id, tag_name, COUNT(*) as total
FROM tags
INNER JOIN photo_tags ON photo_tags.tag_id = tags.id
GROUP by tags.id
ORDER BY total DESC
LIMIT 5;

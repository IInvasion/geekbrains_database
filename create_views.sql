-- Database views creation script.

use geekbrains;

CREATE OR REPLACE VIEW users_comments AS
SELECT
  CONCAT(users.first_name, ' ', users.last_name) AS 'user',
  comments.target_id AS target_row_id,
  target_types.name AS target_name,
  comments.body AS comment
FROM
  users
JOIN
  comments
ON
  users.id = comments.user_id
JOIN
  target_types
ON
  comments.target_type_id = target_types.id;

CREATE OR REPLACE VIEW lesson_media AS
SELECT
  lessons.name AS lesson_name,
  media.filename AS filename,
  media.size AS size,
  media_types.name AS media_type_name
FROM
  lessons
JOIN
  lessons_media
ON
  lessons.id = lessons_media.lesson_id
JOIN
  media
ON
  lessons_media.media_id = media.id
JOIN
  media_types
ON
  media.media_type_id = media_types.id;
  
SELECT * FROM lesson_media;
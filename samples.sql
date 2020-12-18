-- Database samples script.

use geekbrains;

-- Define gender who sent the most amount of comments
SELECT
  (SELECT gender FROM profiles WHERE user_id = comments.user_id) AS gender,
  COUNT(*) AS total
  FROM comments
  GROUP BY gender
  ORDER BY total DESC LIMIT 1;

-- List of users who bought at least one course.
SELECT DISTINCT
  users.id AS id,
  CONCAT_WS(' ', users.first_name, users.last_name) AS user,
  profiles.birthday AS birthday,
  profiles.country AS country,
  profiles.city AS city
FROM
  users
JOIN
  profiles
ON
  users.id = profiles.user_id
JOIN
  courses_students
USING(user_id);

-- Average age of students in users table.
SELECT
  AVG(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS age
FROM
  profiles;

-- Mediafiles amount by media type.
SELECT
  COUNT(*) AS amount,
  media_types.name AS media_type
FROM
  media
JOIN
  media_types
ON
  media.media_type_id = media_types.id
GROUP BY media_type_id;

-- Comments amount by target type. Targets: comments, courses, lessons, users.
SELECT
  COUNT(*) AS amount,
  target_types.name AS target_name
FROM
  comments
JOIN
  target_types
ON
  comments.target_type_id = target_types.id
GROUP BY target_type_id;

-- How much money student spent. Average course price.
SELECT DISTINCT
  users.id,
  SUM(courses.cost) OVER w_course AS user_spent,
  total_price,
  total_price / total_courses AS average_price,
  CONCAT_WS(' ', users.first_name, users.last_name) AS student,
  CONCAT_WS(' ', profiles.country, profiles.city) AS place_of_residence
FROM
  (SELECT SUM(cost) AS total_price FROM courses) AS tp
CROSS JOIN
  (SELECT COUNT(*) AS total_courses FROM courses) AS tc
CROSS JOIN
  users
JOIN
  courses_students
ON
  users.id = courses_students.user_id
JOIN
  courses
ON
  courses.id = courses_students.course_id
JOIN
  profiles
ON
  users.id = profiles.user_id
WINDOW w_course AS (PARTITION BY users.id);
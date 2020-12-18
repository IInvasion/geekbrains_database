-- Data beautify script.

use geekbrains;

-- update users table
UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;

-- update profiles table
UPDATE profiles SET updated_at = NOW() WHERE updated_at < created_at;

-- update comments table
UPDATE comments SET updated_at = NOW() WHERE updated_at < created_at;

-- update courses table
UPDATE courses SET updated_at = NOW() WHERE updated_at < created_at;

-- update lesson table
UPDATE lessons SET updated_at = NOW() WHERE updated_at < created_at;

-- update media table
UPDATE media SET size = FLOOR(1000 + RAND() * 1000000);

DROP TEMPORARY TABLE IF EXISTS extensions;
CREATE TEMPORARY TABLE extensions (name VARCHAR(10));
INSERT INTO extensions VALUES ('txt'), ('sql'), ('avi'), ('mpeg');

UPDATE media SET filename = CONCAT (
  'http://dropbox.net/geekbrains/',
  filename,
  '.',
  (SELECT name FROM extensions ORDER BY RAND() LIMIT 1)
);

-- update media_types table
SELECT * FROM media_types;
TRUNCATE media_types;
INSERT INTO media_types (name) VALUES ('file'), ('video');

-- update target_types table
TRUNCATE target_types;
INSERT INTO target_types (name) VALUES ('courses'), ('lessons'), ('comments'), ('users');

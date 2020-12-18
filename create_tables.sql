-- Geekbrains service database tables creation script.
DROP DATABASE IF EXISTS geekbrains;
CREATE DATABASE geekbrains;

use geekbrains;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "String id", 
  first_name VARCHAR(100) NOT NULL COMMENT "User first_name",
  last_name VARCHAR(100) NOT NULL COMMENT "User last_name",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "e-mail",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "phone",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "String creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "String update time"
) COMMENT "Users table";  

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "String id",
  gender ENUM('M', 'F') NOT NULL COMMENT "Gender",
  birthday DATE COMMENT "Date of birthday",
  country VARCHAR(120) COMMENT "Country of Residence",
  city VARCHAR(120) COMMENT "City of Residence",
  about TEXT COMMENT "User info",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "String creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "String update time"
) COMMENT "Profiles table";

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "String id", 
  from_user_id INT UNSIGNED NOT NULL COMMENT "Link to message sender",
  to_user_id INT UNSIGNED NOT NULL COMMENT "Link to message receiver",
  body TEXT NOT NULL COMMENT "Message text",
  created_at DATETIME DEFAULT NOW() COMMENT "String creation time"
) COMMENT "Messages table";

DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "String id",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Course name",
  description TEXT NOT NULL COMMENT "Course description",
  cost INT NOT NULL COMMENT "Course cost",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "String creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "String update time"
) COMMENT "Courses table";

DROP TABLE IF EXISTS lessons;
CREATE TABLE lessons (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "String id",
  name VARCHAR(255) NOT NULL COMMENT "Lesson name",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "String creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "String update time"
) COMMENT "Lessons table";

DROP TABLE IF EXISTS media;
CREATE TABLE media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "String id",
  filename VARCHAR(255) NOT NULL COMMENT "Link to file",
  size INT NOT NULL COMMENT "File size",
  media_type_id INT UNSIGNED NOT NULL COMMENT "Content type link",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "String creation time"
) COMMENT "Mediafiles table";

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "String id",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Mediatype name",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "String creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "String update time"
) COMMENT "Mediafile types table";

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "String id",
  user_id INT UNSIGNED NOT NULL COMMENT "Comment author link",
  body TEXT NOT NULL COMMENT "Message text",
  target_id INT UNSIGNED NOT NULL COMMENT "Target id",
  target_type_id INT UNSIGNED NOT NULL COMMENT "Target type id",
  rating ENUM('1', '2', '3', '4', '5') NOT NULL COMMENT "Target rating",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "String creation time",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "String update time"
) COMMENT "Comments table";

DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "String id",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Target name",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "String creation time"
) COMMENT "Target types table";

DROP TABLE IF EXISTS courses_students;
CREATE TABLE courses_students (
  course_id INT UNSIGNED NOT NULL COMMENT "Course link",
  user_id INT UNSIGNED NOT NULL COMMENT "User link",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "String creation time",
  PRIMARY KEY (course_id, user_id) COMMENT "Composite primary key"
) COMMENT "Relations of courses and students";

DROP TABLE IF EXISTS lessons_media;
CREATE TABLE lessons_media (
  lesson_id INT UNSIGNED NOT NULL COMMENT "Lesson link",
  media_id INT UNSIGNED NOT NULL UNIQUE COMMENT "Mediafile link",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "String creation time",
  PRIMARY KEY (lesson_id, media_id) COMMENT "Composite primary key"
) COMMENT "Relations of lessons and mediafiles";

DROP TABLE IF EXISTS courses_lessons;
CREATE TABLE courses_lessons (
  course_id INT UNSIGNED NOT NULL COMMENT "Course link",
  lesson_id INT UNSIGNED NOT NULL UNIQUE COMMENT "Lesson link",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "String creation time",
  PRIMARY KEY (course_id, lesson_id) COMMENT "Composite primary key"
) COMMENT "Relations of courses and lessons";
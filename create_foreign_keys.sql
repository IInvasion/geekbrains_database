-- Tables foreign keys addition script.

use geekbrains;

CALL PROC_DROP_FOREIGN_KEY('profiles', 'profiles_user_id_fk');
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

CALL PROC_DROP_FOREIGN_KEY('messages', 'messages_from_user_id_fk');
CALL PROC_DROP_FOREIGN_KEY('messages', 'messages_to_user_id_fk');
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk
    FOREIGN KEY (from_user_id) REFERENCES users(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT,
  ADD CONSTRAINT messages_to_user_id_fk
    FOREIGN KEY (to_user_id) REFERENCES users(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

CALL PROC_DROP_FOREIGN_KEY('comments', 'comments_target_type_id_fk');
CALL PROC_DROP_FOREIGN_KEY('comments', 'comments_user_id_fk');
ALTER TABLE comments
  ADD CONSTRAINT comments_target_type_id_fk
    FOREIGN KEY (target_type_id) REFERENCES target_types(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT,
  ADD CONSTRAINT comments_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

CALL PROC_DROP_FOREIGN_KEY('media', 'media_media_type_id_fk');
ALTER TABLE media
  ADD CONSTRAINT media_media_type_id_fk
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

CALL PROC_DROP_FOREIGN_KEY('courses_students', 'coursers_students_user_id_fk');
CALL PROC_DROP_FOREIGN_KEY('courses_students', 'coursers_students_course_id_fk');
ALTER TABLE courses_students
  ADD CONSTRAINT coursers_students_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT,
  ADD CONSTRAINT coursers_students_course_id_fk
    FOREIGN KEY (course_id) REFERENCES courses(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

CALL PROC_DROP_FOREIGN_KEY('lessons_media', 'lessons_media_lesson_id_fk');
CALL PROC_DROP_FOREIGN_KEY('lessons_media', 'lessons_media_media_id_fk');
ALTER TABLE lessons_media
  ADD CONSTRAINT lessons_media_lesson_id_fk
    FOREIGN KEY (lesson_id) REFERENCES lessons(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT,
  ADD CONSTRAINT lessons_media_media_id_fk
    FOREIGN KEY (media_id) REFERENCES media(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;

CALL PROC_DROP_FOREIGN_KEY('courses_lessons', 'courses_lessons_course_id_fk');
CALL PROC_DROP_FOREIGN_KEY('courses_lessons', 'courses_lessons_lesson_id_fk');
ALTER TABLE courses_lessons
  ADD CONSTRAINT courses_lessons_course_id_fk
    FOREIGN KEY (course_id) REFERENCES courses(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT,
  ADD CONSTRAINT courses_lessons_lesson_id_fk
    FOREIGN KEY (lesson_id) REFERENCES lessons(id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT;
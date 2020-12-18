-- Comments table taget_id validation row exists check function.

use geekbrains;

DROP FUNCTION IF EXISTS is_row_exists;
DELIMITER //

CREATE FUNCTION is_row_exists (target_id INT, target_type_id INT)
RETURNS BOOLEAN READS SQL DATA

BEGIN
	DECLARE table_name VARCHAR(50);
	SELECT name FROM target_types WHERE id = target_type_id INTO table_name;

	CASE table_name
	  WHEN 'courses' THEN
	    RETURN EXISTS (SELECT 1 FROM courses WHERE id = target_id);
	  WHEN 'lessons' THEN
	    RETURN EXISTS (SELECT 1 FROM lessons WHERE id = target_id);
	  WHEN 'comments' THEN
	    RETURN EXISTS (SELECT 1 FROM comments WHERE id = target_id);
	  WHEN 'users' THEN
	    RETURN EXISTS (SELECT 1 FROM users WHERE id = target_id);
	  ELSE
	    RETURN FALSE;
	END CASE;

END//

DELIMITER ;
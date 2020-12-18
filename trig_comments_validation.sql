-- Comments target_id and target_type_id validation trigger.

use geekbrains;

DROP TRIGGER IF EXISTS comments_validation;
DELIMITER //

CREATE TRIGGER comments_validation BEFORE INSERT ON comments
FOR EACH ROW
BEGIN
	IF !is_row_exists(NEW.target_id, NEW.target_type_id) THEN
	  SIGNAL SQLSTATE "45000"
	  SET MESSAGE_TEXT = "Error adding comment! Target table doesn't contain row id provided!";
	END IF;
END//

DELIMITER ;
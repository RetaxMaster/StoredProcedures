/* Actualiza un plan académico. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acadplans_Update$$ */

CREATE PROCEDURE sp_p_set_acadplans_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_planA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_planA = id_planA;

	SET @sql = CONCAT("
	UPDATE tbl_acadplans SET " , field , " = ?
	WHERE id_plan = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_planA;
    DEALLOCATE PREPARE stmt;
	
END
/* 
$$

DELIMITER ;
*/
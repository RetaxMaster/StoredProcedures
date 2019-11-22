/* Actualiza un capacitador */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acadcaps_Update$$ */

CREATE PROCEDURE sp_p_set_acadcaps_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_capA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_capA = id_capA;

	SET @sql = CONCAT("
	UPDATE tbl_acadcaps SET " , field , " = ?
	WHERE id_cap = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_capA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


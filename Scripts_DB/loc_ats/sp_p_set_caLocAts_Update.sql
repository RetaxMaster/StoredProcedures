/* Actualiza un lugar disponible. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_caLocAts_Update$$ */

CREATE PROCEDURE sp_p_set_caLocAts_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_locatA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_locatA = id_locatA;

	SET @sql = CONCAT("
	UPDATE tbl_calocats SET " , field , " = ?
	WHERE id_locat = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_locatA;
    DEALLOCATE PREPARE stmt;
	
END
/* 
$$

DELIMITER ;
*/
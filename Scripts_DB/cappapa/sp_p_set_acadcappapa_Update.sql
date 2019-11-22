/* Actualiza un matriz de capacitadores. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acadcappapa_Update$$ */

CREATE PROCEDURE sp_p_set_acadcappapa_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_cappapaisA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_cappapaisA = id_cappapaisA;

	SET @sql = CONCAT("
	UPDATE tbl_acadcappapais SET " , field , " = ?
	WHERE id_cappapais = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_cappapaisA;
    DEALLOCATE PREPARE stmt;
	
END
/* 
$$

DELIMITER ;
*/
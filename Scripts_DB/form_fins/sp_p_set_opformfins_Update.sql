/* Actualiza un formulario de finalización */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_copformfins_Update$$ */

CREATE PROCEDURE sp_p_set_copformfins_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_formfinA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_formfinA = id_formfinA;

	SET @sql = CONCAT("
	UPDATE tbl_opformfins SET " , field , " = ?
	WHERE id_formfin = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_formfinA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


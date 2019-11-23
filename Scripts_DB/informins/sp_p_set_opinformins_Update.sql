/* Actualiza un informe */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_opinformins_Update$$ */

CREATE PROCEDURE sp_p_set_opinformins_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_informinA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_informinA = id_informinA;

	SET @sql = CONCAT("
	UPDATE tbl_opinformins SET " , field , " = ?
	WHERE id_informin = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_informinA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


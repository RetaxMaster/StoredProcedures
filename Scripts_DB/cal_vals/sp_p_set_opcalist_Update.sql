/* Actualiza una documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_opcalist_Update$$ */

CREATE PROCEDURE sp_p_set_opcalist_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_calinstA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_calinstA = id_calinstA;

	SET @sql = CONCAT("
	UPDATE tbl_opcalinsts SET " , field , " = ?
	WHERE id_calinst = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_calinstA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


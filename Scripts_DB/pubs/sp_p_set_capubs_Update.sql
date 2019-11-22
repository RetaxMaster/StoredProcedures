/* Actualiza una publicidad */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_capubs_Update$$ */

CREATE PROCEDURE sp_p_set_capubs_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_pubA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_pubA = id_pubA;

	SET @sql = CONCAT("
	UPDATE tbl_capubs SET " , field , " = ?
	WHERE id_pub = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_pubA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


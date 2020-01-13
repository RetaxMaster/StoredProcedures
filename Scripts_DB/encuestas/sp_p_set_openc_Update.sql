/* Actualiza una documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_openc_Update$$ */

CREATE PROCEDURE sp_p_set_openc_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_encA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_encA = id_encA;

	SET @sql = CONCAT("
	UPDATE tbl_acadencs SET " , field , " = ?
	WHERE id_enc = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_encA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


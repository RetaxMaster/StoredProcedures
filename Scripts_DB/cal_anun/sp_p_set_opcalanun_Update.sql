/* Actualiza una documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_opcalanun_Update$$ */

CREATE PROCEDURE sp_p_set_opcalanun_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_calanuntA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_calanuntA = id_calanuntA;

	SET @sql = CONCAT("
	UPDATE tbl_opcalanunts SET " , field , " = ?
	WHERE id_calanunt = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_calanuntA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


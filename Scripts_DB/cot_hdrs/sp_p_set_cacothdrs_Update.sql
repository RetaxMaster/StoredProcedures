/* Actualiza una documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cacothdrs_Update$$ */

CREATE PROCEDURE sp_p_set_cacothdrs_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_cotA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_cotA = id_cotA;

	SET @sql = CONCAT("
	UPDATE tbl_cacothdrs SET " , field , " = ?
	WHERE id_cot = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_calanid_cotAuntA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


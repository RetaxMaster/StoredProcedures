/* Actualiza un contrato. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cactrts_Update$$ */

CREATE PROCEDURE sp_p_set_cactrts_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_cttodocA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_cttodocA = id_cttodocA;

	SET @sql = CONCAT("
	UPDATE tbl_cacttodocs SET " , field , " = ?
	WHERE id_cttodoc = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_cttodocA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/
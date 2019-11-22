/* Actualiza un contrato. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cactrts_Update$$ */

CREATE PROCEDURE sp_p_set_cactrts_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_cttoA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_cttoA = id_cttoA;

	SET @sql = CONCAT("
	UPDATE tbl_cacttos SET " , field , " = ?
	WHERE id_ctto = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_cttoA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/
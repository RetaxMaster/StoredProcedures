/* Actualiza un contacto de cliente. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cagenccli_Update$$ */

CREATE PROCEDURE sp_p_set_cagenccli_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_cclientA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_cclientA = id_cclientA;

	SET @sql = CONCAT("
	UPDATE tbl_cacclients SET " , field , " = ?
	WHERE id_cclient = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_cclientA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/
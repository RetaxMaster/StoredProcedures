/* Actualiza un lugar disponible. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cafps_Update$$ */

CREATE PROCEDURE sp_p_set_cafps_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_fpA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_fpA = id_fpA;

	SET @sql = CONCAT("
	UPDATE tbl_cafps SET " , field , " = ?
	WHERE id_fp = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_fpA;
    DEALLOCATE PREPARE stmt;
	
END
/* 
$$

DELIMITER ;
*/
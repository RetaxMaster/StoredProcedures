/* Actualiza un cursos disponible. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acaddisp_Update$$ */

CREATE PROCEDURE sp_p_set_acaddisp_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_dispaA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_dispaA = id_dispaA;

	SET @sql = CONCAT("
	UPDATE tbl_acaddispas SET " , field , " = ?
	WHERE id_dispa = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_dispaA;
    DEALLOCATE PREPARE stmt;
	
END
/* 
$$

DELIMITER ;
*/
/* Actualiza un lugar disponible. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_caLstVals_Update$$ */

CREATE PROCEDURE sp_p_set_caLstVals_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_lstvalA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_lstvalA = id_lstvalA;

	SET @sql = CONCAT("
	UPDATE tbl_calstvals SET " , field , " = ?
	WHERE id_lstval = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_lstvalA;
    DEALLOCATE PREPARE stmt;
	
END
/* 
$$

DELIMITER ;
*/
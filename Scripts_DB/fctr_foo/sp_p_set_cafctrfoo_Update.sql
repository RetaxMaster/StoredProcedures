/* Actualiza un pie de factura */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cafctrfoo_Update$$ */

CREATE PROCEDURE sp_p_set_cafctrfoo_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_factfootA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_factfootA = id_factfootA;

	SET @sql = CONCAT("
	UPDATE tbl_cafactfoots SET " , field , " = ?
	WHERE id_factfoot = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_factfootA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


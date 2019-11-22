/* Actualiza una cabezera de factura */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cafcthdr_Update$$ */

CREATE PROCEDURE sp_p_set_cafcthdr_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_factA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_factA = id_factA;

	SET @sql = CONCAT("
	UPDATE tbl_cafacthdrs SET " , field , " = ?
	WHERE id_fact = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_factA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


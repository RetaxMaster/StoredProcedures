/* Actualiza un detalle de factura */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cafctrdtls_Update$$ */

CREATE PROCEDURE sp_p_set_cafctrdtls_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_factdetailA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_factdetailA = id_factdetailA;

	SET @sql = CONCAT("
	UPDATE tbl_cafactdetails SET " , field , " = ?
	WHERE id_factdetail = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_factdetailA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


/* Actualiza un recibo */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_carecibo_Update$$ */

CREATE PROCEDURE sp_p_set_carecibo_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_cajareciboA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_cajareciboA = id_cajareciboA;

	SET @sql = CONCAT("
	UPDATE tbl_cacajarecibos SET " , field , " = ?
	WHERE id_cajarecibo = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_cajareciboA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


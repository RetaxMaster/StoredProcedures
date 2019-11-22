/* Actualiza un impuesto de factura */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cafctrimp_Update$$ */

CREATE PROCEDURE sp_p_set_cafctrimp_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_factimpA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_factimpA = id_factimpA;

	SET @sql = CONCAT("
	UPDATE tbl_cafactimps SET " , field , " = ?
	WHERE id_factimp = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_factimpA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


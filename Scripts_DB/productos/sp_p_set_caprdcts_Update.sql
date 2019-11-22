/* Actualiza un producto */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_caprdcts_Update$$ */

CREATE PROCEDURE sp_p_set_caprdcts_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_prodA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_prodA = id_prodA;

	SET @sql = CONCAT("
	UPDATE tbl_caprods SET " , field , " = ?
	WHERE id_prod = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_prodA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


/* Actualiza un convenios. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cacvns_Update$$ */

CREATE PROCEDURE sp_p_set_cacvns_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_cttoadndaA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_cttoadndaA = id_cttoadndaA;

	SET @sql = CONCAT("
	UPDATE tbl_cacttoadndas SET " , field , " = ?
	WHERE id_cttoadnda = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_cttoadndaA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/
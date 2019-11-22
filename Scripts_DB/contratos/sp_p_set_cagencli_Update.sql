/* Actualiza un cliente. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cagencli_Update$$ */

CREATE PROCEDURE sp_p_set_cagencli_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_clientA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_clientA = id_clientA;

	SET @sql = CONCAT("
	UPDATE tbl_cagenclients SET " , field , " = ?
	WHERE id_client = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_clientA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/
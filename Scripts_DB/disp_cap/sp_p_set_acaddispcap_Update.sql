/* Actualiza un capacitadores disponible. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acaddispcap_Update$$ */

CREATE PROCEDURE sp_p_set_acaddispcap_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_dispcappaisA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_dispcappaisA = id_dispcappaisA;

	SET @sql = CONCAT("
	UPDATE tbl_acaddispcappais SET " , field , " = ?
	WHERE id_dispcappais = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_dispcappaisA;
    DEALLOCATE PREPARE stmt;
	
END
/* 
$$

DELIMITER ;
*/
/* Actualiza un cliente. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cagencli_Update$$ */

CREATE PROCEDURE sp_p_set_usrprofs_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_userA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_userA = id_userA;

	SET @sql = CONCAT("
	UPDATE tbl_usrprofs SET " , field , " = ?
	WHERE id_user = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_userA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/
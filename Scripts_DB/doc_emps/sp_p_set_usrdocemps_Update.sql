/* Actualiza una documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_usrdocemps_Update$$ */

CREATE PROCEDURE sp_p_set_usrdocemps_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_docempA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_docempA = id_docempA;

	SET @sql = CONCAT("
	UPDATE tbl_usrdocemps SET " , field , " = ?
	WHERE id_docemp = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_docempA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


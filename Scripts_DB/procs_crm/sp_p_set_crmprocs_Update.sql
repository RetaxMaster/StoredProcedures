/* Actualiza una documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_crmprocs_Update$$ */

CREATE PROCEDURE sp_p_set_crmprocs_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_procA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_procA = id_procA;

	SET @sql = CONCAT("
	UPDATE tbl_crmprocs SET " , field , " = ?
	WHERE id_proc = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_procA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


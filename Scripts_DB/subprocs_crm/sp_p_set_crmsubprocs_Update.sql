/* Actualiza una documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_crmsubprocs_Update$$ */

CREATE PROCEDURE sp_p_set_crmsubprocs_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_subprocA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_subprocA = id_subprocA;

	SET @sql = CONCAT("
	UPDATE tbl_crmsubprocs SET " , field , " = ?
	WHERE id_subproc = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_proid_subprocAcA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


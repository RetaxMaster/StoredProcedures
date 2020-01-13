/* Actualiza una documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_opinsvals_Update$$ */

CREATE PROCEDURE sp_p_set_opinsvals_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_imgsinstallA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_imgsinstallA = id_imgsinstallA;

	SET @sql = CONCAT("
	UPDATE tbl_opimgsinstallvals SET " , field , " = ?
	WHERE id_imgsinstall = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_imgsinstallA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


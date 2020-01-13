/* Actualiza una documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acadcalcaps_Update$$ */

CREATE PROCEDURE sp_p_set_acadcalcaps_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_calcapinstA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_calcapinstA = id_calcapinstA;

	SET @sql = CONCAT("
	UPDATE tbl_acadcalcapinsts SET " , field , " = ?
	WHERE id_calcapinst = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_calcapinstA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


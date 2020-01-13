/* Actualiza un informe */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_crmtrack_Update$$ */

CREATE PROCEDURE sp_p_set_crmtrack_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_trackA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_trackA = id_trackA;

	SET @sql = CONCAT("
	UPDATE tbl_crmtracks SET " , field , " = ?
	WHERE id_track = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_trackA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


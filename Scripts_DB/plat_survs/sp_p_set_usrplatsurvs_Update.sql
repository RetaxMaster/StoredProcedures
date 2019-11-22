/* Actualiza las plantillas de encuestas. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_usrplatsurvs_Update$$ */

CREATE PROCEDURE sp_p_set_usrplatsurvs_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_tmplatsurvsA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_tmplatsurvsA = id_tmplatsurvsA;

	SET @sql = CONCAT("
	UPDATE tbl_tmplatsurvs SET " , field , " = ?
	WHERE id_tmplatsurvs = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_tmplatsurvsA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


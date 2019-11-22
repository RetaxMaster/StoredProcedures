/* Actualiza una compañía. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_usrcomp_Update$$ */

CREATE PROCEDURE sp_p_set_usrcomp_Update (
	IN field VARCHAR (160), 
	IN val VARCHAR (160), 
	IN id_companyA INT (10)
)
BEGIN

	SET @val = val;
	SET @id_companyA = id_companyA;

	SET @sql = CONCAT("
	UPDATE tbl_usrcompanies SET " , field , " = ?
	WHERE id_company = ?;");

	PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val, @id_companyA;
    DEALLOCATE PREPARE stmt;

END
/* 
$$

DELIMITER ;
*/


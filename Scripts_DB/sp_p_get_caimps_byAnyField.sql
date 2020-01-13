/* Recupera una lista de clientes filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_caimps_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_caimps_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160), 
    IN enabledA TINYINT (1), 
    IN shouldJoin TINYINT (1),
    IN extraWhere TEXT
)
BEGIN
    
    SET @val = CONCAT("%" , val , "%");

    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_caimps
        WHERE (SELECT IF(" , enabledA , " = 2, TRUE, tbl_caimps.enabled = " , enabledA , "))
        AND " , field , " LIKE ?;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
			tbl_caimps.id_imp, 
			Ctry.descrip,
			tbl_caimps.valorPorc,
			tbl_caimps.descrip,
			tbl_caimps.enabled
    	FROM tbl_caimps
        INNER JOIN tbl_genpaises AS Ctry
        ON tbl_caimps.id_pais = Ctry.id_pais
        WHERE (SELECT IF(" , enabledA , " = 2, TRUE, tbl_caimps.enabled = " , enabledA , "))
        AND " , field , " LIKE ?
        ", extraWhere , ";");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/
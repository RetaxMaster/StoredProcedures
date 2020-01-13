/* Recupera un único registro de lugares disponibles filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_cafps_byAnyField$$*/

CREATE PROCEDURE sp_p_get_cafps_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160), 
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1),
    IN extraWhere TEXT
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_cafps 
        WHERE (SELECT IF(",enabledA, " = 2, TRUE, tbl_cafps.enabled = ",enabledA,"))
        AND ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT
            tbl_cafps.id_fp,
            tbl_cafps.descrip,
            tbl_cafps.enabled,
            tbl_genpaises.descrip AS id_pais
    	FROM tbl_cafps
        INNER JOIN tbl_genpaises
        ON tbl_cafps.id_pais = tbl_genpaises.id_pais
        WHERE (SELECT IF(", enabledA ," = 2, TRUE, tbl_cafps.enabled = ", enabledA ,"))
        AND ", field ," LIKE ?
        ", extraWhere , "
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/



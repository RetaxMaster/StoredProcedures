/* Recupera un único registro de calendario de anuncios filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_opinsvals_byAnyField$$*/

CREATE PROCEDURE sp_p_get_opinsvals_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),  
    IN shouldJoin TINYINT (1),
    IN extraWhere TEXT
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_opimgsinstallvals
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_opimgsinstallvals.id_imgsinstall,
            tbl_opimgsinstallvals.urlfoto,
            tbl_opcalinsts.cara AS id_calinst
    	FROM tbl_opimgsinstallvals
        INNER JOIN tbl_opcalinsts
        ON tbl_opimgsinstallvals.id_calinst = tbl_opcalinsts.id_calinst
        WHERE " , field , " LIKE ?
        ", extraWhere , "
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

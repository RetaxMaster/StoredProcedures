/* Recupera una lista de documentos de la empresa filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_opinspubs_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_opinspubs_byAnyField (
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
    	FROM tbl_opimgsinstallpubs 
        WHERE ", field , " LIKE ?;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_opimgsinstallpubs.id_imgsinstall,
            tbl_opimgsinstallpubs.urlfoto,
            tbl_opcalinsts.cara AS id_calinst
    	FROM tbl_opimgsinstallpubs
        INNER JOIN tbl_opcalinsts
        ON tbl_opimgsinstallpubs.id_calinst = tbl_opcalinsts.id_calinst
        WHERE " , field , " LIKE ?
        ", extraWhere , ";");
    END IF;
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

/* Recupera un único registro de documentos de la empresa filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_usrdocemps_byAnyField$$*/

CREATE PROCEDURE sp_p_get_usrdocemps_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),  
    IN shouldJoin TINYINT (1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_usrdocemps
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_usrdocemps.id_docemp,
            tbl_usrdocemps.titlefile,
            tbl_usrdocemps.descrip,
            tbl_usrdocemps.urlfile,
            tbl_usrcompanies.rs AS id_company
    	FROM tbl_usrdocemps
        INNER JOIN tbl_usrcompanies
        ON tbl_usrdocemps.id_company = tbl_usrcompanies.id_company
        WHERE " , field , " LIKE ?
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

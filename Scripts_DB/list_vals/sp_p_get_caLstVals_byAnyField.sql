/* Recupera un único registro de lugares disponibles filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_caLstVals_byAnyField$$*/

CREATE PROCEDURE sp_p_get_caLstVals_byAnyField (
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
    	FROM tbl_calstvals 
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT
            tbl_calstvals.id_lstval,
            tbl_calstvals.descrip,
            tbl_calstvals.urlimg,
            tbl_cagenclients.descrip AS id_client
    	FROM tbl_calstvals
        INNER JOIN tbl_cagenclients
        ON tbl_calstvals.id_client = tbl_cagenclients.id_client
        WHERE ", field ," LIKE ?
        ", extraWhere , "
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/



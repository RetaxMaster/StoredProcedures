/* Recupera una lista de publicidad filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_capubs_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_capubs_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),
    IN shouldJoin TINYINT (1),
    IN extraWhere TEXT
)
BEGIN

    SET @val = val;
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_capubs 
        WHERE ", field , " = ?;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_capubs.id_pub,
            tbl_capubs.descrip,
            tbl_capubs.urlimg,
            tbl_cagenclients.rs AS id_client
    	FROM tbl_capubs
        INNER JOIN tbl_cagenclients
        ON tbl_capubs.id_client = tbl_cagenclients.id_client
        WHERE " , field , " = ?
        ", extraWhere , ";");
    END IF;
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

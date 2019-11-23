/* Recupera una lista de informe filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_opinformins_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_opinformins_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),
    IN shouldJoin TINYINT (1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_opinformins 
        WHERE ", field , " LIKE ?;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_opinformins.id_informin,
            tbl_opinformins.htmltext,
            tbl_opinformins.estatus,
            tbl_opcalinsts.cara AS id_calinst,
            tbl_cagenclients.rs AS id_client
    	FROM tbl_opinformins
        INNER JOIN tbl_opcalinsts
        ON tbl_opinformins.id_calinst = tbl_opcalinsts.id_calinst
        INNER JOIN tbl_cagenclients
        ON tbl_opinformins.id_client = tbl_cagenclients.id_client
        WHERE " , field , " LIKE ?;");
    END IF;
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

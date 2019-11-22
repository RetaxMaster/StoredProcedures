/* Recupera una lista de planes académicos filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_acadplans_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_acadplans_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160), 
    IN enabledA TINYINT(1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");

    SET @sql = CONCAT("
    SELECT * 
    FROM tbl_acadplans 
    WHERE (SELECT IF(", enabledA ," = 2, TRUE, tbl_acadplans.lstenabled = ", enabledA ,"))
    AND ", field ," LIKE ?;");

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

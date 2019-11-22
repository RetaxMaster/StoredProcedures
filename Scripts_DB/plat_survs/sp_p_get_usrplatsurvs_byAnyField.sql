/* Recupera una única plantilla de encuesta filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_usrplatsurvs_byAnyField$$*/

CREATE PROCEDURE sp_p_get_usrplatsurvs_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    SET @sql = CONCAT("
    SELECT * 
    FROM tbl_tmplatsurvs
    WHERE ", field ," LIKE ?
    LIMIT 1;");

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

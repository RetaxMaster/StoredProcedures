/* Recupera un único registro de documentación de contratos y convenios filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_caconcontrdoc_byAnyField$$*/

CREATE PROCEDURE sp_p_get_caconcontrdoc_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),  
    IN shouldJoin TINYINT (1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_cacttodocs
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_cacttodocs.id_cttodoc,
            tbl_cacttodocs.fechains,
            tbl_cacttodocs.descrip,
            tbl_cacttodocs.urldoc,
            tbl_cacttos.codctto AS id_ctto,
            tbl_cacttoadndas.codctto AS id_cttoadnda
    	FROM tbl_cacttodocs
        INNER JOIN tbl_cacttos
        ON tbl_cacttodocs.id_ctto = tbl_cacttos.id_ctto
        INNER JOIN tbl_cacttoadndas
        ON tbl_cacttodocs.id_cttoadnda = tbl_cacttoadndas.id_cttoadnda
        WHERE " , field , " LIKE ?
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

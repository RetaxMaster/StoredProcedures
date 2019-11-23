/* Recupera un único registro de formulario de finalización filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_opformfins_byAnyField$$*/

CREATE PROCEDURE sp_p_get_opformfins_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),  
    IN shouldJoin TINYINT (1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_opformfins
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_opformfins.id_formfin,
            tbl_opformfins.htmltext,
            tbl_opformfins.brid,
            tbl_opformfins.estatus,
            tbl_opformfins.tokenseg,
            tbl_opcalanunts.cara AS id_calanunt,
            tbl_gencalifs.descrip AS id_calif
    	FROM tbl_opformfins
        INNER JOIN tbl_opcalanunts
        ON tbl_opformfins.id_calanunt = tbl_opcalanunts.id_calanunt
        INNER JOIN tbl_gencalifs
        ON tbl_opformfins.id_calif = tbl_gencalifs.id_calif
        WHERE " , field , " LIKE ?
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

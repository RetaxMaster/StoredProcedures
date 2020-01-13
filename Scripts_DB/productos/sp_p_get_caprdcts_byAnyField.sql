/* Recupera un único registro de productos filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_caprdcts_byAnyField$$*/

CREATE PROCEDURE sp_p_get_caprdcts_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),  
    IN shouldJoin TINYINT (1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_caprods
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_caprods.id_prod,
            tbl_caprods.cod,
            tbl_caprods.descrip,
            tbl_caprods.stock,
            tbl_caprods.tiposp,
            tbl_caprods.puvp,
            tbl_caprods.costu,
            tbl_caimps.valorPorc AS id_imp,
            tbl_genpaises.descrip AS id_pais
    	FROM tbl_caprods
        INNER JOIN tbl_caimps
        ON tbl_caprods.id_imp = tbl_caimps.id_imp
        INNER JOIN tbl_genpaises
        ON tbl_caprods.id_pais = tbl_genpaises.id_pais
        WHERE " , field , " LIKE ?
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

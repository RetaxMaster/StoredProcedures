/* Recupera un único registro de impuesto de factura filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_cafctrimp_byAnyField$$*/

CREATE PROCEDURE sp_p_get_cafctrimp_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),  
    IN shouldJoin TINYINT (1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_cafactimps
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_cafactimps.id_factimp,
            tbl_cafactimps.valorPorc,
            tbl_cafactimps.monto,
            tbl_cafactimps.descrip,
            tbl_cafacthdrs.rs AS id_fact,
            tbl_caimps.descrip AS id_imp
    	FROM tbl_cafactimps
        INNER JOIN tbl_cafacthdrs
        ON tbl_cafactimps.id_fact = tbl_cafacthdrs.id_fact
        INNER JOIN tbl_caimps
        ON tbl_cafactimps.id_imp = tbl_caimps.id_imp
        WHERE " , field , " LIKE ?
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

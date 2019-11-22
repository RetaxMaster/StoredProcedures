/* Recupera un único registro de detalle de factura filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_cafctrdtls_byAnyField$$*/

CREATE PROCEDURE sp_p_get_cafctrdtls_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),  
    IN shouldJoin TINYINT (1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_cafactdetails
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_cafactdetails.id_factdetail,
            tbl_cafactdetails.cod,
            tbl_cafactdetails.descrip,
            tbl_cafactdetails.cant,
            tbl_cafactdetails.tiposp,
            tbl_cafactdetails.puvp,
            tbl_cafactdetails.valorPorc,
            tbl_cafactdetails.totaldlinea,
            tbl_cafacthdrs.rs AS id_fact,
            tbl_caprods.cod AS id_prod,
            tbl_caimps.descrip AS id_imp
    	FROM tbl_cafactdetails
        INNER JOIN tbl_cafacthdrs
        ON tbl_cafactdetails.id_fact = tbl_cafacthdrs.id_fact
        INNER JOIN tbl_caprods
        ON tbl_cafactdetails.id_prod = tbl_caprods.id_prod
        INNER JOIN tbl_caimps
        ON tbl_cafactdetails.id_imp = tbl_caimps.id_imp
        WHERE " , field , " LIKE ?
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

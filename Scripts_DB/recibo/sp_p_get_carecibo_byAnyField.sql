/* Recupera un único registro de recibo filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_carecibo_byAnyField$$*/

CREATE PROCEDURE sp_p_get_carecibo_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),  
    IN shouldJoin TINYINT (1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_cacajarecibos
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_cacajarecibos.id_cajarecibo,
            tbl_cacajarecibos.descrip,
            tbl_cacajarecibos.fecha,
            tbl_cacajarecibos.txdescrip,
            tbl_cacajarecibos.monto,
            tbl_cacajarecibos.aprobado,
            tbl_cafacthdrs.rs AS id_fact,
            tbl_genpaises.descrip AS id_pais,
            tbl_cacothdrs.rs AS id_cot,
            tbl_cafps.descrip AS id_fp
    	FROM tbl_cacajarecibos
        INNER JOIN tbl_cafacthdrs
        ON tbl_cacajarecibos.id_fact = tbl_cafacthdrs.id_fact
        INNER JOIN tbl_genpaises
        ON tbl_cafacthdrs.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_cacothdrs
        ON tbl_cacajarecibos.id_cot = tbl_cacothdrs.id_cot
        INNER JOIN tbl_cafps
        ON tbl_cacajarecibos.id_fp = tbl_cafps.id_fp
        WHERE " , field , " LIKE ?
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

/* Recupera un único registro de calendario de anuncios filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_cacothdrs_byAnyField$$*/

CREATE PROCEDURE sp_p_get_cacothdrs_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),  
    IN shouldJoin TINYINT (1),
    IN extraWhere TEXT
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_cacothdrs
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_cacothdrs.id_cot,
            tbl_cacothdrs.rs,
            tbl_cacothdrs.ruc,
            tbl_cacothdrs.addrs,
            tbl_cacothdrs.tel,
            tbl_cacothdrs.fecha,
            tbl_cacothdrs.nroprefact,
            tbl_cacothdrs.ppagoCC,
            tbl_cacothdrs.cantdias,
            tbl_cacothdrs.ver,
            tbl_cacothdrs.facturado,
            tbl_cagenclients.rs AS id_client,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov,
            ctrycodefijo.descrip AS id_ctrycodefijo
    	FROM tbl_cacothdrs
        INNER JOIN tbl_cagenclients
        ON tbl_cacothdrs.id_client = tbl_cagenclients.id_client
        INNER JOIN tbl_genpaises
        ON tbl_cacothdrs.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_cacothdrs.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_genctrycodes AS ctrycodefijo
        ON tbl_cacothdrs.id_ctrycodefijo = ctrycodefijo.id_ctrycode
        WHERE " , field , " LIKE ?
        ", extraWhere , "
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

/* Recupera una lista de documentos de la empresa filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_cacothdrs_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_cacothdrs_byAnyField (
    IN shouldJoin TINYINT (1),
    IN whereSQL TEXT
)
BEGIN
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_cacothdrs 
        ", whereSQL , ";");
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
            ctrycodefijo.descrip AS id_ctrycodefijo,
            tbl_cacotfoots.total AS total,
            tbl_cacotfoots.observ AS observ
    	FROM tbl_cacothdrs
        INNER JOIN tbl_cagenclients
        ON tbl_cacothdrs.id_client = tbl_cagenclients.id_client
        INNER JOIN tbl_genpaises
        ON tbl_cacothdrs.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_cacothdrs.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_cacotfoots
        ON tbl_cacothdrs.id_cot = tbl_cacotfoots.id_cot
        INNER JOIN tbl_genctrycodes AS ctrycodefijo
        ON tbl_cacothdrs.id_ctrycodefijo = ctrycodefijo.id_ctrycode
        ", whereSQL , ";");
    END IF;
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

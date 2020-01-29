/* Recupera una lista de documentos de la empresa filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_cafacthdrs_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_cafacthdrs_byAnyField (
    IN shouldJoin TINYINT (1),
    IN whereSQL TEXT
)
BEGIN
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_cafacthdrs 
        ", whereSQL , ";");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_cafacthdrs.id_fact,
            tbl_cafacthdrs.rs,
            tbl_cafacthdrs.ruc,
            tbl_cafacthdrs.addrs,
            tbl_cafacthdrs.tel,
            tbl_cafacthdrs.fecha,
            tbl_cafacthdrs.ffasoc,
            tbl_cafacthdrs.ppagoCC,
            tbl_cafacthdrs.cantdias,
            tbl_cafacthdrs.pagado,
            tbl_cagenclients.rs AS id_client,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov,
            ctrycodefijo.descrip AS id_ctrycodefijo,
            tbl_cafactfoots.total AS total,
            tbl_cafactfoots.observ AS observ
    	FROM tbl_cafacthdrs
        INNER JOIN tbl_cagenclients
        ON tbl_cafacthdrs.id_client = tbl_cagenclients.id_client
        INNER JOIN tbl_genpaises
        ON tbl_cafacthdrs.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_cafacthdrs.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_cafactfoots
        ON tbl_cafacthdrs.id_fact = tbl_cafactfoots.id_fact
        INNER JOIN tbl_genctrycodes AS ctrycodefijo
        ON tbl_cafacthdrs.id_ctrycodefijo = ctrycodefijo.id_ctrycode
        ", whereSQL , ";");
    END IF;
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

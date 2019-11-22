/* Recupera un único registro de clientes filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_cagencli_byAnyField$$*/

CREATE PROCEDURE sp_p_get_cagencli_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160), 
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_cagenclients 
        WHERE (SELECT IF(" , enabledA , " = 2, TRUE, tbl_cagenclients.enabled = " , enabledA , "))
        AND " , field , " LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_cagenclients.id_client,
            tbl_cagenclients.rs,
            tbl_cagenclients.ruc,
            tbl_cagenclients.addrs,
            tbl_cagenclients.email,
            tbl_cagenclients.tel,
            tbl_cagenclients.ext,
            tbl_cagenclients.cel,
            tbl_cagenclients.website,
            tbl_cagenclients.descrip,
            tbl_cagenclients.enabled,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov,
            ctrycodefijo.descrip AS id_ctrycodefijo,
            ctrycodecel.descrip AS id_ctrycodecel,
            tbl_gentipos.descrip AS id_tipo,
            tbl_genclasifics.descrip AS id_clasific,
            tbl_gencalifs.descrip AS id_calific
    	FROM tbl_cagenclients
        INNER JOIN tbl_genpaises
        ON tbl_cagenclients.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_cagenclients.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_genctrycodes AS ctrycodefijo
        ON tbl_cagenclients.id_ctrycodefijo = ctrycodefijo.id_ctrycode
        INNER JOIN tbl_genctrycodes AS ctrycodecel
        ON tbl_cagenclients.id_ctrycodecel = ctrycodecel.id_ctrycode
        INNER JOIN tbl_gentipos
        ON tbl_cagenclients.id_tipo = tbl_gentipos.id_tipo
        INNER JOIN tbl_genclasifics
        ON tbl_cagenclients.id_clasific = tbl_genclasifics.id_clasific
        INNER JOIN tbl_gencalifs
        ON tbl_cagenclients.id_calific = tbl_gencalifs.id_calif
        WHERE (SELECT IF(" , enabledA , " = 2, TRUE, tbl_cagenclients.enabled = " , enabledA , "))
        AND " , field , " LIKE ?
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

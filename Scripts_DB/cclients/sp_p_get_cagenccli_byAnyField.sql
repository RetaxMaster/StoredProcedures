/* Recupera un único registro de contacto de clientes filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_cagenccli_byAnyField$$*/

CREATE PROCEDURE sp_p_get_cagenccli_byAnyField (
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
    	FROM tbl_cacclients 
        WHERE (SELECT IF(" , enabledA , " = 2, TRUE, tbl_cacclients.enabled = " , enabledA , "))
        AND " , field , " LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_cacclients.id_cclient,
            tbl_cacclients.nom,
            tbl_cacclients.ape,
            tbl_cacclients.email,
            tbl_cacclients.tel,
            tbl_cacclients.ext,
            tbl_cacclients.cel,
            tbl_cacclients.principal,
            tbl_cacclients.descrip,
            tbl_cacclients.enabled,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov,
            ctrycodefijo.descrip AS id_ctrycodefijo,
            ctrycodecel.descrip AS id_ctrycodecel,
            tbl_cagenclients.rs AS id_client,
            tbl_genfpubs.descrip AS id_tpub,
            tbl_gencargos.descrip AS id_cargo,
            tbl_gendptoemp.descrip AS id_dptoemp
    	FROM tbl_cacclients
        INNER JOIN tbl_genpaises
        ON tbl_cacclients.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_cacclients.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_genctrycodes AS ctrycodefijo
        ON tbl_cacclients.id_ctrycodefijo = ctrycodefijo.id_ctrycode
        INNER JOIN tbl_genctrycodes AS ctrycodecel
        ON tbl_cacclients.id_ctrycodecel = ctrycodecel.id_ctrycode
        INNER JOIN tbl_cagenclients
        ON tbl_cacclients.id_client = tbl_cagenclients.id_client
        INNER JOIN tbl_genfpubs
        ON tbl_cacclients.id_tpub = tbl_genfpubs.id_tpub
        INNER JOIN tbl_gencargos
        ON tbl_cacclients.id_cargo = tbl_gencargos.id_cargo
        INNER JOIN tbl_gendptoemp
        ON tbl_cacclients.id_dptoemp = tbl_gendptoemp.id_dptoemp
        WHERE (SELECT IF(" , enabledA , " = 2, TRUE, tbl_cacclients.enabled = " , enabledA , "))
        AND " , field , " LIKE ?
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

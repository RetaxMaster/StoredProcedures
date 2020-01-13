/* Recupera un único registro de lugares disponibles filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_caLocAts_byAnyField$$*/

CREATE PROCEDURE sp_p_get_caLocAts_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160), 
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1),
    IN extraWhere TEXT
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_calocats 
        WHERE (SELECT IF(",enabledA, " = 2, TRUE, tbl_calocats.enabled = ",enabledA,"))
        AND ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT
            tbl_calocats.id_locat,
            tbl_calocats.cod,
            tbl_calocats.cara,
            tbl_calocats.wide,
            tbl_calocats.high,
            tbl_calocats.enabled,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov,
            tbl_cagenclients.rs AS id_client,
            tbl_genfpubs.descrip AS id_tpub
    	FROM tbl_calocats
        INNER JOIN tbl_genpaises
        ON tbl_calocats.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_calocats.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_cagenclients
        ON tbl_calocats.id_client = tbl_cagenclients.id_client
        INNER JOIN tbl_genfpubs
        ON tbl_calocats.id_tpub = tbl_genfpubs.id_tpub
        WHERE (SELECT IF(", enabledA ," = 2, TRUE, tbl_calocats.enabled = ", enabledA ,"))
        AND ", field ," LIKE ?
        ", extraWhere , "
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/



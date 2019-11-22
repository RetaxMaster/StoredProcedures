/* Recupera una lista de capacitadores disponibles filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_aacaddispcap_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_aacaddispcap_byAnyField (
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
    	FROM tbl_acaddispcappais 
        WHERE (SELECT IF(", enabledA ," = 2, TRUE, tbl_acaddispcappais.enabled = ", enabledA ,"))
        AND ", field ," LIKE ?;");
    ELSE
        SET @sql = CONCAT("
        SELECT
            tbl_acaddispcappais.id_dispcappais,
            tbl_acaddispcappais.enabled,
            tbl_acadcaps.formacad AS id_cap,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov
    	FROM tbl_acaddispcappais
        INNER JOIN tbl_acadcaps
        ON tbl_acaddispcappais.id_cap = tbl_acadcaps.id_cap
        INNER JOIN tbl_genpaises
        ON tbl_acaddispcappais.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_acaddispcappais.id_prov = tbl_genprovs.id_prov 
        WHERE (SELECT IF(", enabledA ," = 2, TRUE, tbl_acaddispcappais.enabled = ", enabledA ,"))
        AND " , field ," LIKE ?;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

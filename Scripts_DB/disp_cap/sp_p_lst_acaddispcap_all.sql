/* Recupera la lista de capacitadores disponibles */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_acaddispcap_all$$*/

CREATE PROCEDURE sp_p_lst_acaddispcap_all (
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_acaddispcappais
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_acaddispcappais.enabled = enabledA));
    ELSE
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
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_acaddispcappais.enabled = enabledA));
    END IF;
END
/*$$
DELIMITER ;*/
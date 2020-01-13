/* Recupera la lista de lugares disponibles */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_cafps_all$$*/

CREATE PROCEDURE sp_p_lst_cafps_all (
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_cafps
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_cafps.enabled = enabledA));
    ELSE
        SELECT
            tbl_cafps.id_fp,
            tbl_cafps.descrip,
            tbl_cafps.enabled,
            tbl_genpaises.descrip AS id_pais
    	FROM tbl_cafps
        INNER JOIN tbl_genpaises
        ON tbl_cafps.id_pais = tbl_genpaises.id_pais
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_cafps.enabled = enabledA));
    END IF;
END
/*$$
DELIMITER ;*/
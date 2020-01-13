/* Recupera la lista de cursos disponibles */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_acaddisp_all$$*/

CREATE PROCEDURE sp_p_lst_acaddisp_all (
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_acaddispas
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_acaddispas.enabled = enabledA));
    ELSE
        SELECT
            tbl_acaddispas.id_dispa,
            tbl_acaddispas.enabled,
            tbl_acadplans.título AS id_plan,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov
    	FROM tbl_acaddispas
        INNER JOIN tbl_acadplans
        ON tbl_acaddispas.id_plan = tbl_acadplans.id_plan
        INNER JOIN tbl_genpaises
        ON tbl_acaddispas.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_acaddispas.id_prov = tbl_genprovs.id_prov        
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_acaddispas.enabled = enabledA));
    END IF;
END
/*$$
DELIMITER ;*/
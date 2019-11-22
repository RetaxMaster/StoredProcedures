/* Recupera la lista de contratos */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_cactrts_all$$*/

CREATE PROCEDURE sp_p_lst_cactrts_all (
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_cacttos
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_cacttos.enabled = enabledA));
    ELSE
        SELECT 
            tbl_cacttos.id_ctto,
            tbl_cacttos.codctto,
            tbl_cacttos.fini,
            tbl_cacttos.ffin,
            tbl_cacttos.ciclopub,
            tbl_cacttos.ciclomsgvalor,
            tbl_cacttos.cantcur,
            tbl_cacttos.descrip,
            tbl_cacttos.enabled,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov,
            tbl_cagenclients.descrip AS id_client,
            tbl_gentipos.descrip AS id_tipo
    	FROM tbl_cacttos
        INNER JOIN tbl_genpaises
        ON tbl_cacttos.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_cacttos.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_cagenclients
        ON tbl_cacttos.id_client = tbl_cagenclients.id_client
        INNER JOIN tbl_gentipos
        ON tbl_cacttos.id_tipo = tbl_gentipos.id_tipo
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_cacttos.enabled = enabledA));
    END IF;
END
/*$$
DELIMITER ;*/
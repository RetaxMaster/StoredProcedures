/* Recupera la lista de convenios */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_cacvns_all$$*/

CREATE PROCEDURE sp_p_lst_cacvns_all (
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_cacttoadndas
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_cacttoadndas.enabled = enabledA));
    ELSE
        SELECT 
            tbl_cacttoadndas.id_cttoadnda,
            tbl_cacttoadndas.codctto,
            tbl_cacttoadndas.fini,
            tbl_cacttoadndas.ffin,
            tbl_cacttoadndas.ciclopub,
            tbl_cacttoadndas.ciclomsgvalor,
            tbl_cacttoadndas.cantcur,
            tbl_cacttoadndas.descrip,
            tbl_cacttoadndas.enabled,
            tbl_cacttos.codctto AS id_ctto,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov,
            tbl_cagenclients.descrip AS id_client,
            tbl_gentipos.descrip AS id_tipo
    	FROM tbl_cacttoadndas
        INNER JOIN tbl_cacttos
        ON tbl_cacttoadndas.id_ctto = tbl_cacttos.id_ctto
        INNER JOIN tbl_genpaises
        ON tbl_cacttoadndas.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_cacttoadndas.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_cagenclients
        ON tbl_cacttoadndas.id_client = tbl_cagenclients.id_client
        INNER JOIN tbl_gentipos
        ON tbl_cacttoadndas.id_tipo = tbl_gentipos.id_tipo
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_cacttoadndas.enabled = enabledA));
    END IF;
END
/*$$
DELIMITER ;*/
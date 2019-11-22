/* Recupera la lista de cabezera de factura */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_cafcthdr_all$$*/

CREATE PROCEDURE sp_p_lst_cafcthdr_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_cafacthdrs;
    ELSE
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
            tbl_genctrycodes.descrip AS id_ctrycodefijo,
            tbl_cacttos.codctto AS id_ctto,
            tbl_cacothdrs.rs AS id_cot
    	FROM tbl_cafacthdrs
        INNER JOIN tbl_cagenclients
        ON tbl_cafacthdrs.id_client = tbl_cagenclients.id_client
        INNER JOIN tbl_genpaises
        ON tbl_cafacthdrs.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_cafacthdrs.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_genctrycodes
        ON tbl_cafacthdrs.id_ctrycodefijo = tbl_genctrycodes.id_ctrycode
        INNER JOIN tbl_cacttos
        ON tbl_cafacthdrs.id_ctto = tbl_cacttos.id_ctto
        INNER JOIN tbl_cacothdrs
        ON tbl_cafacthdrs.id_cot = tbl_cacothdrs.id_cot;
    END IF;
END
/*$$
DELIMITER ;*/

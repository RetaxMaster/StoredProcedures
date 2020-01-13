/* Recupera la lista de productos */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_caprdcts_all$$*/

CREATE PROCEDURE sp_p_lst_caprdcts_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_caprods;
    ELSE
        SELECT 
            tbl_caprods.id_prod,
            tbl_caprods.cod,
            tbl_caprods.descrip,
            tbl_caprods.stock,
            tbl_caprods.tiposp,
            tbl_caprods.puvp,
            tbl_caprods.costu,
            tbl_caimps.valorPorc AS id_imp,
            tbl_genpaises.descrip AS id_pais
    	FROM tbl_caprods
        INNER JOIN tbl_caimps
        ON tbl_caprods.id_imp = tbl_caimps.id_imp
        INNER JOIN tbl_genpaises
        ON tbl_caprods.id_pais = tbl_genpaises.id_pais;
    END IF;
END
/*$$
DELIMITER ;*/

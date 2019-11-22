/* Recupera la lista de detalle de factura */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_cafctrdtls_all$$*/

CREATE PROCEDURE sp_p_lst_cafctrdtls_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_cafactdetails;
    ELSE
        SELECT 
            tbl_cafactdetails.id_factdetail,
            tbl_cafactdetails.cod,
            tbl_cafactdetails.descrip,
            tbl_cafactdetails.cant,
            tbl_cafactdetails.tiposp,
            tbl_cafactdetails.puvp,
            tbl_cafactdetails.valorPorc,
            tbl_cafactdetails.totaldlinea,
            tbl_cafacthdrs.rs AS id_fact,
            tbl_caprods.cod AS id_prod,
            tbl_caimps.descrip AS id_imp
    	FROM tbl_cafactdetails
        INNER JOIN tbl_cafacthdrs
        ON tbl_cafactdetails.id_fact = tbl_cafacthdrs.id_fact
        INNER JOIN tbl_caprods
        ON tbl_cafactdetails.id_prod = tbl_caprods.id_prod
        INNER JOIN tbl_caimps
        ON tbl_cafactdetails.id_imp = tbl_caimps.id_imp;
    END IF;
END
/*$$
DELIMITER ;*/

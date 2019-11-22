/* Recupera la lista de impuesto de factura */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_cafctrimp_all$$*/

CREATE PROCEDURE sp_p_lst_cafctrimp_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_cafactimps;
    ELSE
        SELECT 
            tbl_cafactimps.id_factimp,
            tbl_cafactimps.valorPorc,
            tbl_cafactimps.monto,
            tbl_cafactimps.descrip,
            tbl_cafacthdrs.rs AS id_fact,
            tbl_caimps.descrip AS id_imp
    	FROM tbl_cafactimps
        INNER JOIN tbl_cafacthdrs
        ON tbl_cafactimps.id_fact = tbl_cafacthdrs.id_fact
        INNER JOIN tbl_caimps
        ON tbl_cafactimps.id_imp = tbl_caimps.id_imp;
    END IF;
END
/*$$
DELIMITER ;*/

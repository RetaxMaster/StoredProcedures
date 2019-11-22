/* Recupera la lista de pie de factura */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_cafctrfoo_all$$*/

CREATE PROCEDURE sp_p_lst_cafctrfoo_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_cafactfoots;
    ELSE
        SELECT 
            tbl_cafactfoots.id_factfoot,
            tbl_cafactfoots.subtot,
            tbl_cafactfoots.biximp,
            tbl_cafactfoots.impttot,
            tbl_cafactfoots.desctot,
            tbl_cafactfoots.total,
            tbl_cafactfoots.observ,
            tbl_cafacthdrs.rs AS id_fact
    	FROM tbl_cafactfoots
        INNER JOIN tbl_cafacthdrs
        ON tbl_cafactfoots.id_fact = tbl_cafacthdrs.id_fact;
    END IF;
END
/*$$
DELIMITER ;*/

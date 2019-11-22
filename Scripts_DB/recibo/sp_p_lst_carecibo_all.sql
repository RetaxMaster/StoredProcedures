/* Recupera la lista de recibo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_carecibo_all$$*/

CREATE PROCEDURE sp_p_lst_carecibo_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_cacajarecibos;
    ELSE
        SELECT 
            tbl_cacajarecibos.id_cajarecibo,
            tbl_cacajarecibos.descrip,
            tbl_cacajarecibos.fecha,
            tbl_cacajarecibos.txdescrip,
            tbl_cacajarecibos.monto,
            tbl_cacajarecibos.aprobado,
            tbl_cafacthdrs.rs AS id_fact,
            tbl_cacothdrs.rs AS id_cot,
            tbl_cafps.descrip AS id_fp
    	FROM tbl_cacajarecibos
        INNER JOIN tbl_cafacthdrs
        ON tbl_cacajarecibos.id_fact = tbl_cafacthdrs.id_fact
        INNER JOIN tbl_cacothdrs
        ON tbl_cacajarecibos.id_cot = tbl_cacothdrs.id_cot
        INNER JOIN tbl_cafps
        ON tbl_cacajarecibos.id_fp = tbl_cafps.id_fp;
    END IF;
END
/*$$
DELIMITER ;*/

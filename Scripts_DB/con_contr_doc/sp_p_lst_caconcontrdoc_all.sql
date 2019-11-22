/* Recupera la lista de documentación de contratos y convenios */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_caconcontrdoc_all$$*/

CREATE PROCEDURE sp_p_lst_caconcontrdoc_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_cacttodocs;
    ELSE
        SELECT 
            tbl_cacttodocs.id_cttodoc,
            tbl_cacttodocs.fechains,
            tbl_cacttodocs.descrip,
            tbl_cacttodocs.urldoc,
            tbl_cacttos.codctto AS id_ctto,
            tbl_cacttoadndas.codctto AS id_cttoadnda
    	FROM tbl_cacttodocs
        INNER JOIN tbl_cacttos
        ON tbl_cacttodocs.id_ctto = tbl_cacttos.id_ctto
        INNER JOIN tbl_cacttoadndas
        ON tbl_cacttodocs.id_cttoadnda = tbl_cacttoadndas.id_cttoadnda;
    END IF;
END
/*$$
DELIMITER ;*/

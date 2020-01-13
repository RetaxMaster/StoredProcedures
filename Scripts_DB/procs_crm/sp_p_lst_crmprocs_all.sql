/* Recupera la lista de documentos de la empresa */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_crmprocs_all$$*/

CREATE PROCEDURE sp_p_lst_crmprocs_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_crmprocs;
    ELSE
        SELECT 
            tbl_crmprocs.id_proc,
            tbl_crmprocs.descrip,
            tbl_gentipos.descrip AS id_tipo
    	FROM tbl_crmprocs
        INNER JOIN tbl_gentipos
        ON tbl_crmprocs.id_tipo = tbl_gentipos.id_tipo;
    END IF;
END
/*$$
DELIMITER ;*/

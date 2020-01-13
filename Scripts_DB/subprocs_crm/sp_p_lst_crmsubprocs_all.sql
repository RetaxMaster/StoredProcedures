/* Recupera la lista de documentos de la empresa */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_crmsubprocs_all$$*/

CREATE PROCEDURE sp_p_lst_crmsubprocs_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_crmsubprocs;
    ELSE
        SELECT 
            tbl_crmsubprocs.id_subproc,
            tbl_crmsubprocs.descrip,
            tbl_crmprocs.descrip AS id_proc,
            tbl_gentipos.descrip AS id_tipo
    	FROM tbl_crmsubprocs
        INNER JOIN tbl_crmprocs
        ON tbl_crmsubprocs.id_proc = tbl_crmprocs.id_proc
        INNER JOIN tbl_gentipos
        ON tbl_crmsubprocs.id_tipo = tbl_gentipos.id_tipo;
    END IF;
END
/*$$
DELIMITER ;*/

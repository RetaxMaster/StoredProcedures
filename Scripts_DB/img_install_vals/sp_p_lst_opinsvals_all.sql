/* Recupera la lista de documentos de la empresa */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_opinsvals_all$$*/

CREATE PROCEDURE sp_p_lst_opinsvals_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_opimgsinstallvals;
    ELSE
        SELECT 
            tbl_opimgsinstallvals.id_imgsinstall,
            tbl_opimgsinstallvals.urlfoto,
            tbl_opcalinsts.cara AS id_calinst
    	FROM tbl_opimgsinstallvals
        INNER JOIN tbl_opcalinsts
        ON tbl_opimgsinstallvals.id_calinst = tbl_opcalinsts.id_calinst;
    END IF;
END
/*$$
DELIMITER ;*/

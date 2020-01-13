/* Recupera la lista de documentos de la empresa */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_opinspubs_all$$*/

CREATE PROCEDURE sp_p_lst_opinspubs_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_opimgsinstallpubs;
    ELSE
        SELECT 
            tbl_opimgsinstallpubs.id_imgsinstall,
            tbl_opimgsinstallpubs.urlfoto,
            tbl_opcalinsts.cara AS id_calinst
    	FROM tbl_opimgsinstallpubs
        INNER JOIN tbl_opcalinsts
        ON tbl_opimgsinstallpubs.id_calinst = tbl_opcalinsts.id_calinst;
    END IF;
END
/*$$
DELIMITER ;*/

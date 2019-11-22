/* Recupera la lista de documentos de la empresa */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_usrdocemps_all$$*/

CREATE PROCEDURE sp_p_lst_usrdocemps_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_usrdocemps;
    ELSE
        SELECT 
            tbl_usrdocemps.id_docemp,
            tbl_usrdocemps.titlefile,
            tbl_usrdocemps.descrip,
            tbl_usrdocemps.urlfile,
            tbl_usrcompanies.rs AS id_company
    	FROM tbl_usrdocemps
        INNER JOIN tbl_usrcompanies
        ON tbl_usrdocemps.id_company = tbl_usrcompanies.id_company;
    END IF;
END
/*$$
DELIMITER ;*/

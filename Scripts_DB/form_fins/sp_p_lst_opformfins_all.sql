/* Recupera la lista de formulario de finalización */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_opformfins_all$$*/

CREATE PROCEDURE sp_p_lst_opformfins_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_opformfins;
    ELSE
        SELECT 
            tbl_opformfins.id_formfin,
            tbl_opformfins.htmltext,
            tbl_opformfins.brid,
            tbl_opformfins.estatus,
            tbl_opformfins.tokenseg,
            tbl_opcalanunts.cara AS id_calanunt,
            tbl_gencalifs.descrip AS id_calif
    	FROM tbl_opformfins
        INNER JOIN tbl_opcalanunts
        ON tbl_opformfins.id_calanunt = tbl_opcalanunts.id_calanunt
        INNER JOIN tbl_gencalifs
        ON tbl_opformfins.id_calif = tbl_gencalifs.id_calif;
    END IF;
END
/*$$
DELIMITER ;*/

/* Recupera la lista de capacitadores */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_acadcaps_all$$*/

CREATE PROCEDURE sp_p_lst_acadcaps_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_acadcaps;
    ELSE
        SELECT 
            tbl_acadcaps.id_cap,
            tbl_acadcaps.formacad,
            tbl_acadcaps.skills,
            tbl_acadcaps.certif,
            tbl_acadcaps.exp,
            tbl_acadcaps.otros,
            tbl_usrdacs.username AS id_user
    	FROM tbl_acadcaps
        INNER JOIN tbl_usrdacs
        ON tbl_acadcaps.id_user = tbl_usrdacs.id_user;
    END IF;
END
/*$$
DELIMITER ;*/

/* Recupera la lista de planes académicos */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_acadplans_all$$*/

CREATE PROCEDURE sp_p_lst_acadplans_all (
    IN enabledA TINYINT(1)
)
BEGIN
    
    SELECT * 
    FROM tbl_acadplans
    WHERE (SELECT IF(enabledA = 2, TRUE, tbl_acadplans.lstenabled = enabledA));
    
END
/*$$
DELIMITER ;*/
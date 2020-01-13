/* Recupera la lista de lugares disponibles */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_caLstVals_all$$*/

CREATE PROCEDURE sp_p_lst_caLstVals_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_calstvals;
    ELSE
        SELECT
            tbl_calstvals.id_lstval,
            tbl_calstvals.descrip,
            tbl_calstvals.urlimg,
            tbl_cagenclients.descrip AS id_client
    	FROM tbl_calstvals
        INNER JOIN tbl_cagenclients
        ON tbl_calstvals.id_client = tbl_cagenclients.id_client;
    END IF;
END
/*$$
DELIMITER ;*/
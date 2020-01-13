/* Recupera datos de todas las listas de valores */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_caLstVals_all$$*/

CREATE PROCEDURE sp_p_lst_caLstVals_all ()
BEGIN
 
	    SELECT * 
    	FROM tbl_calstvals
		ORDER BY descrip;
END
/*$$
DELIMITER ;*/

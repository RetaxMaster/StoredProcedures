/* Recupera la lista de plantillas de encuestas */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_usrplatsurvs_all$$*/

CREATE PROCEDURE sp_p_lst_usrplatsurvs_all ()
BEGIN
	    SELECT * 
    	FROM tbl_tmplatsurvs;
END
/*$$
DELIMITER ;*/

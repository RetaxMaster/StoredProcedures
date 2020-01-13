/* Recupera datos de todas las listas de valores que concuerden con la descripción */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_caLstVals_descrip$$*/

CREATE PROCEDURE sp_p_lst_caLstVals_descrip (IN descripIN VARCHAR (160))
BEGIN
 
        SELECT * 
    	FROM tbl_calstvals
    	WHERE UPPER(descrip) LIKE UPPER(CONCAT('%',descripIN,'%'))
		ORDER BY descrip;

END
/*$$
DELIMITER ;*/

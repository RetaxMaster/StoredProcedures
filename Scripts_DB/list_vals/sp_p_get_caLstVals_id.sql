/* Busca en la lista de valores por su id. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_get_caLstVals_id$$ */

CREATE PROCEDURE sp_p_get_caLstVals_id (IN id_lstvalA INT (10))
BEGIN
 
    SELECT * 
    FROM tbl_calstvals
    WHERE id_lstval=id_lstvalA
    ORDER BY descrip;

END
/* 
$$

DELIMITER ;
*/


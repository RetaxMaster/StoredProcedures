/* Actualiza un valor. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_caLstVals_Update$$ */

CREATE PROCEDURE sp_p_set_caLstVals_Update (IN descripA VARCHAR (160), IN id_lstvalA INT (10))
BEGIN
	UPDATE tbl_calstvals SET
		descrip=descripA
	WHERE id_lstval=id_lstvalA;
END
/* 
$$

DELIMITER ;
*/
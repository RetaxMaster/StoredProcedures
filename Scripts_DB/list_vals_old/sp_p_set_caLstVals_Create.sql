/* Crea un nuevo valor. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_caLstVals_Create$$ */

CREATE PROCEDURE sp_p_set_caLstVals_Create (IN descripA VARCHAR (160))
BEGIN
	INSERT INTO tbl_calstvals (descrip) VALUES (descripA);
    
END
/* 
$$

DELIMITER ;
*/
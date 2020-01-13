/* Crea un nuevo lugar disponible. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_caLstVals_Create$$ */

CREATE PROCEDURE sp_p_set_caLstVals_Create (
    IN id_clientA INT (10), 
    IN descripA VARCHAR (100), 
    IN urlimgA VARCHAR (255)
)
BEGIN
	INSERT INTO tbl_calstvals (
        id_client, 
        descrip, 
        urlimg
    ) 
    VALUES (
        id_clientA, 
        descripA, 
        urlimgA
    );
    
END
/* 
$$

DELIMITER ;
*/
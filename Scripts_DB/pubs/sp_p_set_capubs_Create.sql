/* Crea una nueva publicidad. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_capubs_Create$$ */

CREATE PROCEDURE sp_p_set_capubs_Create (
    IN id_clientA INT (10), 
    IN descripA VARCHAR (1000), 
    IN urlimgA VARCHAR (255)
)
BEGIN
	INSERT INTO tbl_capubs (
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
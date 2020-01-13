/* Crea un nuevo lugar disponible. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cafps_Create$$ */

CREATE PROCEDURE sp_p_set_cafps_Create (
    IN id_paisA INT (10), 
    IN descripA VARCHAR (25), 
    IN enabledA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_cafps (
        id_pais, 
        descrip, 
        enabled
    ) 
    VALUES (
        id_paisA, 
        descripA, 
        enabledA
    );
    
END
/* 
$$

DELIMITER ;
*/
/* Crea un nuevo informe. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_opinformins_Create$$ */

CREATE PROCEDURE sp_p_set_opinformins_Create (
    IN htmltextA TEXT, 
    IN id_calinstA INT (10), 
    IN id_clientA INT (10), 
    IN estatusA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_opinformins (
        htmltext, 
        id_calinst, 
        id_client, 
        estatus
    ) 
    VALUES (
        htmltextA, 
        id_calinstA, 
        id_clientA, 
        estatusA
    );
    
END
/* 
$$

DELIMITER ;
*/
/* Crea un nuevo formulario de finalización. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_opformfins_Create$$ */

CREATE PROCEDURE sp_p_set_opformfins_Create (
    IN id_calanuntA INT (10), 
    IN htmltextA TEXT, 
    IN bridA INT (10), 
    IN estatusA TINYINT (1),
    IN id_califA INT (10),
    IN tokensegA VARCHAR (12)
)
BEGIN
	INSERT INTO tbl_opformfins (
        id_calanunt, 
        htmltext, 
        brid, 
        estatus,
        id_calif,
        tokenseg
    ) 
    VALUES (
        id_calanuntA, 
        htmltextA, 
        bridA, 
        estatusA,
        id_califA,
        tokensegA
    );
    
END
/* 
$$

DELIMITER ;
*/
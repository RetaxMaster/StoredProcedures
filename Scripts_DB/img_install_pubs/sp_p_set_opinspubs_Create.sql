/* Crea una nueva documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_opinspubs_Create$$ */

CREATE PROCEDURE sp_p_set_opinspubs_Create (
    IN id_calinstA INT (10), 
    IN urlfotoA VARCHAR (255)
)
BEGIN
	INSERT INTO tbl_opimgsinstallpubs (
        id_calinst, 
        urlfoto
    ) 
    VALUES (
        id_calinstA, 
        urlfotoA
    );
    
END
/* 
$$

DELIMITER ;
*/
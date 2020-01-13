/* Crea una nueva documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_opinsvals_Create$$ */

CREATE PROCEDURE sp_p_set_opinsvals_Create (
    IN id_calinstA INT (10), 
    IN urlfotoA VARCHAR (255)
)
BEGIN
	INSERT INTO tbl_opimgsinstallvals (
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
/* Crea una nueva documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_usrdocemps_Create$$ */

CREATE PROCEDURE sp_p_set_usrdocemps_Create (
    IN id_companyA INT (10), 
    IN titlefileA VARCHAR (150), 
    IN descripA TEXT, 
    IN urlfileA VARCHAR (255)
)
BEGIN
	INSERT INTO tbl_usrdocemps (
        id_company, 
        titlefile, 
        descrip, 
        urlfile
    ) 
    VALUES (
        id_companyA, 
        titlefileA, 
        descripA, 
        urlfileA
    );
    
END
/* 
$$

DELIMITER ;
*/
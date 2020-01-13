/* Crea una nueva documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_crmprocs_Create$$ */

CREATE PROCEDURE sp_p_set_crmprocs_Create (
    IN id_tipoA INT (10), 
    IN descripA VARCHAR (50)
)
BEGIN
	INSERT INTO tbl_crmprocs (
        id_tipo, 
        descrip
    ) 
    VALUES (
        id_tipoA, 
        descripA
    );
    
END
/* 
$$

DELIMITER ;
*/
/* Crea una nueva documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_crmsubprocs_Create$$ */

CREATE PROCEDURE sp_p_set_crmsubprocs_Create (
    IN id_procA INT (10),
    IN id_tipoA INT (10), 
    IN descripA VARCHAR (50)
)
BEGIN
	INSERT INTO tbl_crmsubprocs (
        id_proc,
        id_tipo, 
        descrip
    ) 
    VALUES (
        id_procA,
        id_tipoA, 
        descripA
    );
    
END
/* 
$$

DELIMITER ;
*/
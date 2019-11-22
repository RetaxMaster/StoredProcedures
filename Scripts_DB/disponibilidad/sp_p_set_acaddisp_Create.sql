/* Crea un nuevo cursos disponible. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acaddisp_Create$$ */

CREATE PROCEDURE sp_p_set_acaddisp_Create (
    IN id_planA INT (10), 
    IN id_paisA INT (10), 
    IN id_provA INT (10), 
    IN enabledA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_acaddispas (
        id_plan, 
        id_pais, 
        id_prov, 
        enabled
    ) 
    VALUES (
        id_planA, 
        id_paisA, 
        id_provA, 
        enabledA
    );
    
END
/* 
$$

DELIMITER ;
*/
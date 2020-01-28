/* Crea un nuevo matriz de capacitadores. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acadcappapa_Create$$ */

CREATE PROCEDURE sp_p_set_acadcappapa_Create (
    IN id_planA INT (10), 
    IN id_capA INT (10),
    IN id_paisA INT (10), 
    IN id_provA INT (10), 
    IN enabledA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_acadcappapais (
        id_plan,
        id_cap, 
        id_pais, 
        id_prov, 
        enabled
    ) 
    VALUES (
        id_planA,
        id_capA, 
        id_paisA, 
        id_provA, 
        enabledA
    );
    
END
/* 
$$

DELIMITER ;
*/
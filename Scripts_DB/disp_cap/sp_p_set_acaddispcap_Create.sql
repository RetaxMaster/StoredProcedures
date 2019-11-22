/* Crea un nuevo capacitadores disponible. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acaddispcap_Create$$ */

CREATE PROCEDURE sp_p_set_acaddispcap_Create (
    IN id_capA INT (10), 
    IN id_paisA INT (10), 
    IN id_provA INT (10), 
    IN enabledA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_acaddispcappais (
        id_cap, 
        id_pais, 
        id_prov, 
        enabled
    ) 
    VALUES (
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
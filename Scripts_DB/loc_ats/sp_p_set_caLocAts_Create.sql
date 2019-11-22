/* Crea un nuevo lugar disponible. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_caLocAts_Create$$ */

CREATE PROCEDURE sp_p_set_caLocAts_Create (
    IN id_paisA INT (10), 
    IN id_provA INT (10), 
    IN id_clientA INT (10), 
    IN id_tpubA INT (10), 
    IN codA VARCHAR (25), 
    IN caraA VARCHAR (5), 
    IN wideA FLOAT, 
    IN highA FLOAT, 
    IN enabledA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_calocats (
        id_pais, 
        id_prov, 
        id_client, 
        id_tpub, 
        cod, 
        cara, 
        wide, 
        high, 
        enabled
    ) 
    VALUES (
        id_paisA, 
        id_provA, 
        id_clientA, 
        id_tpubA, 
        codA, 
        caraA, 
        wideA, 
        highA, 
        enabledA
    );
    
END
/* 
$$

DELIMITER ;
*/
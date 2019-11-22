/* Crea un nuevo contrato. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cactrts_Create$$ */

CREATE PROCEDURE sp_p_set_cactrts_Create (
    IN codcttoA VARCHAR (25), 
    IN id_paisA INT (10), 
    IN id_provA INT (10), 
    IN id_clientA INT (10), 
    IN id_tipoA INT (10), 
    IN finiA DATE, 
    IN ffinA DATE, 
    IN ciclopubA TINYINT (3), 
    IN ciclomsgvalorA TINYINT (3),
    IN cantcurA TINYINT (3),
    IN descripA VARCHAR (300),
    IN enabledA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_cacttos (
        codctto, 
        id_pais, 
        id_prov, 
        id_client, 
        id_tipo, 
        fini,
        ffin, 
        ciclopub,
        ciclomsgvalor,
        cantcur,
        descrip,
        enabled
    ) 
    VALUES (
        codcttoA, 
        id_paisA, 
        id_provA, 
        id_clientA, 
        id_tipoA, 
        finiA,
        ffinA, 
        ciclopubA, 
        ciclomsgvalorA,
        cantcurA,
        descripA,
        enabledA
    );
    
END
/* 
$$

DELIMITER ;
*/
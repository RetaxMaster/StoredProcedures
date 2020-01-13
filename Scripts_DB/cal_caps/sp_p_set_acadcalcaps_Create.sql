/* Crea una nueva documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acadcalcaps_Create$$ */

CREATE PROCEDURE sp_p_set_acadcalcaps_Create (
    IN id_clientA INT (10), 
    IN id_cttoA INT (10), 
    IN id_planA INT (10), 
    IN id_capA INT (10),
    IN id_paisA INT (10),
    IN id_provA INT (10),
    IN finicioA DATE,
    IN ffinA DATE,
    IN estatusA INT (2),
    IN firmcierredocA VARCHAR (255),
    IN id_califA INT (10)
)
BEGIN
	INSERT INTO tbl_acadcalcapinsts (
        id_client, 
        id_ctto, 
        id_plan, 
        id_cap,
        id_pais,
        id_prov,
        finicio,
        ffin,
        estatus,
        firmcierredoc,
        id_calif
    ) 
    VALUES (
        id_clientA, 
        id_cttoA, 
        id_planA, 
        id_capA,
        id_paisA,
        id_provA,
        finicioA,
        ffinA,
        estatusA,
        firmcierredocA,
        id_califA
    );
    
END
/* 
$$

DELIMITER ;
*/
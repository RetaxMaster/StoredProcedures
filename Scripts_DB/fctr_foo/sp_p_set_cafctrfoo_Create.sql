/* Crea un nuevo pie de factura. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cafctrfoo_Create$$ */

CREATE PROCEDURE sp_p_set_cafctrfoo_Create (
    IN id_factA INT (10), 
    IN subtotA FLOAT, 
    IN biximpA FLOAT, 
    IN impttotA FLOAT,
    IN desctotA FLOAT,
    IN totalA FLOAT,
    IN observA VARCHAR(500)
)
BEGIN
	INSERT INTO tbl_cafactfoots (
        id_fact, 
        subtot, 
        biximp, 
        impttot,
        desctot,
        total,
        observ
    ) 
    VALUES (
        id_factA, 
        subtotA, 
        biximpA, 
        impttotA,
        desctotA,
        totalA,
        observA
    );
    
END
/* 
$$

DELIMITER ;
*/
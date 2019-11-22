/* Crea un nuevo impuesto de factura. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cafctrimp_Create$$ */

CREATE PROCEDURE sp_p_set_cafctrimp_Create (
    IN id_factA INT (10), 
    IN id_impA INT (10), 
    IN valorPorcA FLOAT, 
    IN montoA FLOAT,
    IN descripA VARCHAR (15)
)
BEGIN
	INSERT INTO tbl_cafactimps (
        id_fact, 
        id_imp, 
        valorPorc, 
        monto,
        descrip
    ) 
    VALUES (
        id_factA, 
        id_impA, 
        valorPorcA, 
        montoA,
        descripA
    );
    
END
/* 
$$

DELIMITER ;
*/
/* Crea un nuevo detalle de factura. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cafctrdtls_Create$$ */

CREATE PROCEDURE sp_p_set_cafctrdtls_Create (
    IN id_factA INT (10), 
    IN id_prodA INT (10), 
    IN codA VARCHAR (100), 
    IN descripA VARCHAR (300),
    IN cantA FLOAT,
    IN tipospA CHAR (1),
    IN puvpA FLOAT,
    IN id_impA INT (10),
    IN valorPorcA FLOAT,
    IN totaldlineaA FLOAT
)
BEGIN
	INSERT INTO tbl_cafactdetails (
        id_fact, 
        id_prod, 
        cod, 
        descrip,
        cant,
        tiposp,
        puvp,
        id_imp,
        valorPorc,
        totaldlinea
    ) 
    VALUES (
        id_factA, 
        id_prodA, 
        codA, 
        descripA,
        cantA,
        tipospA,
        puvpA,
        id_impA,
        valorPorcA,
        totaldlineaA
    );
    
END
/* 
$$

DELIMITER ;
*/
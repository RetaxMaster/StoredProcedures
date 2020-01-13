/* Crea un nuevo producto. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_caprdcts_Create$$ */

CREATE PROCEDURE sp_p_set_caprdcts_Create (
    IN codA VARCHAR (100), 
    IN descripA VARCHAR (300), 
    IN stockA FLOAT, 
    IN tipospA CHAR (1),
    IN puvpA FLOAT,
    IN id_impA INT (10),
    IN costuA FLOAT,
    IN id_paisA INT (10)
)
BEGIN
	INSERT INTO tbl_caprods (
        cod, 
        descrip, 
        stock, 
        tiposp,
        puvp,
        id_imp,
        costu,
        id_pais
    ) 
    VALUES (
        codA, 
        descripA, 
        stockA, 
        tipospA,
        puvpA,
        id_impA,
        costuA,
        id_paisA
    );
    
END
/* 
$$

DELIMITER ;
*/
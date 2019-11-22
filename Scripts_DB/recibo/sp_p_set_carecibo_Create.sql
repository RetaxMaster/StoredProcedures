/* Crea un nuevo recibo. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_carecibo_Create$$ */

CREATE PROCEDURE sp_p_set_carecibo_Create (
    IN id_factA INT (10), 
    IN id_cotA INT (10), 
    IN id_fpA INT (10), 
    IN descripA VARCHAR (25),
    IN fechaA DATE,
    IN txdescripA VARCHAR (25),
    IN montoA FLOAT,
    IN aprobadoA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_cacajarecibos (
        id_fact, 
        id_cot, 
        id_fp, 
        descrip,
        fecha,
        txdescrip,
        monto,
        aprobado
    ) 
    VALUES (
        id_factA, 
        id_cotA, 
        id_fpA, 
        descripA,
        fechaA,
        txdescripA,
        montoA,
        aprobadoA
    );
    
END
/* 
$$

DELIMITER ;
*/
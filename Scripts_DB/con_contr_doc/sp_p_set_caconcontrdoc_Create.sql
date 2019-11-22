/* Crea una nueva documentación de contratos y convenios. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_caconcontrdoc_Create$$ */

CREATE PROCEDURE sp_p_set_caconcontrdoc_Create (
    IN id_cttoA INT (10), 
    IN id_cttoadndaA INT (10), 
    IN fechainsA DATE, 
    IN descripA VARCHAR (1000),
    IN urldocA VARCHAR (255)
)
BEGIN
	INSERT INTO tbl_cacttodocs (
        id_ctto, 
        id_cttoadnda, 
        fechains, 
        descrip,
        urldoc
    ) 
    VALUES (
        id_cttoA, 
        id_cttoadndaA, 
        fechainsA, 
        descripA,
        urldocA
    );
    
END
/* 
$$

DELIMITER ;
*/
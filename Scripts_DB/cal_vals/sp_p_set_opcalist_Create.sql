/* Crea una nueva documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_opcalist_Create$$ */

CREATE PROCEDURE sp_p_set_opcalist_Create (
    IN id_cttoA INT (10), 
    IN id_clientanunA INT (10), 
    IN id_clientescA INT (10), 
    IN id_locatA INT (10),
    IN caraA VARCHAR (5),
    IN id_lstvalA INT (10),
    IN finicioA DATE,
    IN ffinA DATE,
    IN id_usersupA INT (10),
    IN id_userinstA INT (10),
    IN id_uservendA INT (10),
    IN estatusA TINYINT(2)
)
BEGIN
	INSERT INTO tbl_opcalinsts (
        id_ctto, 
        id_clientanun, 
        id_clientesc, 
        id_locat,
        cara,
        id_lstval,
        finicio,
        ffin,
        id_usersup,
        id_userinst,
        id_uservend,
        estatus
    ) 
    VALUES (
        id_cttoA, 
        id_clientanunA, 
        id_clientescA, 
        id_locatA,
        caraA,
        id_lstvalA,
        finicioA,
        ffinA,
        id_usersupA,
        id_userinstA,
        id_uservendA,
        estatusA
    );
    
END
/* 
$$

DELIMITER ;
*/
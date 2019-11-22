/* Crea una nueva cabezera de factura. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cafcthdr_Create$$ */

CREATE PROCEDURE sp_p_set_cafcthdr_Create (
    IN id_clientA INT (10), 
    IN rsA VARCHAR (100), 
    IN rucA VARCHAR (30), 
    IN addrsA VARCHAR (500),
    IN id_paisA INT (10),
    IN id_provA INT (10),
    IN id_ctrycodefijoA INT (10),
    IN telA VARCHAR (50),
    IN fechaA DATE,
    IN ffasocA VARCHAR (50),
    IN ppagoCCA TINYINT(2),
    IN cantdiasA TINYINT(5),
    IN id_cttoA INT(10),
    IN id_cotA INT(10),
    IN pagadoA TINYINT(1)
)
BEGIN
	INSERT INTO tbl_cafacthdrs (
        id_client, 
        rs, 
        ruc, 
        addrs,
        id_pais,
        id_prov,
        id_ctrycodefijo,
        tel,
        fecha,
        ffasoc,
        ppagoCC,
        cantdias,
        id_ctto,
        id_cot,
        pagado
    ) 
    VALUES (
        id_clientA, 
        rsA, 
        rucA, 
        addrsA,
        id_paisA,
        id_provA,
        id_ctrycodefijoA,
        telA,
        fechaA,
        ffasocA,
        ppagoCCA,
        cantdiasA,
        id_cttoA,
        id_cotA,
        pagadoA
    );
    
END
/* 
$$

DELIMITER ;
*/
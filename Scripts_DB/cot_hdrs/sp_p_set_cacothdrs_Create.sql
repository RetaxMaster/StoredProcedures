/* Crea una nueva documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cacothdrs_Create$$ */

CREATE PROCEDURE sp_p_set_cacothdrs_Create (
    IN id_clientA INT (10), 
    IN rsA INT (10), 
    IN rucA INT (10), 
    IN addrsA INT (10),
    IN id_paisA VARCHAR (5),
    IN id_provA INT (10),
    IN id_ctrycodefijoA DATE,
    IN telA DATE,
    IN fechaA INT (10),
    IN nroprefactA INT (10),
    IN ppagoCCA INT (10),
    IN cantdiasA TINYINT(2),
    IN verA TINYINT(2),
    IN facturadoA TINYINT(2)
)
BEGIN
	INSERT INTO tbl_cacothdrs (
        id_client, 
        rs, 
        ruc, 
        addrs,
        id_pais,
        id_prov,
        id_ctrycodefijo,
        tel,
        fecha,
        nroprefact,
        ppagoCC,
        cantdias,
        ver,
        facturado
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
        nroprefactA,
        ppagoCCA,
        cantdiasA,
        verA,
        facturadoA
    );
    
END
/* 
$$

DELIMITER ;
*/
/* Crea una nueva compañía. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_usrcomp_Create$$ */

CREATE PROCEDURE sp_p_set_usrcomp_Create (
    IN rsA VARCHAR (100), 
    IN rucA VARCHAR (30), 
    IN addrsA VARCHAR (300), 
    IN id_paisA INT (10), 
    IN id_provA INT (10), 
    IN emailA VARCHAR (255), 
    IN id_ctrycodefijoA INT (10), 
    IN telA VARCHAR (50), 
    IN enabledA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_usrcompanies (
        rs, 
        ruc, 
        addrs, 
        id_pais, 
        id_prov, 
        email,
        id_ctrycodefijo, 
        tel,
        enabled
    ) 
    VALUES (
        rsA, 
        rucA, 
        addrsA, 
        id_paisA, 
        id_provA, 
        emailA,
        id_ctrycodefijoA, 
        telA, 
        enabledA
    );
    
END
/* 
$$

DELIMITER ;
*/
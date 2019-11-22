/* Crea un nuevo contacto de cliente. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cagenccli_Create$$ */

CREATE PROCEDURE sp_p_set_cagenccli_Create (
    IN id_paisA INT (10), 
    IN id_provA INT (10), 
    IN id_clientA INT (10), 
    IN id_tpubA INT (10), 
    IN nomA VARCHAR (50), 
    IN apeA VARCHAR (50), 
    IN emailA VARCHAR (255), 
    IN id_ctrycodefijoA INT (10), 
    IN telA VARCHAR (50),
    IN extA VARCHAR (7),
    IN id_ctrycodecelA INT (10),
    IN celA VARCHAR (50),
    IN id_cargoA INT (10),
    IN id_dptoempA INT (10),
    IN principalA TINYINT (1),
    IN descripA TEXT,
    IN enabledA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_cacclients (
        id_pais, 
        id_prov, 
        id_client, 
        id_tpub, 
        nom, 
        ape,
        email, 
        id_ctrycodefijo,
        tel,
        ext,
        id_ctrycodecel,
        cel,
        id_cargo,
        id_dptoemp,
        principal,
        descrip,
        enabled
    ) 
    VALUES (
        id_paisA, 
        id_provA, 
        id_clientA, 
        id_tpubA, 
        nomA, 
        apeA,
        emailA, 
        id_ctrycodefijoA, 
        telA,
        extA,
        id_ctrycodecelA,
        celA,
        id_cargoA,
        id_dptoempA,
        principalA,
        descripA,
        enabledA
    );
    
END
/* 
$$

DELIMITER ;
*/
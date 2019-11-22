/* Crea un nuevo cliente. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_cagencli_Create$$ */

CREATE PROCEDURE sp_p_set_cagencli_Create (
    IN rsA VARCHAR (100), 
    IN rucA VARCHAR (30), 
    IN addrsA VARCHAR (300), 
    IN id_paisA INT (10), 
    IN id_provA INT (10), 
    IN emailA VARCHAR (255), 
    IN id_ctrycodefijoA INT (10), 
    IN telA VARCHAR (50), 
    IN extA VARCHAR (7),
    IN id_ctrycodecelA INT (10),
    IN celA VARCHAR (50),
    IN websiteA VARCHAR (255),
    IN id_tipoA INT (10),
    IN id_clasificA INT (10),
    IN id_califA INT (10),
    IN descripA TEXT,
    IN enabledA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_cagenclients (
        rs, 
        ruc, 
        addrs, 
        id_pais, 
        id_prov, 
        email,
        id_ctrycodefijo, 
        tel,
        ext,
        id_ctrycodecel,
        cel,
        website,
        id_tipo,
        id_clasific,
        id_calif,
        descrip,
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
        extA,
        id_ctrycodecelA,
        celA,
        websiteA,
        id_tipoA,
        id_clasificA,
        id_califA,
        descripA,
        enabledA
    );
    
END
/* 
$$

DELIMITER ;
*/
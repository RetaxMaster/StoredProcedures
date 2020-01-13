/* Crea una nueva documentos de la empresa. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_openc_Create$$ */

CREATE PROCEDURE sp_p_set_openc_Create (
    IN id_calcapinstA INT (10), 
    IN htmltextA TEXT, 
    IN bridA INT (10), 
    IN estatusA TINYINT (1),
    IN id_califA INT (10),
    IN tokensegA VARCHAR (12)
)
BEGIN
	INSERT INTO tbl_acadencs (
        id_calcapinst, 
        htmltext, 
        brid, 
        estatus,
        id_calif,
        tokenseg
    ) 
    VALUES (
        id_calcapinstA, 
        htmltextA, 
        bridA, 
        estatusA,
        id_califA,
        tokensegA
    );
    
END
/* 
$$

DELIMITER ;
*/
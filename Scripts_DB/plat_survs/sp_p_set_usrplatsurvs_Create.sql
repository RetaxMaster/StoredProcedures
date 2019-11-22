/* Crea una nueva plantilla de encuesta. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_usrplatsurvs_Create$$ */

CREATE PROCEDURE sp_p_set_usrplatsurvs_Create (
    IN titletemplatA INT (10), 
    IN bdytemplatA TEXT, 
    IN tipotemplatA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_tmplatsurvs (
        titletemplat, 
        bdytemplat, 
        tipotemplat
    ) 
    VALUES (
        titletemplatA, 
        bdytemplatA, 
        tipotemplatA
    );
    
END
/* 
$$

DELIMITER ;
*/
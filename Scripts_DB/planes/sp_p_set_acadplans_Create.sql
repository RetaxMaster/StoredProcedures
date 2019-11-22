/* Crea un nuevo plan académico. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acadplans_Create$$ */

CREATE PROCEDURE sp_p_set_acadplans_Create (
    IN tiempoduraA FLOAT, 
    IN id_modalidadA INT (10), 
    IN temarioA TEXT, 
    IN prerrequisitosA TEXT, 
    IN perfilA TEXT, 
    IN objetivosA TEXT, 
    IN títuloA VARCHAR (70), 
    IN fcreacA DATE, 
    IN lstenabledA TINYINT (1)
)
BEGIN
	INSERT INTO tbl_acadplans (
        tiempodura, 
        id_modalidad, 
        temario, 
        prerrequisitos, 
        perfil, 
        objetivos, 
        título, 
        fcreac, 
        lstenabled
    ) 
    VALUES (
        tiempoduraA, 
        id_modalidadA, 
        temarioA, 
        prerrequisitosA, 
        perfilA, 
        objetivosA, 
        títuloA, 
        fcreacA, 
        lstenabledA
    );
    
END
/* 
$$

DELIMITER ;
*/
/* Crea un nuevo capacitador. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_acadcaps_Create$$ */

CREATE PROCEDURE sp_p_set_acadcaps_Create (
    IN id_userA INT (10), 
    IN formacadA TEXT, 
    IN skillsA TEXT, 
    IN certifA TEXT,
    IN expA TEXT,
    IN otrosA TEXT
)
BEGIN
	INSERT INTO tbl_acadcaps (
        id_user, 
        formacad, 
        skills, 
        certif,
        exp,
        otros
    ) 
    VALUES (
        id_userA, 
        formacadA, 
        skillsA, 
        certifA,
        expA,
        otrosA
    );
    
END
/* 
$$

DELIMITER ;
*/
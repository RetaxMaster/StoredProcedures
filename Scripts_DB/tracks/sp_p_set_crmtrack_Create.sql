/* Crea un nuevo informe. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_set_crmtrack_Create$$ */

CREATE PROCEDURE sp_p_set_crmtrack_Create (
    IN id_cclientA INT (10), 
    IN id_clientA INT (10), 
    IN id_userA INT (10), 
    IN id_procA INT (10),
    IN id_subprocA INT (10),
    IN descripA VARCHAR (500),
    IN fcontactA DATE
)
BEGIN
	INSERT INTO tbl_crmtracks (
        id_cclient, 
        id_client, 
        id_user, 
        id_proc,
        id_subproc,
        descrip,
        fcontact
    ) 
    VALUES (
        id_cclientA, 
        id_clientA, 
        id_userA, 
        id_procA,
        id_subprocA,
        descripA,
        fcontactA
    );
    
END
/* 
$$

DELIMITER ;
*/
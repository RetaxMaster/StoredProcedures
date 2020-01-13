/* Recupera la lista de clientes */
DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_usrprofs_RecoveryAllUsers$$

CREATE PROCEDURE sp_p_get_usrprofs_RecoveryAllUsers (
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * FROM tbl_usrdacs
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_usrdacs.enabled = enabledA));
    ELSE
        SELECT 
            tbl_usrdacs.id_dac,
            tbl_usrdacs.username,
            tbl_usrdacs.passwd,
            tbl_usrdacs.enabled,
            tbl_usrdacs.externo,
            tbl_usrdacs.rol_modified,
            tbl_usrprofs.nom AS nom,
            tbl_usrprofs.ape AS ape,
            tbl_usrcompanies.rs AS rs,
            tbl_usrrols.descrip AS rol,
            tbl_genpaises.descrip AS id_pais
    	FROM tbl_usrdacs
        INNER JOIN tbl_usrprofs
        ON tbl_usrdacs.id_user = tbl_usrprofs.id_user
        INNER JOIN tbl_usrcompanies
        ON tbl_usrprofs.id_company = tbl_usrcompanies.id_company
        INNER JOIN tbl_genpaises
        ON tbl_usrcompanies.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_usrrols
        ON tbl_usrdacs.id_rol = tbl_usrrols.id_rol
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_usrdacs.enabled = enabledA));
    END IF;
END
$$
DELIMITER ;
/* Recupera la lista de matriz de capacitadores */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_acadcappapa_all$$*/

CREATE PROCEDURE sp_p_lst_acadcappapa_all (
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_acadcappapais
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_acadcappapais.enabled = enabledA));
    ELSE
        SELECT
            tbl_acadcappapais.id_cappapais,
            tbl_acadcappapais.enabled,
            tbl_acadplans.titulo AS id_plan,
            tbl_acadcaps.formacad AS id_cap,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov,
            tbl_usrprofs.nom AS nom,
            tbl_usrprofs.ape AS ape
    	FROM tbl_acadcappapais
        INNER JOIN tbl_acadplans
        ON tbl_acadcappapais.id_plan = tbl_acadplans.id_plan
        INNER JOIN tbl_acadcaps
        ON tbl_acadcappapais.id_cap = tbl_acadcaps.id_cap
        INNER JOIN tbl_usrprofs
        ON tbl_acadcaps.id_user = tbl_usrprofs.id_user
        INNER JOIN tbl_genpaises
        ON tbl_acadcappapais.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_acadcappapais.id_prov = tbl_genprovs.id_prov        
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_acadcappapais.enabled = enabledA));
    END IF;
END
/*$$
DELIMITER ;*/
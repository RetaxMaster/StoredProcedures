/* Recupera la lista de compañias */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_usrcomp_all$$*/

CREATE PROCEDURE sp_p_lst_usrcomp_all (
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_usrcompanies
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_usrcompanies.enabled = enabledA));
    ELSE
        SELECT 
            tbl_usrcompanies.id_company,
            tbl_usrcompanies.rs,
            tbl_usrcompanies.ruc,
            tbl_usrcompanies.addrs,
            tbl_usrcompanies.email,
            tbl_usrcompanies.tel,
            tbl_usrcompanies.enabled,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov,
            tbl_genctrycodes.descrip AS id_ctrycodefijo
    	FROM tbl_usrcompanies
        INNER JOIN tbl_genpaises
        ON tbl_usrcompanies.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_usrcompanies.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_genctrycodes
        ON tbl_usrcompanies.id_ctrycodefijo = tbl_genctrycodes.id_ctrycode
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_usrcompanies.enabled = enabledA));
    END IF;
END
/*$$
DELIMITER ;*/

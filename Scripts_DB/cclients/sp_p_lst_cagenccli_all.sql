/* Recupera la lista de contacto de clientes */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_cagenccli_all$$*/

CREATE PROCEDURE sp_p_lst_cagenccli_all (
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_cacclients
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_cacclients.enabled = enabledA));
    ELSE
        SELECT 
            tbl_cacclients.id_cclient,
            tbl_cacclients.nom,
            tbl_cacclients.ape,
            tbl_cacclients.email,
            tbl_cacclients.tel,
            tbl_cacclients.ext,
            tbl_cacclients.cel,
            tbl_cacclients.principal,
            tbl_cacclients.descrip,
            tbl_cacclients.enabled,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov,
            ctrycodefijo.descrip AS id_ctrycodefijo,
            ctrycodecel.descrip AS id_ctrycodecel,
            tbl_cagenclients.rs AS id_client,
            tbl_genfpubs.descrip AS id_tpub,
            tbl_gencargos.descrip AS id_cargo,
            tbl_gendptoemp.descrip AS id_dptoemp
    	FROM tbl_cacclients
        INNER JOIN tbl_genpaises
        ON tbl_cacclients.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_cacclients.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_genctrycodes AS ctrycodefijo
        ON tbl_cacclients.id_ctrycodefijo = ctrycodefijo.id_ctrycode
        INNER JOIN tbl_genctrycodes AS ctrycodecel
        ON tbl_cacclients.id_ctrycodecel = ctrycodecel.id_ctrycode
        INNER JOIN tbl_cagenclients
        ON tbl_cacclients.id_client = tbl_cagenclients.id_client
        INNER JOIN tbl_genfpubs
        ON tbl_cacclients.id_tpub = tbl_genfpubs.id_tpub
        INNER JOIN tbl_gencargos
        ON tbl_cacclients.id_cargo = tbl_gencargos.id_cargo
        INNER JOIN tbl_gendptoemp
        ON tbl_cacclients.id_dptoemp = tbl_gendptoemp.id_dptoemp
        WHERE (SELECT IF(enabledA = 2, TRUE, tbl_cacclients.enabled = enabledA));
    END IF;
END
/*$$
DELIMITER ;*/
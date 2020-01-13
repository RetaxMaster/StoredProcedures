/* Recupera la lista de documentos de la empresa */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_acadcalcaps_all$$*/

CREATE PROCEDURE sp_p_lst_acadcalcaps_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_acadcalcapinsts;
    ELSE
        SELECT 
            tbl_acadcalcapinsts.id_calcapinst,
            tbl_acadcalcapinsts.finicio,
            tbl_acadcalcapinsts.ffin,
            tbl_acadcalcapinsts.estatus,
            tbl_acadcalcapinsts.firmcierredoc,
            tbl_cagenclients.rs AS id_client,
            tbl_cacttos.codctto AS id_ctto,
            tbl_acadplans.título AS id_plan,
            tbl_usrprofs.nom AS cap_nom,
            tbl_usrprofs.ape AS cap_ape,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov,
            tbl_gencalifs.descrip AS id_calif
    	FROM tbl_acadcalcapinsts
        INNER JOIN tbl_cagenclients
        ON tbl_acadcalcapinsts.id_client = tbl_cagenclients.id_client
        INNER JOIN tbl_cacttos
        ON tbl_acadcalcapinsts.id_ctto = tbl_cacttos.id_ctto
        INNER JOIN tbl_acadplans
        ON tbl_acadcalcapinsts.id_plan = tbl_acadplans.id_plan
        INNER JOIN tbl_acadcaps
        ON tbl_acadcalcapinsts.id_cap = tbl_acadcaps.id_cap
        INNER JOIN tbl_usrprofs
        ON tbl_acadcaps.id_user = tbl_usrprofs.id_user
        INNER JOIN tbl_genpaises
        ON tbl_acadcalcapinsts.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_acadcalcapinsts.id_prov = tbl_genprovs.id_prov
        INNER JOIN tbl_gencalifs
        ON tbl_acadcalcapinsts.id_calif = tbl_gencalifs.id_calif;
    END IF;
END
/*$$
DELIMITER ;*/

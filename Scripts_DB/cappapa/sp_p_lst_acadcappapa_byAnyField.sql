/* Recupera una lista de matriz de capacitadores filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_acadcappapa_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_acadcappapa_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160), 
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_acadcappapais 
        WHERE (SELECT IF(", enabledA ," = 2, TRUE, tbl_acadcappapais.enabled = ", enabledA ,"))
        AND ", field ," LIKE ?;");
    ELSE
        SET @sql = CONCAT("
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
        WHERE (SELECT IF(", enabledA ," = 2, TRUE, tbl_acadcappapais.enabled = ", enabledA ,"))
        AND " , field ," LIKE ?;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

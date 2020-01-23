/* Recupera una lista de cursos disponibles filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_acaddisp_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_acaddisp_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160), 
    IN enabledA TINYINT(1), 
    IN shouldJoin TINYINT (1),
    IN extraWhere TEXT
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_acaddispas 
        WHERE (SELECT IF(", enabledA ," = 2, TRUE, tbl_acaddispas.enabled = ", enabledA ,"))
        AND ", field ," LIKE ?;");
    ELSE
        SET @sql = CONCAT("
        SELECT
            tbl_acaddispas.id_dispa,
            tbl_acaddispas.enabled,
            tbl_acadplans.titulo AS id_plan,
            tbl_genpaises.descrip AS id_pais,
            tbl_genprovs.descrip AS id_prov
    	FROM tbl_acaddispas
        INNER JOIN tbl_acadplans
        ON tbl_acaddispas.id_plan = tbl_acadplans.id_plan
        INNER JOIN tbl_genpaises
        ON tbl_acaddispas.id_pais = tbl_genpaises.id_pais
        INNER JOIN tbl_genprovs
        ON tbl_acaddispas.id_prov = tbl_genprovs.id_prov 
        WHERE (SELECT IF(", enabledA ," = 2, TRUE, tbl_acaddispas.enabled = ", enabledA ,"))
        AND " , field ," LIKE ?
        ", extraWhere , ";");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

/* Recupera una lista de capacitadores filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_acadcaps_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_acadcaps_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),
    IN shouldJoin TINYINT (1),
    IN extraWhere TEXT
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_acadcaps 
        WHERE ", field , " LIKE ?;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_acadcaps.id_cap,
            tbl_acadcaps.formacad,
            tbl_acadcaps.skills,
            tbl_acadcaps.certif,
            tbl_acadcaps.exp,
            tbl_acadcaps.otros,
            tbl_usrprofs.nom AS nom,
            tbl_usrprofs.ape AS ape
    	FROM tbl_acadcaps
        INNER JOIN tbl_usrprofs
        ON tbl_acadcaps.id_user = tbl_usrprofs.id_user
        WHERE " , field , " LIKE ?
        ", extraWhere , ";");
    END IF;
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

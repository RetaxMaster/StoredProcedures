/* Recupera un único registro de calendario de anuncios filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_openc_byAnyField$$*/

CREATE PROCEDURE sp_p_get_openc_byAnyField (
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
    	FROM tbl_acadencs
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_acadencs.id_enc,
            tbl_acadencs.htmltext,
            tbl_acadencs.brid,
            tbl_acadencs.estatus,
            tbl_acadencs.tokenseg,
            tbl_acadcalcapinsts.finicio AS id_calcapinst,
            tbl_gencalifs.descrip AS id_calif
    	FROM tbl_acadencs
        INNER JOIN tbl_acadcalcapinsts
        ON tbl_acadencs.id_calcapinst = tbl_acadcalcapinsts.id_calcapinst
        INNER JOIN tbl_gencalifs
        ON tbl_acadencs.id_calif = tbl_gencalifs.id_calif
        WHERE " , field , " LIKE ?
        ", extraWhere , "
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

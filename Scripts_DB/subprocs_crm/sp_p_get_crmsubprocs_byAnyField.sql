/* Recupera un único registro de calendario de anuncios filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_crmsubprocs_byAnyField$$*/

CREATE PROCEDURE sp_p_get_crmsubprocs_byAnyField (
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
    	FROM tbl_crmsubprocs
        WHERE ", field ," LIKE ?
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_crmsubprocs.id_subproc,
            tbl_crmsubprocs.descrip,
            tbl_crmprocs.descrip AS id_proc,
            tbl_gentipos.descrip AS id_tipo
    	FROM tbl_crmsubprocs
        INNER JOIN tbl_crmprocs
        ON tbl_crmsubprocs.id_proc = tbl_crmprocs.id_proc
        INNER JOIN tbl_gentipos
        ON tbl_crmsubprocs.id_tipo = tbl_gentipos.id_tipo
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

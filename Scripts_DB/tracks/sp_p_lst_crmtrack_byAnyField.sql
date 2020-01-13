/* Recupera una lista de informe filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_crmtrack_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_crmtrack_byAnyField (
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
    	FROM tbl_crmtracks 
        WHERE ", field , " LIKE ?;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_crmtracks.id_track,
            tbl_crmtracks.descrip,
            tbl_crmtracks.fcontact,
            tbl_cagenclients.rs AS id_client,
            tbl_cacclients.nom AS nom,
            tbl_cacclients.ape AS ape,
            tbl_usrdacs.username AS id_user,
            tbl_crmprocs.descrip AS id_proc,
            tbl_crmsubprocs.descrip AS id_subproc
    	FROM tbl_crmtracks
        INNER JOIN tbl_cacclients
        ON tbl_crmtracks.id_cclient = tbl_cacclients.id_cclient
        INNER JOIN tbl_cagenclients
        ON tbl_crmtracks.id_client = tbl_cagenclients.id_client
        INNER JOIN tbl_usrdacs
        ON tbl_crmtracks.id_user = tbl_usrdacs.id_user
        INNER JOIN tbl_crmprocs
        ON tbl_crmtracks.id_proc = tbl_crmprocs.id_proc
        INNER JOIN tbl_crmsubprocs
        ON tbl_crmtracks.id_subproc = tbl_crmsubprocs.id_subproc
        WHERE " , field , " LIKE ?
        ", extraWhere , ";");
    END IF;
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

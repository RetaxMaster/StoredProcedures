/* Recupera la lista de informe */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_crmtrack_all$$*/

CREATE PROCEDURE sp_p_lst_crmtrack_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_crmtracks;
    ELSE
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
        ON tbl_crmtracks.id_subproc = tbl_crmsubprocs.id_subproc;
    END IF;
END
/*$$
DELIMITER ;*/

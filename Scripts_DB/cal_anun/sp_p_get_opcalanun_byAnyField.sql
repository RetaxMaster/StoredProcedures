/* Recupera un único registro de calendario de anuncios filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_get_opcalanun_byAnyField$$*/

CREATE PROCEDURE sp_p_get_opcalanun_byAnyField (
    IN shouldJoin TINYINT (1),
    IN whereSQL TEXT
)
BEGIN
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_opcalanunts
        ", whereSQL , "
        LIMIT 1;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_opcalanunts.id_calanunt,
            tbl_opcalanunts.cara,
            tbl_opcalanunts.finicio,
            tbl_opcalanunts.ffin,
            tbl_opcalanunts.estatus,
            tbl_cacttos.codctto AS id_ctto,
            clientanun.rs AS id_clientanun,
            clientesc.rs AS id_clientesc,
            tbl_calocats.cod AS id_locat,
            tbl_capubs.descrip AS id_pub,
            usersup.nom AS sup_nom,
            usersup.ape AS sup_ape,
            userinst.nom AS inst_nom,
            userinst.ape AS inst_ape,
            uservend.nom AS vend_nom,
            uservend.ape AS vend_ape
    	FROM tbl_opcalanunts
        INNER JOIN tbl_cacttos
        ON tbl_opcalanunts.id_ctto = tbl_cacttos.id_ctto
        INNER JOIN tbl_cagenclients AS clientanun
        ON tbl_opcalanunts.id_clientanun = clientanun.id_client
        INNER JOIN tbl_cagenclients AS clientesc
        ON tbl_opcalanunts.id_clientesc = clientesc.id_client
        INNER JOIN tbl_calocats
        ON tbl_opcalanunts.id_locat = tbl_calocats.id_locat
        INNER JOIN tbl_capubs
        ON tbl_opcalanunts.id_pub = tbl_capubs.id_pub
        INNER JOIN tbl_usrprofs AS usersup
        ON tbl_opcalanunts.id_usersup = usersup.id_user
        INNER JOIN tbl_usrprofs AS userinst
        ON tbl_opcalanunts.id_userinst = userinst.id_user
        INNER JOIN tbl_usrprofs AS uservend
        ON tbl_opcalanunts.id_uservend = uservend.id_user
        ", whereSQL , "
        LIMIT 1;");
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

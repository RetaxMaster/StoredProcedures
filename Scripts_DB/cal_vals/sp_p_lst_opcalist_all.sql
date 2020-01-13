/* Recupera la lista de documentos de la empresa */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_opcalist_all$$*/

CREATE PROCEDURE sp_p_lst_opcalist_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_opcalinsts;
    ELSE
        SELECT 
            tbl_opcalinsts.id_calinst,
            tbl_opcalinsts.cara,
            tbl_opcalinsts.finicio,
            tbl_opcalinsts.ffin,
            tbl_opcalinsts.estatus,
            tbl_cacttos.codctto AS id_ctto,
            clientanun.rs AS id_clientanun,
            clientesc.rs AS id_clientesc,
            tbl_calocats.cod AS id_locat,
            tbl_calstvals.descrip AS id_lstval,
            usersup.nom AS sup_nom,
            usersup.ape AS sup_ape,
            userinst.nom AS inst_nom,
            userinst.ape AS inst_ape,
            uservend.nom AS vend_nom,
            uservend.ape AS vend_ape
    	FROM tbl_opcalinsts
        INNER JOIN tbl_cacttos
        ON tbl_opcalinsts.id_ctto = tbl_cacttos.id_ctto
        INNER JOIN tbl_cagenclients AS clientanun
        ON tbl_opcalinsts.id_clientanun = clientanun.id_client
        INNER JOIN tbl_cagenclients AS clientesc
        ON tbl_opcalinsts.id_clientesc = clientesc.id_client
        INNER JOIN tbl_calocats
        ON tbl_opcalinsts.id_locat = tbl_calocats.id_locat
        INNER JOIN tbl_calstvals
        ON tbl_opcalinsts.id_lstval = tbl_calstvals.id_lstval
        INNER JOIN tbl_usrprofs AS usersup
        ON tbl_opcalinsts.id_usersup = usersup.id_user
        INNER JOIN tbl_usrprofs AS userinst
        ON tbl_opcalinsts.id_userinst = userinst.id_user
        INNER JOIN tbl_usrprofs AS uservend
        ON tbl_opcalinsts.id_uservend = uservend.id_user;
    END IF;
END
/*$$
DELIMITER ;*/

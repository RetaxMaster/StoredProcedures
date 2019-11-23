/* Recupera la lista de informe */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_opinformins_all$$*/

CREATE PROCEDURE sp_p_lst_opinformins_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_opinformins;
    ELSE
        SELECT 
            tbl_opinformins.id_informin,
            tbl_opinformins.htmltext,
            tbl_opinformins.estatus,
            tbl_opcalinsts.cara AS id_calinst,
            tbl_cagenclients.rs AS id_client
    	FROM tbl_opinformins
        INNER JOIN tbl_opcalinsts
        ON tbl_opinformins.id_calinst = tbl_opcalinsts.id_calinst
        INNER JOIN tbl_cagenclients
        ON tbl_opinformins.id_client = tbl_cagenclients.id_client;
    END IF;
END
/*$$
DELIMITER ;*/

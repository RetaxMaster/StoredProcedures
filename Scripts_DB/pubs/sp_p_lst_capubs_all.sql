/* Recupera la lista de publicidad */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_capubs_all$$*/

CREATE PROCEDURE sp_p_lst_capubs_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_capubs;
    ELSE
        SELECT 
            tbl_capubs.id_pub,
            tbl_capubs.descrip,
            tbl_capubs.urlimg,
            tbl_cagenclients.rs AS id_client
    	FROM tbl_capubs
        INNER JOIN tbl_cagenclients
        ON tbl_capubs.id_client = tbl_cagenclients.id_client;
    END IF;
END
/*$$
DELIMITER ;*/

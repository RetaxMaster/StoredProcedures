/* Recupera una lista de pie de factura filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_cafctrfoo_byAnyField$$*/

CREATE PROCEDURE sp_p_lst_cafctrfoo_byAnyField (
    IN field VARCHAR (160), 
    IN val VARCHAR (160),
    IN shouldJoin TINYINT (1)
)
BEGIN

    SET @val = CONCAT("%" , val , "%");
    
    IF shouldJoin = 0 THEN
        SET @sql = CONCAT("
	    SELECT * 
    	FROM tbl_cafactfoots 
        WHERE ", field , " LIKE ?;");
    ELSE
        SET @sql = CONCAT("
        SELECT 
            tbl_cafactfoots.id_factfoot,
            tbl_cafactfoots.subtot,
            tbl_cafactfoots.biximp,
            tbl_cafactfoots.impttot,
            tbl_cafactfoots.desctot,
            tbl_cafactfoots.total,
            tbl_cafactfoots.observ,
            tbl_cafacthdrs.rs AS id_fact
    	FROM tbl_cafactfoots
        INNER JOIN tbl_cafacthdrs
        ON tbl_cafactfoots.id_fact = tbl_cafacthdrs.id_fact
        WHERE " , field , " LIKE ?;");
    END IF;
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt USING @val;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

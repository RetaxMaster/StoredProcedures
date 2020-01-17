/* Recupera un único registro de cabezera de factura filtrándolo por algún campo */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_executeSQL$$*/

CREATE PROCEDURE sp_p_executeSQL (
    IN stmnt TEXT
)
BEGIN

    SET @sql = stmnt;

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END
/*$$
DELIMITER ;*/

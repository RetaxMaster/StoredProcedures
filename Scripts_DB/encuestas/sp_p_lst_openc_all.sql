/* Recupera la lista de documentos de la empresa */
/*DELIMITER $$ 

DROP PROCEDURE IF EXISTS sp_p_lst_openc_all$$*/

CREATE PROCEDURE sp_p_lst_openc_all (
    IN shouldJoin TINYINT (1)
)
BEGIN
    
    IF shouldJoin = 0 THEN
	    SELECT * 
    	FROM tbl_acadencs;
    ELSE
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
        ON tbl_acadencs.id_calif = tbl_gencalifs.id_calif;
    END IF;
END
/*$$
DELIMITER ;*/

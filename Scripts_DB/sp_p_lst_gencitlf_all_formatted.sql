/* Actualiza un cliente. */
/* DELIMITER $$

DROP PROCEDURE IF EXISTS sp_p_lst_gencitlf_all_formatted$$ */

CREATE PROCEDURE sp_p_lst_gencitlf_all_formatted ()
BEGIN

	SELECT tlf.id_ctrycode, tlf.descrip, concat_ws(" ", ctry.descrip, tlf.descrip), ctry.descrip
    FROM tbl_genctrycodes AS tlf 
    JOIN tbl_genpaises AS ctry
    ON tlf.id_pais=ctry.id_pais;

END
/* 
$$

DELIMITER ;
*/
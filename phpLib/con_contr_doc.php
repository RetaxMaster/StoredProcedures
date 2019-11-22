<?php
/*	
 tbl_cacttodocs
	id_cttodoc
    id_ctto
    id_cttoadnda
    fechains
    descrip
    urldoc
*/

// Crea una nueva ubicación
function concontrdoc_createRecord($id_ctto, $id_cttoadnda, $fechains, $descrip, $urldoc)
{
    $SQLStrQuery = "CALL sp_p_set_caconcontrdoc_Create($id_ctto, $id_cttoadnda, $fechains, $descrip, $urldoc)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function concontrdoc_updateRecord($fields, $id_cttodoc)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            $SQLStrQuery = "CALL sp_p_set_caconcontrdoc_Update($key, $value, $id_cttodoc)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function concontrdoc_recoveryAllList(&$nDocs, &$Docs, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_caconcontrdoc_all($tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function concontrdoc_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_caconcontrdoc_byAnyField($field, $value, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function concontrdoc_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_caconcontrdoc_byAnyField($field, $value, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

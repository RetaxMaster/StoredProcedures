<?php
/*	
 tbl_calocats
	id_locat
    id_pais
    id_prov
    id_client
    id_tpub
    cod
    cara
    wide
    high
    enabled
*/

// Crea una nueva ubicación
function locs_createRecord($id_pais, $id_prov, $id_client, $id_tpub, $cod, $cara, $wide, $high, $enabled)
{
    $SQLStrQuery = "CALL sp_p_set_caLocAts_Create($id_pais, $id_prov, $id_client, $id_tpub, $cod, $cara, $wide, $high, $enabled)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function locs_updateRecord($fields, $id_locat)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            $SQLStrQuery = "CALL sp_p_set_caLocAts_Update($key, $value, $id_locat)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
    }
    else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function locs_recoveryAllList(&$nDocs, &$Docs, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_caLocAts_all($enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function locs_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_caLocAts_byAnyField($field, $value, $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function locs_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_caLocAts_byAnyField($field, $value, $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}
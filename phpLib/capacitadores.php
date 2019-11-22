<?php
/*	
 tbl_acadcaps
	id_cap
    id_user
    formacad
    skills
    certif
    exp
    otros
*/

// Crea una nueva ubicación
function caps_createRecord($id_user, $formacad, $skills, $certif, $exp, $otros)
{
    $SQLStrQuery = "CALL sp_p_set_acadcaps_Create($id_user, $formacad, $skills, $certif, $exp, $otros)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function caps_updateRecord($fields, $id_cap)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            $SQLStrQuery = "CALL sp_p_set_acadcaps_Update($key, $value, $id_cap)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function caps_recoveryAllList(&$nDocs, &$Docs, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_acadcaps_all($tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function caps_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_acadcaps_byAnyField($field, $value, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function caps_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_acadcaps_byAnyField($field, $value, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

<?php
/*	
 tbl_crmtracks
	id_track
    id_cclient
    id_client
    id_user
    id_proc
    id_subproc
    descrip
    fcontact
*/

// Crea una nueva ubicación
function track_createRecord($id_cclient, $id_client, $id_user, $id_proc, $id_subproc, $descrip, $fcontact)
{
    $SQLStrQuery = "CALL sp_p_set_crmtrack_Create('$id_cclient', '$id_client', '$id_user', '$id_proc', '$id_subproc', '$descrip', '$fcontact')";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function track_updateRecord($fields, $id_informin)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            if ($value !== "") {
                $SQLStrQuery = "CALL sp_p_set_crmtrack_Update('$key', '$value', $id_informin)";
                SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
            }
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function track_recoveryAllList(&$nDocs, &$Docs, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_crmtrack_all($tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 8); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function track_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $extraWhere, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_crmtrack_byAnyField('$field', '$value', $tinyint, '$extraWhere')";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 8); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function track_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $extraWhere, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_crmtrack_byAnyField('$field', '$value', $tinyint, '$extraWhere')";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 8); // Pertenece a dbmngmtAdmin.php
}

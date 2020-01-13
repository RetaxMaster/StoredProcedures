<?php
/*	
 tbl_opformfins
	id_formfin
    id_calanunt
    htmltext
    brid
    estatus
    id_calif
    tokenseg
*/

// Crea una nueva ubicación
function formfins_createRecord($id_calanunt, $htmltext, $brid, $estatus, $id_calif, $tokenseg)
{
    $SQLStrQuery = "CALL sp_p_set_opformfins_Create($id_calanunt, $htmltext, $brid, $estatus, $id_calif, $tokenseg)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function formfins_updateRecord($fields, $id_formfin)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            if ($value !== "") {
            $SQLStrQuery = "CALL sp_p_set_opformfins_Update('$key', '$value', $id_formfin)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function formfins_recoveryAllList(&$nDocs, &$Docs, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_opformfins_all($tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function formfins_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_opformfins_byAnyField('$field', '$value', $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function formfins_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_opformfins_byAnyField('$field', '$value', $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

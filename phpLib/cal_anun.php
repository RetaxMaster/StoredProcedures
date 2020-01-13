<?php
/*	
 tbl_opcalanunts
	id_calanunt
    id_ctto
    id_clientanun
    id_clientesc
    id_locat
    cara
    id_pub
    finicio
    ffin
    id_usersup
    id_userinst
    id_uservend
    estatus
*/

// Crea una nueva ubicación
function calanun_createRecord($tbl_opcalanunts, $id_calanunt, $id_ctto, $id_clientanun, $id_clientesc, $id_locat, $cara, $id_pub, $finicio, $ffin, $id_usersup, $id_userinst, $id_uservend, $estatus)
{
    $SQLStrQuery = "CALL sp_p_set_opcalanun_Create('$tbl_opcalanunts', '$id_calanunt', '$id_ctto', '$id_clientanun', '$id_clientesc', '$id_locat', '$cara', '$id_pub', '$finicio', $'ffin', $'id_usersup', '$id_userinst', '$id_uservend', '$estatus')";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function calanun_updateRecord($fields, $id_docemp)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            if ($value !== "") {
                $SQLStrQuery = "CALL sp_p_set_opcalanun_Update('$key', '$value', '$id_docemp')";
                SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
            }
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function calanun_recoveryAllList(&$nDocs, &$Docs, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_opcalanun_all($tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 13); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function calanun_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $extraWhere, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_opcalanun_byAnyField('$field', '$value', $tinyint, '$extraWhere')";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 13); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function calanun_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $extraWhere, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_opcalanun_byAnyField('$field', '$value', $tinyint, '$extraWhere')";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 13); // Pertenece a dbmngmtAdmin.php
}

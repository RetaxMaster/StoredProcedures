<?php
/*	
 tbl_usrcompanies
	id_company
    rs
    ruc
    addrs
    id_pais
    id_prov
    email
    id_ctrycode
    tel
    enabled
*/

// Crea una nueva ubicación
function comp_createRecord($rs, $ruc, $addrs, $id_pais, $id_prov, $email, $id_ctrycodefijo, $tel, $enabled)
{
    $SQLStrQuery = "CALL sp_p_set_usrcomp_Create($rs, $ruc, $addrs, $id_pais, $id_prov, $email, $id_ctrycodefijo, $tel, $enabled)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function comp_updateRecord($fields, $id_company)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            $SQLStrQuery = "CALL sp_p_set_usrcomp_Update($key, $value, $id_company)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function comp_recoveryAllList(&$nDocs, &$Docs, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_usrcomp_all($enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function comp_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_usrcomp_byAnyField($field, $value, $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function comp_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_usrcomp_byAnyField($field, $value, $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

<?php
/*	
 tbl_cagenclients
	id_client
    rs
    ruc
    addrs
    id_pais
    id_prov
    email
    id_ctrycodefijo
    tel
    ext
    id_ctrycodecel
    cel
    website
    id_tipo
    id_clasific
    id_calif
    descrip
    enabled
*/

// Crea una nueva ubicación
function clients_createRecord($rs, $ruc, $addrs, $id_pais, $id_prov, $email, $id_ctrycodefijo, $tel, $ext, $id_ctrycodecel, $cel, $website, $id_tipo, $id_clasific, $id_calif, $descrip, $enabled)
{
    $SQLStrQuery = "CALL sp_p_set_cagencli_Create($rs, $ruc, $addrs, $id_pais, $id_prov, $email, $id_ctrycodefijo, $tel, $ext, $id_ctrycodecel, $cel, $website, $id_tipo, $id_clasific, $id_calif, $descrip, $enabled)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function clients_updateRecord($fields, $id_client)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            $SQLStrQuery = "CALL sp_p_set_cagencli_Update($key, $value, $id_client)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function clients_recoveryAllList(&$nDocs, &$Docs, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_cagencli_all($enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function clients_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_cagencli_byAnyField($field, $value, $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function clients_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_cagencli_byAnyField($field, $value, $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

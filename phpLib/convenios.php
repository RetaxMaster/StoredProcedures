<?php
/*	
 tbl_cacttoadndas
    id_cttoadnda
    id_ctto
    codctto
    id_pais
    id_prov
    id_client
    id_tipo
    fini
    ffin
    ciclopub
    ciclomsgvalor
    cantcur
    descrip
    enabled
*/

// Crea una nueva ubicación
function cvns_createRecord($id_ctto, $codctto, $id_pais, $id_prov, $id_client, $id_tipo, $fini, $ffin, $ciclopub, $ciclomsgvalor, $cantcur, $descrip, $enabled)
{
    $SQLStrQuery = "CALL sp_p_set_cacvns_Create($id_ctto, $codctto, $id_pais, $id_prov, $id_client, $id_tipo, $fini, $ffin, $ciclopub, $ciclomsgvalor, $cantcur, $descrip, $enabled)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function cvns_updateRecord($fields, $id_cttoadnda)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            if ($value !== "") {
            $SQLStrQuery = "CALL sp_p_set_cacvns_Update('$key', '$value', $id_cttoadnda)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function cvns_recoveryAllList(&$nDocs, &$Docs, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_cacvns_all($enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function cvns_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_cacvns_byAnyField('$field', '$value', $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function cvns_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_cacvns_byAnyField('$field', '$value', $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

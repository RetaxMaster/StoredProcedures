<?php
/*	
 tbl_cacttos
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
function ctrts_createRecord($codctto, $id_pais, $id_prov, $id_client, $id_tipo, $fini, $ffin, $ciclopub, $ciclomsgvalor, $cantcur, $descrip, $enabled)
{
    $SQLStrQuery = "CALL sp_p_set_cactrts_Create($codctto, $id_pais, $id_prov, $id_client, $id_tipo, $fini, $ffin, $ciclopub, $ciclomsgvalor, $cantcur, $descrip, $enabled)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function ctrts_updateRecord($fields, $id_ctto)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            $SQLStrQuery = "CALL sp_p_set_cactrts_Update($key, $value, $id_ctto)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function ctrts_recoveryAllList(&$nDocs, &$Docs, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_cactrts_all($enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function ctrts_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_cactrts_byAnyField($field, $value, $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function ctrts_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_cactrts_byAnyField($field, $value, $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

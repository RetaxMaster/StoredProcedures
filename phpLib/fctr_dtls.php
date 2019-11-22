<?php
/*	
 tbl_cafactdetails
	id_factdetail
    id_fact
    id_prod
    cod
    descrip
    cant
    tiposp
    puvp
    id_imp
    valorPorc
    totaldlinea
*/

// Crea una nueva ubicación
function fctrdtls_createRecord($id_fact, $id_prod, $cod, $descrip, $cant, $tiposp, $puvp, $id_imp, $valorPorc, $totaldlinea)
{
    $SQLStrQuery = "CALL sp_p_set_cafctrdtls_Create($id_fact, $id_prod, $cod, $descrip, $cant, $tiposp, $puvp, $id_imp, $valorPorc, $totaldlinea)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function fctrdtls_updateRecord($fields, $id_factdetail)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            $SQLStrQuery = "CALL sp_p_set_cafctrdtls_Update($key, $value, $id_factdetail)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function fctrdtls_recoveryAllList(&$nDocs, &$Docs, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_cafctrdtls_all($tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function fctrdtls_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_cafctrdtls_byAnyField($field, $value, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function fctrdtls_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_cafctrdtls_byAnyField($field, $value, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

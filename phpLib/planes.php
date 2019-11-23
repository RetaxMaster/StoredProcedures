<?php
/*	
 tbl_acadplans
	id_plan
    tiempodura
    id_modalidad
    temario
    prerrequisitos
    perfil
    objetivos
    título
    fcreac
    lstenabled
*/

// Crea una nueva ubicación
function plans_createRecord($tiempodura, $id_modalidad, $temario, $prerrequisitos, $perfil, $objetivos, $título, $fcreac, $lstenabled)
{
    $SQLStrQuery = "CALL sp_p_set_acadplans_Create($tiempodura, $id_modalidad, $temario, $prerrequisitos, $perfil, $objetivos, $título, $fcreac, $lstenabled)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function plans_updateRecord($fields, $id_locat)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            $SQLStrQuery = "CALL sp_p_set_acadplans_Update($key, $value, $id_locat)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function plans_recoveryAllList(&$nDocs, &$Docs, $enabled)
{ // true or false
    $SQLStrQuery = "CALL sp_p_lst_acadplans_all($enabled)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function plans_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $enabled)
{ // true or false
    $SQLStrQuery = "CALL sp_p_lst_acadplans_byAnyField($field, $value, $enabled)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function plans_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $enabled)
{ // true or false
    $SQLStrQuery = "CALL sp_p_get_acadplans_byAnyField($field, $value, $enabled)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

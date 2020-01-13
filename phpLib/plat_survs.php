<?php
/*	
 tbl_tmplatsurvs
	id_tmplatsurvs
    titletemplat
    bdytemplat
    tipotemplat
*/

// Crea una nueva ubicación
function platsurvs_createRecord($titletemplat, $bdytemplat, $tipotemplat)
{
    $SQLStrQuery = "CALL sp_p_set_usrplatsurvs_Create($titletemplat, $bdytemplat, $tipotemplat)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function platsurvs_updateRecord($fields, $id_tmplatsurvs)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            if ($value !== "") {
            $SQLStrQuery = "CALL sp_p_set_usrplatsurvs_Update('$key', '$value', $id_tmplatsurvs)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function platsurvs_recoveryAllList(&$nDocs, &$Docs)
{ // true or false
    $SQLStrQuery = "CALL sp_p_lst_usrplatsurvs_all()";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function platsurvs_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value)
{ // true or false
    $SQLStrQuery = "CALL sp_p_lst_usrplatsurvs_byAnyField('$field', '$value')";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function platsurvs_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value)
{ // true or false
    $SQLStrQuery = "CALL sp_p_get_usrplatsurvs_byAnyField('$field', '$value')";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

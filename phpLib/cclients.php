<?php
/*	
 tbl_cacclients
	id_cclient
    id_pais
    id_prov
    id_client
    id_tpub
    nom
    ape
    email
    id_ctrycodefijo
    tel
    ext
    id_ctrycodecel
    cel
    id_cargo
    id_dptoemp
    principal
    descrip
    enabled
*/

// Crea una nueva ubicación
function cclients_createRecord($id_pais, $id_prov, $id_client, $id_tpub, $nom, $ape, $email, $id_ctrycodefijo, $tel, $ext, $id_ctrycodecel, $cel, $id_cargo, $id_dptoemp, $principal, $descrip, $enabled)
{
    $SQLStrQuery = "CALL sp_p_set_cagenccli_Create($id_pais, $id_prov, $id_client, $id_tpub, $nom, $ape, $email, $id_ctrycodefijo, $tel, $ext, $id_ctrycodecel, $cel, $id_cargo, $id_dptoemp, $principal, $descrip, $enabled)";
    SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
}

// Actualiza algún campo de la tabla según su id, recibe un arreglo asociativo con los campos a actualizar y también recibe el id de la fila que se va a actualizar
function cclients_updateRecord($fields, $id_cclient)
{
    if (!empty($fields)) {
        foreach ($fields as $key => $value) {
            $SQLStrQuery = "CALL sp_p_set_cagenccli_Update($key, $value, $id_cclient)";
            SQLQuery($ResponsePointer, $n, $SQLStrQuery, false); // Realiza la consulta
        }
    } else {
        throw new Exception("Debes enviar al menos un campo");
    }
}

//Recupera todos los registros, opcionalmente puedes especificar si deseas hacer un join para traer los datos crudos o reemplazados
function cclients_recoveryAllList(&$nDocs, &$Docs, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_cagenccli_all($enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera todos los registros filtrados por algún campo
function cclients_recoveryAllByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_lst_cagenccli_byAnyField($field, $value, $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

//Recupera un registro filtrados por algún campo
function cclients_recoveryOneByAnyField(&$nDocs, &$Docs, $field, $value, $enabled, $join = false)
{ // true or false
    $tinyint = (int) $join;
    $SQLStrQuery = "CALL sp_p_get_cagenccli_byAnyField($field, $value, $enabled, $tinyint)";
    SQLQuery($ResponsePointer, $nDocs, $SQLStrQuery, true); // Realiza la consulta
    ConvertPointerToArray($ResponsePointer, $Docs, $nDocs, 2); // Pertenece a dbmngmtAdmin.php
}

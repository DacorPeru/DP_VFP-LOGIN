*-- Aseg�rate de que la tabla est� abierta
lcTablePath = gcConfigDBPath + "GenParams.DBF"
IF !USED("GenParams")
    USE (lcTablePath) IN 0 ALIAS GenParams EXCLUSIVE
ENDIF

*-- Insertar un nuevo registro sin especificar el id_param si es autoincremental
INSERT INTO GenParams (clave, valor, desc) ;
    VALUES ("Nombre_App", "SIAR - 2024", "Descripci�n del nuevo par�metro")

*-- Cerrar la tabla despu�s de usarla
USE IN SELECT("GenParams")

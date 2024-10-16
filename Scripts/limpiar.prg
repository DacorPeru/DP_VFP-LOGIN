*-- Asegúrate de que la tabla esté abierta
lcTablePath = gcConfigDBPath + "GenParams.DBF"
IF !USED("GenParams")
    USE (lcTablePath) IN 0 ALIAS GenParams EXCLUSIVE
ENDIF

*-- Insertar un nuevo registro sin especificar el id_param si es autoincremental
INSERT INTO GenParams (clave, valor, desc) ;
    VALUES ("Nombre_App", "SIAR - 2024", "Descripción del nuevo parámetro")

*-- Cerrar la tabla después de usarla
USE IN SELECT("GenParams")

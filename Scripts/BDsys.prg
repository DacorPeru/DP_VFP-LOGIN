*============================================*
* BDsys.prg
* Este script crea la base de datos de configuración del sistema (SysCfgDB) y sus tablas en la ruta definida por gcConfigDBPath.
*============================================*

* Verificar si la variable gcConfigDBPath está definida
IF TYPE("gcConfigDBPath") <> "C" OR EMPTY(gcConfigDBPath)
    MESSAGEBOX("La variable de ruta gcConfigDBPath no está definida o está vacía.", 16, "Error")
    RETURN
ENDIF

* Verificar si la carpeta ConfigDB existe, si no, crearla
IF !DIRECTORY(gcConfigDBPath)
    IF !MDIRECTORY(gcConfigDBPath)
        MESSAGEBOX("Error al crear la carpeta ConfigDB en la ruta especificada: " + gcConfigDBPath, 16, "Error")
        RETURN
    ENDIF
ENDIF

* Cambiar la ruta de trabajo a ConfigDB
SET DEFAULT TO (gcConfigDBPath)

* Verificar si la base de datos ya existe
IF FILE("SysCfgDB.DBC")
    MESSAGEBOX("LA BASE DE DATOS YA SE HA GENERADO. No es posible volver a crearla.", 48, "Información")
    RETURN
ENDIF

* Crear la base de datos SysCfgDB
CREATE DATABASE SysCfgDB

* Inicializar el array de tablas
DIMENSION laTablas(1)
laTablas(1) = ""

* Crear las tablas en la base de datos SysCfgDB
CREATE TABLE InfoEmpresa (;
    id_Empresa INT AUTOINC PRIMARY KEY, ;
    ruc CHAR(11) DEFAULT "20610187863", ;
    nombre CHAR(50) DEFAULT "Data Consulting Reyes Peru E.I.R.L", ;
    abreviado CHAR(20) DEFAULT "Dacor Peru", ;
    dir CHAR(100) DEFAULT "Laredo - Trujillo", ;
    cel CHAR(9) DEFAULT "915900473", ;
    tel CHAR(20) DEFAULT "000-000-000", ;
    email CHAR(50) DEFAULT "software@dacorperu.com", ;
    web CHAR(100) DEFAULT "https://www.dacorperu.com", ;
    rep CHAR(50) DEFAULT "Gesmer" ;
)
* Añadir tabla al array
DIMENSION laTablas(ALEN(laTablas, 1) + 1)
laTablas(ALEN(laTablas, 1)) = "InfoEmpresa"

CREATE TABLE AutorInfo (;
    id_autor INT AUTOINC PRIMARY KEY, ;
    dni CHAR(8) DEFAULT "72653950", ;
    nombre CHAR(50) DEFAULT "Gesmer", ;
    apellpat CHAR(50) DEFAULT "Reyes", ;
    apellmat CHAR(50) DEFAULT "Eustaquio", ;
    email CHAR(50) DEFAULT "gesmerbre12@gmail.com", ;
    cel CHAR(9) DEFAULT "915900473", ;
    tel CHAR(20) DEFAULT "000-000-000", ;
    dir CHAR(100) DEFAULT "Laredo - Trujillo", ;
    copy MEMO DEFAULT "Derechos Reservados", ;
    anio CHAR(4) DEFAULT "2024" ;
)
* Añadir tabla al array
DIMENSION laTablas(ALEN(laTablas, 1) + 1)
laTablas(ALEN(laTablas, 1)) = "AutorInfo"

CREATE TABLE GenParams (;
    id_param INT AUTOINC PRIMARY KEY, ;
    clave CHAR(20), ;
    valor CHAR(100), ;
    desc CHAR(50) ;
)
* Añadir tabla al array
DIMENSION laTablas(ALEN(laTablas, 1) + 1)
laTablas(ALEN(laTablas, 1)) = "GenParams"

* Insertar parámetros esenciales
INSERT INTO GenParams (clave, valor, desc) VALUES ("modo_desarrollo", "True", "Indica si el sistema está en modo desarrollo")
INSERT INTO GenParams (clave, valor, desc) VALUES ("email_soporte", "soporte@miempresa.com", "Correo de soporte técnico")
INSERT INTO GenParams (clave, valor, desc) VALUES ("tiempo_sesion", "30", "Tiempo de sesión en minutos")
INSERT INTO GenParams (clave, valor, desc) VALUES ("logo_principal", "LogoDP.png", "Nombre del archivo de logo principal")
INSERT INTO GenParams (clave, valor, desc) VALUES ("fondo_principal", "FondoPrincipal.jpg", "Nombre del archivo de fondo principal")

CREATE TABLE SysUsers (;
    id_user INT AUTOINC PRIMARY KEY, ;
    nombre CHAR(11), ;
    pwd CHAR(50), ;
    rol CHAR(10) DEFAULT "User", ;
    prefs MEMO DEFAULT "tema=default;idioma=es" ;
)
* Añadir tabla al array
DIMENSION laTablas(ALEN(laTablas, 1) + 1)
laTablas(ALEN(laTablas, 1)) = "SysUsers"

* Insertar usuario admin por defecto
INSERT INTO SysUsers (nombre, pwd, rol) VALUES ("Gesmer", "developer", "Admin")

CREATE TABLE SysNotif (;
    id_notif INT AUTOINC PRIMARY KEY, ;
    tipo CHAR(10), ;
    msg MEMO, ;
    activo LOGICAL DEFAULT .T. ;
)
* Añadir tabla al array
DIMENSION laTablas(ALEN(laTablas, 1) + 1)
laTablas(ALEN(laTablas, 1)) = "SysNotif"

* Insertar notificaciones de ejemplo
INSERT INTO SysNotif (tipo, msg, activo) VALUES ("Alerta", "Actualización pendiente", .T.)

* Generar el mensaje de confirmación
lcMensaje = "La base de datos SysCfgDB se ha generado exitosamente." + CHR(13) + CHR(13) +;
    "Detalles de las tablas creadas:" + CHR(13) + ;
    "---------------------------------" + CHR(13)

FOR i = 2 TO ALEN(laTablas, 1)
    lcMensaje = lcMensaje + "   - " + laTablas(i) + CHR(13)
ENDFOR

lcMensaje = lcMensaje + "---------------------------------" + CHR(13) + ;
    "Estado: Operación completada sin errores." + CHR(13) + ;
    "Fecha y hora: " + DTOC(DATE()) + " " + TIME()

* Mostrar el mensaje de confirmación
MESSAGEBOX(lcMensaje, 64, "Creación Exitosa")

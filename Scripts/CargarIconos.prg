*============================================*
* Nombre del Archivo: CargarIconos.prg
* Ubicaci�n: ProjectRoot\Scripts\CargarIconos.prg
* Descripci�n: Programa para cargar iconos en los men�s del formulario principal.
*============================================*

* Verificar que la carpeta "icons" est� en el PATH
IF "icons" $ SET("PATH")
    * Definir las variables para las rutas de los iconos
    LOCAL lcIconAcerca, lcIconSalir

    lcIconAcerca = "icons\info.ico"
    lcIconSalir = "icons\cerrar.ico"

    * Verificar si los archivos de icono existen
    IF FILE(lcIconAcerca) AND FILE(lcIconSalir)
        * Asignar los iconos a los elementos del men�
        DEFINE POPUP mnuSistema MARGIN RELATIVE SHADOW COLOR SCHEME 4
        DEFINE BAR 1 OF mnuSistema PROMPT "Acerca de..." PICTURE lcIconAcerca
        DEFINE BAR 2 OF mnuSistema PROMPT "Salir" PICTURE lcIconSalir

        * A�adir otros men�s y elementos seg�n sea necesario
        * ...

    ELSE
        * Mensaje de error si los iconos no se encuentran
        MESSAGEBOX("No se encontraron los iconos requeridos en la carpeta 'icons'.", 16, "Error de Iconos")
    ENDIF
ELSE
    * Mensaje de error si la carpeta "icons" no est� en el PATH
    MESSAGEBOX("La carpeta 'icons' no est� en el PATH. Verifique su configuraci�n.", 16, "Error de PATH")
ENDIF

*============================================*
* Nombre del Archivo: ConfigurarIconos.prg
* Ubicaci�n: ProjectRoot\Scripts\ConfigurarIconos.prg
* Descripci�n: Configura los iconos del men� principal.
*============================================*

* Verifica que las rutas est�n definidas
IF TYPE("gcIconsPath") = "C"
    * Configurar iconos en el men� principal
    DEFINE PAD _mInicio OF _MSYSMENU PROMPT "Inicio" COLOR SCHEME 3 PICTURE (gcIconsPath + "inicio.ico")
    DEFINE PAD _mSalir OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 PICTURE (gcIconsPath + "cerrar.ico")

    DEFINE POPUP inicio MARGIN RELATIVE SHADOW COLOR SCHEME 4
    DEFINE BAR 1 OF inicio PROMPT "Acerca de..." PICTURE (gcIconsPath + "info.ico")
    DEFINE BAR 2 OF inicio PROMPT "Salir" PICTURE (gcIconsPath + "cerrar.ico")

    * Aqu� defines qu� sucede cuando se selecciona "Inicio"
    ON PAD _mInicio OF _MSYSMENU ACTIVATE POPUP inicio

    * Aqu� defines la acci�n para "Salir"
    ON BAR 2 OF inicio DO SalirDelFormulario

    * Opci�n de men� "Salir" en el men� principal para salir de la aplicaci�n
    ON PAD _mSalir OF _MSYSMENU QUIT
ELSE
    MESSAGEBOX("La ruta de los iconos no est� definida o no est� en el PATH.", 16, "Error")
ENDIF

*============================================*
* Procedimiento para cerrar el formulario
*============================================*
PROCEDURE SalirDelFormulario
    IF TYPE("THISFORM") = "O"
        THISFORM.Release()
    ELSE
        MESSAGEBOX("No se puede cerrar el formulario porque no est� abierto.", 16, "Error")
    ENDIF
ENDPROC

*============================================*
* Nombre del Archivo: ConfigurarIconos.prg
* Ubicación: ProjectRoot\Scripts\ConfigurarIconos.prg
* Descripción: Configura los iconos del menú principal.
*============================================*

* Verifica que las rutas estén definidas
IF TYPE("gcIconsPath") = "C"
    * Configurar iconos en el menú principal
    DEFINE PAD _mInicio OF _MSYSMENU PROMPT "Inicio" COLOR SCHEME 3 PICTURE (gcIconsPath + "inicio.ico")
    DEFINE PAD _mSalir OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 PICTURE (gcIconsPath + "cerrar.ico")

    DEFINE POPUP inicio MARGIN RELATIVE SHADOW COLOR SCHEME 4
    DEFINE BAR 1 OF inicio PROMPT "Acerca de..." PICTURE (gcIconsPath + "info.ico")
    DEFINE BAR 2 OF inicio PROMPT "Salir" PICTURE (gcIconsPath + "cerrar.ico")

    * Aquí defines qué sucede cuando se selecciona "Inicio"
    ON PAD _mInicio OF _MSYSMENU ACTIVATE POPUP inicio

    * Aquí defines la acción para "Salir"
    ON BAR 2 OF inicio DO SalirDelFormulario

    * Opción de menú "Salir" en el menú principal para salir de la aplicación
    ON PAD _mSalir OF _MSYSMENU QUIT
ELSE
    MESSAGEBOX("La ruta de los iconos no está definida o no está en el PATH.", 16, "Error")
ENDIF

*============================================*
* Procedimiento para cerrar el formulario
*============================================*
PROCEDURE SalirDelFormulario
    IF TYPE("THISFORM") = "O"
        THISFORM.Release()
    ELSE
        MESSAGEBOX("No se puede cerrar el formulario porque no está abierto.", 16, "Error")
    ENDIF
ENDPROC

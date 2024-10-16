*============================================*
* Nombre del Archivo: Iniciar.prg
* Ubicación: ProjectRoot\Scripts\Iniciar.prg
* Descripción: Archivo de inicialización para las rutas.
*============================================*

* Definir las rutas globales
PUBLIC gcBasePath, gcConfigPath, gcDataPath, gcFormsPath, gcClassesPath, gcImagesPath
PUBLIC gcReportsPath, gcLibsPath, gcMenusPath, gcScriptsPath, gcBackupsPath
PUBLIC gcConfigDBPath, gcCompaniesPath, gcInterfacesPath, gcIconsPath

* Obtener la ruta base de forma dinámica
gcBasePath = JUSTPATH(SYS(16, 1)) + "\"

* Definir rutas relativas basadas en la ruta base
gcConfigPath     = gcBasePath + "Config\"
gcConfigDBPath   = gcBasePath + "Config\ConfigDB\"
gcDataPath       = gcBasePath + "Data\"
gcFormsPath      = gcBasePath + "Forms\"
gcClassesPath    = gcBasePath + "Classes\"
gcImagesPath     = gcBasePath + "Images\"
gcReportsPath    = gcBasePath + "Reports\"
gcLibsPath       = gcBasePath + "Libs\"
gcMenusPath      = gcBasePath + "Menus\"
gcScriptsPath    = gcBasePath + "Scripts\"
gcBackupsPath    = gcBasePath + "Backups\"
gcCompaniesPath  = gcBasePath + "Companies\"
gcInterfacesPath = gcBasePath + "Interfaces\"
gcIconsPath      = gcBasePath + "Icons\"  && Nueva ruta para los íconos

* Lista de rutas a validar
LOCAL aRutas[14]
aRutas[1] = "Config"
aRutas[2] = "Config\ConfigDB"
aRutas[3] = "Data"
aRutas[4] = "Forms"
aRutas[5] = "Classes"
aRutas[6] = "Images"
aRutas[7] = "Reports"
aRutas[8] = "Libs"
aRutas[9] = "Menus"
aRutas[10] = "Scripts"
aRutas[11] = "Backups"
aRutas[12] = "Companies"
aRutas[13] = "Interfaces"
aRutas[14] = "Icons"  && Añadido al listado de rutas a validar

LOCAL lcRutaCompleta, lcMensajeFinal, lnExiste

lcMensajeFinal = "Validación de rutas:" + CHR(13) + CHR(13)

* Validar cada ruta y agregar al mensaje final
FOR lnI = 1 TO ALEN(aRutas, 1)
    lcRutaCompleta = gcBasePath + aRutas[lnI] + "\"
    lnExiste = DIRECTORY(lcRutaCompleta)
    IF lnExiste
        lcMensajeFinal = lcMensajeFinal + "Ruta '" + lcRutaCompleta + "' existe." + CHR(13)
    ELSE
        lcMensajeFinal = lcMensajeFinal + "Ruta '" + lcRutaCompleta + "' NO existe." + CHR(13)
    ENDIF
NEXT

* Establecer rutas en el SET PATH de VFP si todas existen
IF lnExiste
    SET PATH TO ;
        gcConfigPath, ;
        gcConfigDBPath, ;
        gcDataPath, ;
        gcFormsPath, ;
        gcClassesPath, ;
        gcImagesPath, ;
        gcReportsPath, ;
        gcLibsPath, ;
        gcMenusPath, ;
        gcScriptsPath, ;
        gcBackupsPath, ;
        gcCompaniesPath, ;
        gcInterfacesPath, ;
        gcIconsPath ADDITIVE && Añadir la nueva ruta al PATH
    lcMensajeFinal = lcMensajeFinal + CHR(13) + "Todas las rutas han sido añadidas al PATH."
ELSE
    lcMensajeFinal = lcMensajeFinal + CHR(13) + "No todas las rutas existen. Verifique y cree las rutas faltantes."
ENDIF

* Mostrar el mensaje final
MESSAGEBOX(lcMensajeFinal, 64, "Resultado de Validación de Rutas")

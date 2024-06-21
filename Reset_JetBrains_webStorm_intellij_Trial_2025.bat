@echo off

REM Eliminar carpetas de configuración de WebStorm
for %%I in ("WebStorm", "IntelliJ", "CLion", "Rider", "GoLand", "PhpStorm", "Resharper", "PyCharm") do (
    for /d %%a in ("%USERPROFILE%\.%%I*") do (
        rd /s /q "%%a/config/eval"
        del /q "%%a\config\options\other.xml"
    )
)

REM Eliminar clave de registro y carpeta de JetBrains (opcional)
rmdir /s /q "%APPDATA%\JetBrains"
reg delete "HKEY_CURRENT_USER\Software\JavaSoft" /f

echo Proceso completado. Reinicia WebStorm para ver si el periodo de prueba se ha restablecido.
pause

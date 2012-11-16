@ECHO OFF
echo **********************************************************
echo Ghostscript is creating %1   (please be patient...)
echo **********************************************************
copy %1 %1.bak
set GS_DIR="c:\program files\gs\gs9.02"
set PATH=%PATH%;%GS_DIR%\bin;%GS_DIR%\lib
gswin64c -dBATCH -dNOPAUSE -sDEVICE=epswrite -sOutputFile=%1 -r9600 -c save pop -f %1.bak
if errorlevel 1 goto err
echo **********************************************************
echo %1 has been successfully destilled
echo **********************************************************
goto end
:err
echo Some errors have occurred while destilling %1
echo **********************************************************
pause
:end
:: Чистка EPS.
:: Хирости: 
:: 1) Прежде чем чистить файл, из-под Иллюстратора (сохр как AI 7.0), 
::    надо исправить начало файла, удалив все до  %!PS-Adobe-3.0 EPSF-3.0 
::    и конец, удалив все после  %%EOF
:: 2) Херится левый нижний угол bbox (обнуляется) --- брать из исходного файла
:: 3) Разрешение 9600 нужно, чтобы гад не растрировал шрифты
::
:: следующие строки оказались ненужными
::
::set GS_LIB=%GS_DIR%;%GS_DIR%\fonts;%GS_DIR%\lib
::set GS_FONTPATH=C:\DD\psfonts\tex;C:\DD\psfonts\vmufonts
::set GS_DLL=%GS_DIR%\bin\gsdll32.dll


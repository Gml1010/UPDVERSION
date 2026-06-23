@echo off
TITLE Limpeza e Otimizacao do Sistema
color 0B
mode con lines=35 cols=110

:: Verifica se o script esta rodando como Administrador
echo ===============================================================================
echo                                 VERIFICANDO PRIVILEGIOS DE ADMINISTRADOR...
echo ===============================================================================
fsutil dirty query %systemdrive% >nul
if %errorLevel% EQU 0 goto is_admin

color 0C
echo.
echo [ERRO] Voce precisa executar este script como Administrador
echo Clique com o botao direito no arquivo e selecione "Executar como administrador".
echo.
pause
exit /b

:is_admin

:menu
cls
color 0B
echo.
echo                                                 BEM VINDO A VERSAO 1.7
echo.
echo                          _____                _____                     _____
echo                         /\    \              /\    \                   /\    \
echo                        /::\____\            /::\    \                 /::\____\
echo                       /:::/    /            \:::\    \               /:::/    /
echo                      /:::/    /              \:::\    \             /:::/    /
echo                     /:::/    /                \:::\    \           /:::/    /
echo                    /:::/    /                  \:::\    \         /:::/    /
echo                   /:::/    /                   /::::\    \       /:::/    /
echo                  /:::/    /      _____        /::::::\    \     /:::/    /
echo                 /:::/____/      /\    \      /:::/\:::\    \   /:::/    /
echo                ^|:::^|    /      /::\____\    /:::/  \:::\____\ /:::/____/
echo                ^|:::^|____\     /:::/    /   /:::/    \::/    / \:::\    \
echo                 \:::\    \   /:::/    /   /:::/    / \/____/   \:::\    \
echo                  \:::\    \ /:::/    /   /:::/    /             \:::\    \
echo                   \:::\    /:::/    /   /:::/    /               \:::\    \
echo                    \:::\__/:::/    /    \::/    /                 \:::\    \
echo                     \::::::::/    /      \/____/                   \:::\    \
echo                      \::::::/    /                                  \:::\    \
echo                       \::::/    /                                    \:::\____\
echo                        \::/____/                                      \::/    /
echo                                                                        \/____/
echo.
echo                [ 1 ] Limpezas e Otimizacoes               [ 2 ] Otimizar Windows
echo.
echo                [ 3 ] Ferramentas de Macro                 [ 4 ] Modificacoes do Roblox
echo.
echo                [ 5 ] Creditos                             [ X ] Sair
echo.
set /p opcao="Digite a opcao desejada: "

if "%opcao%"=="1" goto menu_limpeza
if "%opcao%"=="2" goto menu_otimizar_win
if "%opcao%"=="3" goto menu_macro
if "%opcao%"=="4" goto menu_roblox
if "%opcao%"=="5" goto creditos
if /i "%opcao%"=="x" goto sairdoprograma

goto menu

:: ===============================================================================
:: SUB-MENUS
:: ===============================================================================

:menu_limpeza
cls
color 0B
echo ==============================================================================================================
echo                                                 LIMPEZAS E OTIMIZACOES
echo ==============================================================================================================
echo.
echo [1] - Limpar Arquivos Temporarios
echo [2] - Limpar Cache de DNS
echo [3] - Limpar Cache do Windows Update
echo [4] - Limpar Logs de Eventos do Windows
echo [5] - Otimizar Resposta de Perifericos e Menus
echo [6] - Ativar Plano de Energia (Melhor Desempenho)
echo [7] - Executar TODAS as Limpezas e Otimizacoes (1 a 5)
echo [8] - Voltar ao Menu Principal
echo.
set /p opcao="Digite o numero da opcao: "

if "%opcao%"=="1" goto temp
if "%opcao%"=="2" goto dns
if "%opcao%"=="3" goto update
if "%opcao%"=="4" goto logs
if "%opcao%"=="5" goto perifericos
if "%opcao%"=="6" goto energia
if "%opcao%"=="7" goto all
if "%opcao%"=="8" goto menu
goto menu_limpeza


:menu_otimizar_win
cls
color 0B
echo ==============================================================================================================
echo                                  FERRAMENTA DE OTIMIZACAO E DEBLOAT
echo ==============================================================================================================
echo.
echo Escolha uma opcao:
echo.
echo [1] - APLICAR Otimizacoes (Desativar Telemetria, Lixo, Copilot, Widgets)
echo [2] - DESFAZER Alteracoes (Restaurar padroes de fabrica do Registro e Servicos)
echo [3] - Voltar ao Menu Principal
echo.
set /p opcao="Digite o numero da opcao: "

if "%opcao%"=="1" goto otimizar_win_aplicar
if "%opcao%"=="2" goto otimizar_win_reverter
if "%opcao%"=="3" goto menu
goto menu_otimizar_win


:menu_macro
cls
color 0E
echo ==============================================================================================================
echo                                                 FERRAMENTAS DE MACRO
echo ==============================================================================================================
echo.
echo [1] - Ativar Macro (Execucao Portatil)
echo [2] - Remover/Desinstalar Macro Portatil
echo [3] - Voltar ao Menu Principal
echo.
set /p opcao="Digite o numero da opcao: "

if "%opcao%"=="1" goto macro
if "%opcao%"=="2" goto uninstall_macro
if "%opcao%"=="3" goto menu
goto menu_macro

:menu_roblox
cls
color 0A
echo ==============================================================================================================
echo                                                 MODIFICACOES DO ROBLOX
echo ==============================================================================================================
echo.
echo [1] - Adicionar Flags da WhiteList
echo [2] - Remover Flags da WhiteList
echo [3] - Apagar Texturas do Roblox (Aumentar FPS)
echo [4] - Escolher e Trocar Fontes do Roblox
echo [5] - Remover Limitador de FPS (Ilimitado / 9999)
echo [6] - Restaurar Limitador de FPS para Padrao (240 FPS)
echo [7] - Voltar ao Menu Principal
echo.
set /p opcao="Digite o numero da opcao: "

if "%opcao%"=="1" goto whitelist
if "%opcao%"=="2" goto remove_whitelist
if "%opcao%"=="3" goto remove_textures
if "%opcao%"=="4" goto custom_fonts
if "%opcao%"=="5" goto fps_unlock
if "%opcao%"=="6" goto fps_restore
if "%opcao%"=="7" goto menu
goto menu_roblox


:: ===============================================================================
:: FUNCOES DO SISTEMA: LIMPEZA E OTIMIZACAO
:: ===============================================================================

:temp
cls
color 0A
echo ===============================================================================
echo [1] Limpando Arquivos Temporarios...
call :clean_temp_loop
echo.
echo OK! Concluido.
echo ===============================================================================
pause
goto menu_limpeza

:dns
cls
color 0A
echo ===============================================================================
echo [2] Limpando Cache de DNS...
ipconfig /flushdns >nul 2>&1
echo.
echo OK! Concluido.
echo ===============================================================================
pause
goto menu_limpeza

:update
cls
color 0A
echo ===============================================================================
echo [3] Limpando Cache do Windows Update (SoftwareDistribution)...
net stop wuauserv >nul 2>&1
net stop UsoSvc >nul 2>&1
rd /s /q "C:\Windows\SoftwareDistribution" >nul 2>&1
md "C:\Windows\SoftwareDistribution" >nul 2>&1
net start wuauserv >nul 2>&1
net start UsoSvc >nul 2>&1
echo.
echo OK! Concluido.
echo ===============================================================================
pause
goto menu_limpeza

:logs
cls
color 0A
echo ===============================================================================
echo [4] Limpando Logs de Eventos do Windows...
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (wevtutil.exe cl "%%G" >nul 2>&1)
echo.
echo OK! Concluido.
echo ===============================================================================
pause
goto menu_limpeza

:perifericos
cls
color 0A
echo ===============================================================================
echo [5] Otimizando Resposta de Perifericos e Menus...
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "10" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "10" /f >nul 2>&1
echo.
echo OK! Concluido. (Pode ser necessario reiniciar o PC para aplicar)
echo ===============================================================================
pause
goto menu_limpeza

:energia
cls
color 0A
echo ===============================================================================
echo [6] Ativando Plano de Energia (Melhor Desempenho)...
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo.
echo OK! Concluido. O sistema agora focara em maximo desempenho.
echo ===============================================================================
pause
goto menu_limpeza

:all
cls
color 0A
echo ===============================================================================
echo                                 INICIANDO OTIMIZACAO TOTAL DO SISTEMA
echo ===============================================================================
echo.
echo [1/5] Limpando Arquivos Temporarios...
call :clean_temp_loop
echo OK!
echo.

echo [2/5] Limpando Cache de DNS...
ipconfig /flushdns >nul 2>&1
echo OK!
echo.
echo [3/5] Limpando Cache do Windows Update (SoftwareDistribution)...
net stop wuauserv >nul 2>&1
net stop UsoSvc >nul 2>&1
rd /s /q "C:\Windows\SoftwareDistribution" >nul 2>&1
md "C:\Windows\SoftwareDistribution" >nul 2>&1
net start wuauserv >nul 2>&1
net start UsoSvc >nul 2>&1
echo OK!
echo.

echo [4/5] Limpando Logs de Eventos do Windows...
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (wevtutil.exe cl "%%G" >nul 2>&1)
echo OK!
echo.

echo [5/5] Otimizando Resposta de Perifericos e Menus...
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "10" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "10" /f >nul 2>&1
echo OK!
echo.

echo ===============================================================================
echo                              OTIMIZACAO TOTAL CONCLUIDA COM SUCESSO!
echo.
echo                          (Pode ser necessario reiniciar o PC para aplicar)
echo ===============================================================================
echo.
pause
goto menu_limpeza

:: ===============================================================================
:: FUNCOES DO SISTEMA: OTIMIZAR WINDOWS 11 (DEBLOAT E PRIVACIDADE)
:: ===============================================================================

:otimizar_win_aplicar
cls
color 0A
echo ===============================================================================
echo                      INICIANDO OTIMIZACAO E DEBLOAT DO WINDOWS 11
echo ===============================================================================
echo.

echo [1/6] Desativando Servicos de Telemetria e Terceiros Inuteis...
for %%s in (DiagTrack dmwappushservice diagnosticshub.standardcollector.service diagsvc WbioSrvc wisvc VSStandardCollectorService150 NvTelemetryContainer AdobeARMservice adobeupdateservice adobeflashplayerupdatesvc "Razer Game Scanner Service" LogiRegistryService dbupdate dbupdatem XblAuthManager XblGameSave XboxNetApiSvc WMPNetworkSvc PcaSvc MapsBroker RetailDemo PimIndexMaintenanceSvc) do (
    sc stop "%%s" >nul 2>&1
    sc config "%%s" start= disabled >nul 2>&1
)

echo [2/6] Desativando Tarefas Agendadas de Coleta de Dados...
for %%t in (
    "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
    "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
    "\Microsoft\Windows\Application Experience\AitAgent"
    "\Microsoft\Windows\Application Experience\StartupAppTask"
    "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
    "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
    "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
    "\Microsoft\Windows\Customer Experience Improvement Program\Uploader"
    "\Microsoft\Windows\Device Information\Device"
    "\Microsoft\Office\OfficeTelemetryAgentFallBack"
    "\Microsoft\Office\OfficeTelemetryAgentLogOn"
    "\Microsoft\Office\OfficeTelemetryAgentFallBack2016"
    "\Microsoft\Office\OfficeTelemetryAgentLogOn2016"
    "\Microsoft\Office\Office 15 Subscription Heartbeat"
    "\Microsoft\Office\Office 16 Subscription Heartbeat"
) do (
    schtasks /change /TN %%t /DISABLE >nul 2>&1
)

echo [3/6] Bloqueando Executaveis de Telemetria (IFEO Seguros)...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeviceCensus.exe" /v "Debugger" /t REG_SZ /d "%windir%\System32\taskkill.exe" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CompatTelRunner.exe" /v "Debugger" /t REG_SZ /d "%windir%\System32\taskkill.exe" /f >nul 2>&1

echo [4/6] Aplicando Ajustes de Registro (Privacidade, Menu Iniciar, Copilot e Widgets)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Piriform\CCleaner" /v "Monitoring" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f >nul 2>&1

echo [5/6] Removendo Aplicativos Nativos Inuteis (Pode levar alguns segundos)...
PowerShell -NoProfile -Command "$apps = '*3DBuilder*','*Getstarted*','*bing*','*MicrosoftOfficeHub*','*SkypeApp*','*solit*','*zune*','*Facebook*','*Twitter*','*Sway*','*CommsPhone*','*Microsoft.Messaging*','*Drawboard PDF*'; foreach ($app in $apps) { Get-AppxPackage $app | Remove-AppxPackage -ErrorAction SilentlyContinue }"

echo [6/6] Removendo o OneDrive...
start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL >nul 2>&1
rd C:\OneDriveTemp /Q /S >NUL 2>&1
rd "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1

echo.
echo ===============================================================================
echo                      OTIMIZACAO CONCLUIDA COM SUCESSO!
echo ===============================================================================
echo O Windows Explorer sera reiniciado para aplicar as alteracoes visuais.
pause
taskkill /F /IM explorer.exe >nul 2>&1
start explorer.exe
goto menu_otimizar_win

:otimizar_win_reverter
cls
color 0E
echo ===============================================================================
echo                      DESFAZENDO ALTERACOES (RESTAURANDO PADROES)
echo ===============================================================================
echo.

echo [1/4] Restaurando Servicos do Windows...
for %%s in (dmwappushservice diagnosticshub.standardcollector.service diagsvc WbioSrvc wisvc VSStandardCollectorService150 NvTelemetryContainer AdobeARMservice adobeupdateservice adobeflashplayerupdatesvc "Razer Game Scanner Service" LogiRegistryService dbupdate dbupdatem XblAuthManager XblGameSave XboxNetApiSvc WMPNetworkSvc PcaSvc MapsBroker RetailDemo PimIndexMaintenanceSvc) do (
    sc config "%%s" start= demand >nul 2>&1
)
sc config DiagTrack start= auto >nul 2>&1
sc start DiagTrack >nul 2>&1

echo [2/4] Restaurando Tarefas Agendadas...
for %%t in (
    "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
    "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
    "\Microsoft\Windows\Application Experience\AitAgent"
    "\Microsoft\Windows\Application Experience\StartupAppTask"
    "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
    "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
    "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
    "\Microsoft\Windows\Customer Experience Improvement Program\Uploader"
    "\Microsoft\Windows\Device Information\Device"
) do (
    schtasks /change /TN %%t /ENABLE >nul 2>&1
)

echo [3/4] Removendo Bloqueios de Executaveis (IFEO)...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeviceCensus.exe" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CompatTelRunner.exe" /f >nul 2>&1

echo [4/4] Restaurando Ajustes de Registro (Privacidade, Menu Iniciar, Copilot)...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 3 /f >nul 2>&1
reg delete "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /f >nul 2>&1
reg delete "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /f >nul 2>&1
reg delete "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 1 /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d 1 /f >nul 2>&1
reg delete "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /f >nul 2>&1

echo.
echo ===============================================================================
echo                      REVERSAO CONCLUIDA COM SUCESSO!
echo ===============================================================================
echo NOTA: Aplicativos nativos e OneDrive devem ser baixados na Microsoft Store.
echo O Windows Explorer sera reiniciado para aplicar as alteracoes visuais.
pause
taskkill /F /IM explorer.exe >nul 2>&1
start explorer.exe
goto menu_otimizar_win


:: ===============================================================================
:: FUNCOES DO SISTEMA: MACROS E ROBLOX
:: ===============================================================================

:macro
cls
color 0E
echo ===============================================================================
echo [1] Ativando Macro (Execucao Portatil)...
echo ===============================================================================
echo.

set "ahk_dir=%APPDATA%\UtilitariosMacro"
set "ahk_exe=%ahk_dir%\AutoHotkey64.exe"
set "ahk_file=%ahk_dir%\AdvancedMacro.ahk"
set "ahk_zip=%temp%\ahk_temp.zip"
set "ahk_folder=%temp%\ahk_extracted"

if not exist "%ahk_dir%" mkdir "%ahk_dir%"
if exist "%ahk_exe%" goto skip_download

echo O AutoHotkey portatil nao foi encontrado.
echo Baixando a versao mais recente (v2) do site oficial...
echo Aguarde... Isso pode demorar alguns segundos.
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://www.autohotkey.com/download/ahk-v2.zip' -OutFile '%ahk_zip%' -UseBasicParsing"

if not exist "%ahk_zip%" (
    color 0C
    echo.
    echo [ERRO] Falha ao baixar o AutoHotkey!
    echo Verifique sua conexao com a internet ou se o antivirus bloqueou o comando.
    echo.
    pause
    goto menu_macro
)

echo Extraindo arquivos...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -Path '%ahk_zip%' -DestinationPath '%ahk_folder%' -Force"

if not exist "%ahk_folder%\AutoHotkey64.exe" (
    color 0C
    echo.
    echo [ERRO] Falha ao extrair os arquivos do AutoHotkey.
    echo.
    pause
    goto menu_macro
)

copy /Y "%ahk_folder%\AutoHotkey64.exe" "%ahk_exe%" >nul
rd /s /q "%ahk_folder%" >nul 2>&1
del /f /q "%ahk_zip%" >nul 2>&1
echo Download e Extracao concluidos!
echo.

:skip_download
echo Gerando o arquivo de script do AutoHotkey...

echo #Requires AutoHotkey v2.0 > "%ahk_file%"
echo SendMode("Event") >> "%ahk_file%"
echo SetKeyDelay(-1, -1) >> "%ahk_file%"
echo SetWinDelay(-1) >> "%ahk_file%"
echo SetControlDelay(-1) >> "%ahk_file%"
echo. >> "%ahk_file%"
echo global MacroAtivado := false >> "%ahk_file%"
echo. >> "%ahk_file%"
echo XButton1:: >> "%ahk_file%"
echo { >> "%ahk_file%"
echo      global MacroAtivado >> "%ahk_file%"
echo      MacroAtivado := !MacroAtivado >> "%ahk_file%"
echo      if (MacroAtivado) >> "%ahk_file%"
echo          ToolTip("MACRO ATIVADO") >> "%ahk_file%"
echo      else >> "%ahk_file%"
echo          ToolTip("MACRO DESATIVADO") >> "%ahk_file%"
echo      SetTimer(() =^> ToolTip(), -1000) >> "%ahk_file%"
echo } >> "%ahk_file%"
echo. >> "%ahk_file%"
echo #HotIf MacroAtivado and WinActive("ahk_exe RobloxPlayerBeta.exe") >> "%ahk_file%"
echo $R:: >> "%ahk_file%"
echo { >> "%ahk_file%"
echo      while GetKeyState("R","P") >> "%ahk_file%"
echo      { >> "%ahk_file%"
echo          SendInput("rr") >> "%ahk_file%"
echo          Sleep(1) >> "%ahk_file%"
echo      } >> "%ahk_file%"
echo } >> "%ahk_file%"
echo $z:: >> "%ahk_file%"
echo { >> "%ahk_file%"
echo      while GetKeyState("z","P") >> "%ahk_file%"
echo      { >> "%ahk_file%"
echo          Send("zz") >> "%ahk_file%"
echo          Sleep(1) >> "%ahk_file%"
echo      } >> "%ahk_file%"
echo } >> "%ahk_file%"
echo $x:: >> "%ahk_file%"
echo { >> "%ahk_file%"
echo      while GetKeyState("x","P") >> "%ahk_file%"
echo      { >> "%ahk_file%"
echo          Send("xx") >> "%ahk_file%"
echo          Sleep(1) >> "%ahk_file%"
echo      } >> "%ahk_file%"
echo } >> "%ahk_file%"
echo $c:: >> "%ahk_file%"
echo { >> "%ahk_file%"
echo      while GetKeyState("c","P") >> "%ahk_file%"
echo      { >> "%ahk_file%"
echo          Send("cc") >> "%ahk_file%"
echo          Sleep(1) >> "%ahk_file%"
echo      } >> "%ahk_file%"
echo } >> "%ahk_file%"
echo $t:: >> "%ahk_file%"
echo { >> "%ahk_file%"
echo      while GetKeyState("t","P") >> "%ahk_file%"
echo      { >> "%ahk_file%"
echo          Send("t") >> "%ahk_file%"
echo          Sleep(1) >> "%ahk_file%"
echo      } >> "%ahk_file%"
echo } >> "%ahk_file%"
echo $f:: >> "%ahk_file%"
echo { >> "%ahk_file%"
echo      while GetKeyState("f","P") >> "%ahk_file%"
echo      { >> "%ahk_file%"
echo          Send("f") >> "%ahk_file%"
echo          Sleep(1) >> "%ahk_file%"
echo      } >> "%ahk_file%"
echo } >> "%ahk_file%"
echo $e:: >> "%ahk_file%"
echo { >> "%ahk_file%"
echo      while GetKeyState("e","P") >> "%ahk_file%"
echo      { >> "%ahk_file%"
echo          Send("e") >> "%ahk_file%"
echo          Sleep(1) >> "%ahk_file%"
echo      } >> "%ahk_file%"
echo } >> "%ahk_file%"
echo #HotIf >> "%ahk_file%"

echo Arquivo gerado com sucesso!
echo.
echo Iniciando o script em segundo plano...
start "" "%ahk_exe%" "%ahk_file%"
echo.
echo ===============================================================================
echo [SUCESSO] O Macro esta rodando!
echo ===============================================================================
echo                     !!Macro é ativado apenas quando o roblox for aberto!! 
echo ===============================================================================
echo                     Ative/Desative usando o Botao Lateral 1 do Mouse.
echo                     Ele funcionara automaticamente dentro do Roblox.
echo                     Um icone verde com um "H" aparecera na setinha perdo do relógio.
echo                     Macro ativado nas teclas (Z), (X), (C), (T), (R), (F) e (E).
echo ===============================================================================
pause
goto menu_macro

:uninstall_macro
cls
color 0C
echo ===============================================================================
echo [2] Removendo o Macro e o AutoHotkey Portatil...
echo ===============================================================================
echo.
echo Encerrando o processo do AutoHotkey (se estiver rodando)...
taskkill /F /IM AutoHotkey64.exe >nul 2>&1
echo.
echo Excluindo arquivos e pastas...

if not exist "%APPDATA%\UtilitariosMacro" goto skip_macro_del
rd /s /q "%APPDATA%\UtilitariosMacro" >nul 2>&1
echo [OK] Arquivos do Macro e AutoHotkey removidos com sucesso.
goto done_macro_del

:skip_macro_del
echo [INFO] Os arquivos ja nao existiam.

:done_macro_del
echo.
echo ===============================================================================
echo                            REMOCAO CONCLUIDA COM SUCESSO!
echo ===============================================================================
pause
goto menu_macro

:whitelist
cls
color 0E
echo ===============================================================================
echo [1] Adicionando Flags da WhiteList (Roblox)...
echo ===============================================================================
echo.
echo Procurando a instalacao do Roblox no seu PC...
call :find_roblox

if not "%roblox_path%"=="" goto rb_found_w
color 0C
echo.
echo [ERRO] O Roblox nao foi encontrado no seu sistema.
echo Certifique-se de que o jogo esta instalado corretamente.
echo.
pause
goto menu_roblox

:rb_found_w
set "client_settings_path=%roblox_path%\ClientSettings"
set "json_file=%client_settings_path%\ClientAppSettings.json"

echo Destino definido: %roblox_path%
echo Criando a pasta ClientSettings...
if not exist "%client_settings_path%" mkdir "%client_settings_path%"

echo.
echo Gerando o arquivo ClientAppSettings.json...
echo { > "%json_file%"
echo      "FFlagHandleAltEnterFullscreenManually": false, >> "%json_file%"
echo      "DFFlagTextureQualityOverrideEnabled": true, >> "%json_file%"
echo      "DFIntDebugFRMQualityLevelOverride": 1, >> "%json_file%"
echo      "DFIntTextureQualityOverride": 0, >> "%json_file%"
echo      "FIntGrassMovementReducedMotionFactor": 0, >> "%json_file%"
echo      "DFIntCSGLevelOfDetailSwitchingDistanceL34": 0, >> "%json_file%"
echo      "DFIntCSGLevelOfDetailSwitchingDistanceL23": 0, >> "%json_file%"
echo      "DFIntCSGLevelOfDetailSwitchingDistanceL12": 0, >> "%json_file%"
echo      "DFIntCSGLevelOfDetailSwitchingDistance": 0, >> "%json_file%"
echo      "FIntDebugForceMSAASamples": 0, >> "%json_file%"
echo      "DFFlagDisableDPIScale": true, >> "%json_file%"
echo      "DFFlagDebugPauseVoxelizer": true, >> "%json_file%"
echo      "FIntFRMMaxGrassDistance": 0, >> "%json_file%"
echo      "FIntFRMMinGrassDistance": 0, >> "%json_file%"
echo      "FFlagDebugGraphicsPreferVulkan": false, >> "%json_file%"
echo      "FFlagDebugGraphicsPreferOpenGL": false >> "%json_file%"
echo } >> "%json_file%"

echo.
echo [SUCESSO] Flags da WhiteList adicionadas com sucesso nos arquivos do Roblox!
echo ===============================================================================
pause
goto menu_roblox

:remove_whitelist
cls
color 0C
echo ===============================================================================
echo [2] Removendo Flags da WhiteList (Roblox)...
echo ===============================================================================
echo.
echo Procurando a instalacao do Roblox no seu PC...
call :find_roblox

if not "%roblox_path%"=="" goto rb_found_rw
echo [INFO] O diretorio do Roblox nao foi encontrado no sistema. Nenhuma flag para remover.
echo.
pause
goto menu_roblox

:rb_found_rw
set "client_settings_path=%roblox_path%\ClientSettings"
if exist "%client_settings_path%" goto rw_delete
echo [INFO] A pasta ClientSettings nao existe. As flags ja foram removidas.
echo.
echo ===============================================================================
pause
goto menu_roblox

:rw_delete
rd /s /q "%client_settings_path%" >nul 2>&1
echo [OK] A pasta ClientSettings e as flags foram removidas com sucesso!
echo.
echo ===============================================================================
pause
goto menu_roblox

:remove_textures
cls
color 0E
echo ===============================================================================
echo [3] Apagando Texturas do Roblox...
echo ===============================================================================
echo.
echo Procurando a instalacao do Roblox no seu PC...
call :find_roblox

if not "%roblox_path%"=="" goto rb_found_rt
color 0C
echo [ERRO] O diretorio do Roblox nao foi encontrado no sistema.
echo.
pause
goto menu_roblox

:rb_found_rt
set "terrain_path=%roblox_path%\PlatformContent\pc\terrain"
set "textures_path=%roblox_path%\PlatformContent\pc\textures"

echo Apagando arquivos da pasta "terrain"...
if exist "%terrain_path%" goto del_terrain
echo [INFO] A pasta "terrain" nao foi encontrada.
goto do_textures

:del_terrain
del /s /q /f "%terrain_path%\*.*" >nul 2>&1
echo [OK] Texturas de terreno removidas.

:do_textures
echo.
echo Apagando arquivos da pasta "textures"...
if exist "%textures_path%" goto del_textures
echo [INFO] A pasta "textures" nao foi encontrada.
goto end_textures

:del_textures
del /s /q /f "%textures_path%\*.*" >nul 2>&1
echo [OK] Texturas gerais removidas.

:end_textures
echo.
echo [SUCESSO] Limpeza de texturas concluida! 
echo                    O seu jogo agora ficara mais leve e com mais FPS.
echo ===============================================================================
pause
goto menu_roblox

:custom_fonts
cls
color 0E
echo ===============================================================================
echo                                 ESCOLHA A FONTE DO JOGO
echo ===============================================================================
echo.
echo [1] - Fonte de Coracoes ^<3
echo [2] - Fonte do Minecraft
echo [3] - Fonte Ubuntu
echo [4] - Fonte Oswald
echo [5] - Fonte Short-Baby
echo [6] - Fonte Be-Mine
echo [7] - Fonte Tilt-Neon
echo.
echo [8] - Restaurar Fontes Originais
echo [9] - Voltar ao Menu do Roblox
echo.
set /p font_opcao="Digite o numero da opcao desejada: "

if "%font_opcao%"=="1" set "font_file=CustomFont.ttf" & set "font_name=Coracoes" & goto apply_custom_font
if "%font_opcao%"=="2" set "font_file=CustomFont1.ttf" & set "font_name=Minecraft" & goto apply_custom_font
if "%font_opcao%"=="3" set "font_file=CustomFont2.ttf" & set "font_name=Ubuntu" & goto apply_custom_font
if "%font_opcao%"=="4" set "font_file=CustomFont3.ttf" & set "font_name=Oswald" & goto apply_custom_font
if "%font_opcao%"=="5" set "font_file=CustomFont4.ttf" & set "font_name=Short-Baby" & goto apply_custom_font
if "%font_opcao%"=="6" set "font_file=CustomFont5.ttf" & set "font_name=Be-Mine" & goto apply_custom_font
if "%font_opcao%"=="7" set "font_file=CustomFont6.ttf" & set "font_name=Tilt-Neon" & goto apply_custom_font
if "%font_opcao%"=="8" goto restore_original_fonts
if "%font_opcao%"=="9" goto menu_roblox

goto custom_fonts

:apply_custom_font
cls
color 0E
echo ===============================================================================
echo Procurando a instalacao do Roblox no seu PC...
call :find_roblox

if "%roblox_path%"=="" (
    color 0C
    echo [ERRO] O diretorio do Roblox nao foi encontrado no sistema.
    echo.
    pause
    goto menu_roblox
)

set "fonts_path=%roblox_path%\content\fonts"

echo Destino definido: %fonts_path%
if not exist "%fonts_path%" mkdir "%fonts_path%"

echo.
echo Limpando fontes originais e configuracoes anteriores...
del /q /f "%fonts_path%\*.*" >nul 2>&1
if exist "%fonts_path%\families" rd /s /q "%fonts_path%\families" >nul 2>&1
mkdir "%fonts_path%\families" >nul 2>&1

echo.
echo Baixando a fonte %font_name% do seu GitHub para a pasta fonts...

set "URL_DA_FONTE=https://raw.githubusercontent.com/Gml1010/Roblox-Custom-Fonts/main/%font_file%"
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile('%URL_DA_FONTE%', '%fonts_path%\CustomFont.ttf')"

if not exist "%fonts_path%\CustomFont.ttf" (
    color 0C
    echo.
    echo [ERRO] Falha ao baixar o arquivo %font_file% do GitHub. 
    echo Verifique sua conexao com a internet ou confirme se o arquivo existe.
    echo.
    pause
    goto custom_fonts
)

echo.
echo Baixando os arquivos da pasta 'families2' do GitHub e renomeando para 'families' no sistema...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; try { $arquivos = (Invoke-RestMethod -Uri 'https://api.github.com/repos/Gml1010/Roblox-Custom-Fonts/contents/families2').name; foreach ($arq in $arquivos) { $url = 'https://raw.githubusercontent.com/Gml1010/Roblox-Custom-Fonts/main/families2/' + $arq; Invoke-WebRequest -Uri $url -OutFile ('%fonts_path%\families\' + $arq) -UseBasicParsing } } catch { Write-Host '[ERRO] Falha ao baixar os arquivos da pasta families2.' -ForegroundColor Red }"

echo.
color 0A
echo [SUCESSO] Fonte %font_name% instalada e renomeada para CustomFont.ttf!
echo Todos os arquivos da pasta families2 foram clonados com sucesso na pasta families!
echo ===============================================================================
pause
goto menu_roblox

:restore_original_fonts
cls
color 0E
echo ===============================================================================
echo                      RESTAURANDO FONTES ORIGINAIS
echo ===============================================================================
echo.
echo Procurando a instalacao do Roblox no seu PC...
call :find_roblox

if "%roblox_path%"=="" (
    color 0C
    echo [ERRO] O diretorio do Roblox nao foi encontrado no sistema.
    echo.
    pause
    goto menu_roblox
)

set "fonts_path=%roblox_path%\content\fonts"

echo Destino definido: %fonts_path%
if not exist "%fonts_path%" mkdir "%fonts_path%"

echo.
echo Limpando as fontes modificadas da pasta fonts...
del /q /f "%fonts_path%\*.*" >nul 2>&1
if exist "%fonts_path%\families" rd /s /q "%fonts_path%\families" >nul 2>&1
mkdir "%fonts_path%\families" >nul 2>&1

echo.
echo Baixando fontes originais do repositorio do GitHub (ignorando as customizadas)...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; try { $root = Invoke-RestMethod -Uri 'https://api.github.com/repos/Gml1010/Roblox-Custom-Fonts/contents/'; foreach ($item in $root) { if ($item.type -eq 'file' -and $item.name -notmatch '^CustomFont') { Invoke-WebRequest -Uri $item.download_url -OutFile ('%fonts_path%\' + $item.name) -UseBasicParsing } } } catch { Write-Host '[ERRO] Falha ao baixar os arquivos originais.' -ForegroundColor Red }"

echo.
echo Baixando a pasta 'families' original...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; try { $fam = Invoke-RestMethod -Uri 'https://api.github.com/repos/Gml1010/Roblox-Custom-Fonts/contents/families'; foreach ($item in $fam) { if ($item.type -eq 'file') { Invoke-WebRequest -Uri $item.download_url -OutFile ('%fonts_path%\families\' + $item.name) -UseBasicParsing } } } catch { Write-Host '[ERRO] Falha ao baixar os arquivos da pasta families.' -ForegroundColor Red }"

echo.
color 0A
echo [SUCESSO] As fontes do Roblox foram restauradas para os padroes originais!
echo ===============================================================================
pause
goto menu_roblox

:fps_unlock
cls
color 0E
echo ===============================================================================
echo [5] Removendo Limitador de FPS (Roblox)...
echo ===============================================================================
echo.

:: Usa a variavel LOCALAPPDATA para garantir que ache a pasta do usuario atual
set "settings_file=%LOCALAPPDATA%\Roblox\GlobalBasicSettings_13.xml"

if not exist "%settings_file%" (
    color 0C
    echo [ERRO] O arquivo GlobalBasicSettings_13.xml nao foi encontrado.
    echo Verifique se voce ja abriu o Roblox pelo menos uma vez neste PC.
    echo.
    pause
    goto menu_roblox
)

echo Modificando a variavel FramerateCap para 9999...
:: O PowerShell vai ler o arquivo, procurar a tag e substituir o numero que estiver la (seja 60, 240, etc.) por 9999
powershell -NoProfile -ExecutionPolicy Bypass -Command "(Get-Content '%settings_file%') -replace '<int name=\"FramerateCap\">.*</int>', '<int name=\"FramerateCap\">9999</int>' | Set-Content '%settings_file%'"

echo.
color 0A
echo [SUCESSO] Limitador de FPS removido com sucesso! O valor foi definido para 9999.
echo ===============================================================================
pause
goto menu_roblox

:fps_restore
cls
color 0E
echo ===============================================================================
echo [6] Restaurando Limitador de FPS para Padrao (240 FPS)...
echo ===============================================================================
echo.

:: Usa a variavel LOCALAPPDATA para garantir que ache a pasta do usuario atual
set "settings_file=%LOCALAPPDATA%\Roblox\GlobalBasicSettings_13.xml"

if not exist "%settings_file%" (
    color 0C
    echo [ERRO] O arquivo GlobalBasicSettings_13.xml nao foi encontrado.
    echo Verifique se voce ja abriu o Roblox pelo menos uma vez neste PC.
    echo.
    pause
    goto menu_roblox
)

echo Modificando a variavel FramerateCap para 240...
:: O PowerShell vai ler o arquivo, procurar a tag e substituir o numero que estiver la por 240
powershell -NoProfile -ExecutionPolicy Bypass -Command "(Get-Content '%settings_file%') -replace '<int name=\"FramerateCap\">.*</int>', '<int name=\"FramerateCap\">240</int>' | Set-Content '%settings_file%'"

echo.
color 0A
echo [SUCESSO] Limitador de FPS restaurado com sucesso! O valor foi definido para 240.
echo ===============================================================================
pause
goto menu_roblox

:creditos
cls
color 0B
echo ===============================================================================
echo                                      CREDITOS
echo ===============================================================================
echo.
echo Modificado/Criado por: GML10
echo Patrocinado por: forever029094
echo Ajuda criativa: MangoParrotXD, BugadoJPP
echo Base template: tavinus in Github
echo.
echo ===============================================================================
pause
goto menu


:: ===============================================================================
:: SUB-ROTINAS DE SISTEMA ABAIXO (NAO ALTERAR)
:: Funcoes 100% planas (sem blocos if/else) para evitar crash de memoria no IExpress
:: ===============================================================================

:clean_temp_loop
for %%i in ("%temp%\*.*") do if /i not "%%~fi"=="%~f0" del /f /q "%%~fi" >nul 2>&1
for /d %%x in ("%temp%\*") do call :clean_temp_dir "%%~fx"
del /f /q "C:\Windows\Temp\*.*" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do rd /s /q "%%~fx" >nul 2>&1
del /f /q "C:\WINDOWS\Prefetch\*.*" >nul 2>&1
goto :eof

:clean_temp_dir
echo "%~nx1" | findstr /i "IXP" >nul
if not errorlevel 1 goto :eof
if /i not "%~1\"=="%~dp0" rd /s /q "%~1" >nul 2>&1
goto :eof

:find_roblox
set "roblox_path="
set "search_base=%LOCALAPPDATA%\Roblox\Versions"
if exist "%search_base%" call :scan_roblox_dir "%search_base%"
if not "%roblox_path%"=="" goto :eof

set "search_base=C:\Program Files (x86)\Roblox\Versions"
if exist "%search_base%" call :scan_roblox_dir "%search_base%"
if not "%roblox_path%"=="" goto :eof

set "search_base=C:\Program Files\Roblox\Versions"
if exist "%search_base%" call :scan_roblox_dir "%search_base%"
if not "%roblox_path%"=="" goto :eof

:: Checa todos os usuarios se o script estiver em modo System/Admin
for /d %%U in ("C:\Users\*") do call :scan_user_roblox "%%U"
goto :eof

:scan_user_roblox
set "search_base=%~1\AppData\Local\Roblox\Versions"
if exist "%search_base%" call :scan_roblox_dir "%search_base%"
goto :eof

:scan_roblox_dir
for /f "delims=" %%D in ('dir /b /ad /o-d "%~1\*" 2^>nul') do call :check_exe "%~1\%%D"
goto :eof

:check_exe
if not "%roblox_path%"=="" goto :eof
if exist "%~1\RobloxPlayerBeta.exe" set "roblox_path=%~1"
if exist "%~1\RobloxPlayer.exe" set "roblox_path=%~1"
goto :eof
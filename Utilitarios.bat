:: ===============================================================================
:: FUNCOES DO SISTEMA: ATUALIZADOR AUTOMATICO
:: ===============================================================================
:verificar_atualizacao
cls
color 0B
echo ===============================================================================
echo                           VERIFICANDO ATUALIZACOES...
echo ===============================================================================

:: Links RAW corretos baseados no seu repositorio
set "URL_VERSAO=https://raw.githubusercontent.com/Gml1010/UPDVERSION/main/version.txt"
set "URL_SCRIPT=https://raw.githubusercontent.com/Gml1010/UPDVERSION/main/Utilitarios.bat"

set "TEMP_VERSION=%temp%\versao_temp.txt"

:: Baixa o arquivo version.txt do GitHub
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; try { Invoke-WebRequest -Uri '%URL_VERSAO%' -OutFile '%TEMP_VERSION%' -UseBasicParsing -TimeoutSec 5 } catch { exit 1 }"

if not exist "%TEMP_VERSION%" (
    color 0C
    echo [ERRO] Nao foi possivel verificar atualizacoes.
    echo Motivos comuns: Sem internet, repositorio privado ou o arquivo version.txt nao existe.
    timeout /t 4 >nul
    goto :eof
)

:: Le a versao baixada e remove espacos em branco
set /p VERSAO_NOVA=<"%TEMP_VERSION%"
del /f /q "%TEMP_VERSION%" >nul 2>&1
set "VERSAO_NOVA=%VERSAO_NOVA: =%"

:: Compara as versoes
if "%VERSAO_ATUAL%"=="%VERSAO_NOVA%" (
    echo [OK] O script ja esta na versao mais recente ^(%VERSAO_ATUAL%^).
    timeout /t 2 >nul
    goto :eof
)

:: Se encontrar atualizacao:
color 0E
echo.
echo [!] NOVA VERSAO DISPONIVEL: %VERSAO_NOVA% ^(Sua versao atual: %VERSAO_ATUAL%^)
echo.
set /p update_choice="Deseja atualizar agora? (S/N): "
if /i not "%update_choice%"=="S" goto :eof

echo.
echo Baixando a nova versao... aguarde.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; try { Invoke-WebRequest -Uri '%URL_SCRIPT%' -OutFile 'Atualizacao_Temp.bat' -UseBasicParsing } catch { exit 1 }"

if not exist "Atualizacao_Temp.bat" (
    color 0C
    echo [ERRO] Falha ao baixar a nova versao do script do GitHub.
    timeout /t 4 >nul
    goto :eof
)

:: Cria um mini-script temporario para substituir o arquivo antigo e reinicia-lo
echo @echo off > "atualizador.bat"
echo timeout /t 2 /nobreak ^>nul >> "atualizador.bat"
echo move /y "Atualizacao_Temp.bat" "%~nx0" >> "atualizador.bat"
echo start "" "%~nx0" >> "atualizador.bat"
echo del "%%~f0" >> "atualizador.bat"

echo.
echo Atualizacao concluida! Reiniciando o programa...
start "" "atualizador.bat"
exit
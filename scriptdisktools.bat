@echo off

:menu
cls
echo Usuario Logado: %username% 
echo Data: %date%
echo Script Manipulacao de Arquivos, Diretorios e Discos;
echo ------------------------------------
echo 1 - Criar Arquivo ou Diretorio
echo 2 - Corrigir Disco
echo 3 - Formatar Disco
echo 4 - Sobre do Script
echo 5 - Sair do Script
echo -------------------------------------

set /p opc= "Selecione uma das opcoes a seguir: "
if %opc% equ 1 goto submenu1
if %opc% equ 2 goto submenu2
if %opc% equ 3 goto submenu3 
if %opc% equ 4 goto submenu4 
if %opc% equ 5 goto submenu5
if %opc% geq 6 echo Opcao Invalida!!! & pause & goto menu

:submenu1
cls
echo Menu Criar Arquivo ou Diretorio
echo ------------------------------------
echo 1 - Criar Arquivo
echo 2 - Criar Diretorio
echo 3 - Voltar ao Menu Principal
echo ------------------------------------

set /p subopc= "Selecione uma das opcoes a seguir: "
if %subopc% equ 1 goto submenu1_1
if %subopc% equ 2 goto submenu1_2
if %subopc% equ 3 goto menu
if %subopc% geq 4 echo Opcao Invalida!!! & pause & goto submenu1

:submenu1_1
cls
cd C:\Users\cesar\Desktop
echo Menu Criar Arquivo
echo ------------------------
set /p dest= "Selecione o destino para criacao do arquivo(ex: c:\users\%username%\desktop\): "
set /p nomearq= "Digite o nome do arquivo com a extensao(ex: texto.txt): "
cd /d %dest%
echo> %nomearq%
echo Arquivo %nomearq% criado com sucesso!!!
pause
goto submenu1

:submenu1_2
cls
cd C:\Users\cesar\Desktop
echo Menu Criar Diretorio
echo ------------------------
set /p desti= "Selecione o destino para criacao do diretorio(ex: c:\users\%username%\desktop\): "
set /p nomedir= "Digite o nome do diretorio a ser criado: "
cd /d %desti%
mkdir %nomedir%
echo Diretorio %nomedir% criado com sucesso!!!
pause
goto submenu1

:submenu2
cls
echo Menu Corrigir Disco
echo ---------------------
echo Lista de Unidades:
wmic logicaldisk get deviceid, volumename, description
echo --------------------------------------------------
set /p disco= "Digite a letra do disco que deve ser corrigido: "
cd /d %disco%:
attrib -s -h -r /s /d *.*
cls
echo Arquivos e pastas da unidade selecionada:
echo ---------------------------------------------
tree /f
pause
cls
echo Buscando Arquivos Infectados...
echo ---------------------------------------
timeout /t 5
cls
echo Os seguintes arquivos sao suspeitos:
echo ---------------------------------------
dir /b *.inf
dir /b autorun.*
pause
cls
echo ---------------------------------------
echo Deletando os arquivos suspeitos...
echo.
del *.inf
del autorun.*
timeout /t 5
echo ---------------------------------------
cls
echo ----------------------------
echo Arquivos deletados!!!
echo ----------------------------
pause
goto menu

:submenu3
cls
echo Menu Formatar Disco
echo ------------------------------
echo 1 - Formatacao Rapida
echo 2 - Formatacao Normal
echo 3 - Voltar ao Menu Principal
echo ------------------------------

set /p sopc= "Selecione uma das opcoes a seguir: "
if %sopc% equ 1 goto submenu3_1
if %sopc% equ 2 goto submenu3_2
if %sopc% equ 3 goto menu
if %sopc% geq 4 echo Opcao Invalida!!! & pause & goto submenu3

:submenu3_1
cls
echo Formatacao Rapida
echo ---------------------
echo Lista de Unidades:
echo --------------------------------------------------
wmic logicaldisk get deviceid, volumename, description
echo --------------------------------------------------
set /p subdisco= "Digite a letra do disco que deve ser formatado: "
set /p nomedisco= "Digite o nome que o disco recebera apos ser formatado: "
set /p formarq= "Digite o formato do sistema de arquivos que deseja(FAT, FAT32, NTFS, exFAT, ReFS ou UDF): "
format %subdisco%: /v:%nomedisco% /q /fs:%formarq%
echo Formatando o disco...
timeout /t 5
cls
dir %subdisco%:
echo ----------------------------------
echo Disco formatado com sucesso!!!!
echo ----------------------------------
pause
goto submenu3

:submenu3_2
cls
echo Formatacao Normal
echo --------------------
echo Lista de Unidades:
echo --------------------------------------------------
wmic logicaldisk get deviceid, volumename, description
echo --------------------------------------------------
set /p ssubdisco= "Digite a letra do disco que deve ser formatado: "
set /p snomedisco= "Digite o nome que o disco recebera apos ser formatado: "
set /p sformarq= "Digite o formato do sistema de arquivos que deseja(FAT, FAT32, NTFS, exFAT, ReFS ou UDF): "
format %ssubdisco%: /v:%snomedisco% /fs:%sformarq%
echo Formatando o disco...
timeout /t 5
cls
dir %ssubdisco%:
echo ----------------------------------
echo Disco formatado com sucesso!!!!
echo ----------------------------------
pause
goto submenu3

:submenu4
cls
echo ------------------
echo Sobre o Script
echo ------------------
echo.
echo Script criado por Sir Hacky
echo Data da criacao: 16/06/2022
echo Todos os direitos autorais sao reservados ao criador
echo.
echo Deuses criam tudo, programadores criam deuses!
pause
goto menu

:submenu5
cls
echo ------------------------
echo Saindo do terminal...
echo ------------------------
pause
exit

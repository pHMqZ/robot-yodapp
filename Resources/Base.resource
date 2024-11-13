*** Settings ***
Documentation        Arquivo principal do projeto de testes automatizados mobile com Robot Framework

Library            AppiumLibrary


Resource            ./Components/Menu.resource
Resource            ./Components/TelaInicial.resource
Resource            ./Components/TelaElemento.resource
Resource            ./Components/Login.resource



*** Keywords ***

Start session
    Open Application    http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/yodapp-beta.apk
    ...                 uidi=emulator-5554
    ...                 autoGrantPermissions=true
    ...                 adbExecTimeout=60000
    ...                 androidInstallTimeout=90000    
    ...                 uiautomator2ServerInstallTimeout=60000
    
Finish session

    Capture Page Screenshot
    Close Application


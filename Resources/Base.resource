*** Settings ***
Documentation        Arquivo principal do projeto de testes automatizados mobile com Robot Framework

Library            AppiumLibrary




*** Keywords ***
Start session
    Open Application    http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/yodapp-beta.apk
    ...                 uidi=emulator-5554
    ...                 autoGrantPermissions=true
    
    Wait Until Page Contains    Yodapp

Finish session

    Capture Page Screenshot
    Close Application
*** Settings ***
Documentation      Ações da tela de testes de login

Library            AppiumLibrary

*** Keywords ***
Submit login
    [Arguments]    ${email}    ${senha}     ${mensagemRetorno}

    Input Text    xpath=//android.widget.EditText[@resource-id="com.qaxperience.yodapp:id/etEmail"]
    ...    ${email}

    Input Text    xpath=//android.widget.EditText[@resource-id="com.qaxperience.yodapp:id/etPassword"]
    ...    ${senha}

    Click Element    xpath=//android.widget.Button[@resource-id="com.qaxperience.yodapp:id/btnSubmit"]

    Wait Until Page Contains    ${mensagemRetorno}    5

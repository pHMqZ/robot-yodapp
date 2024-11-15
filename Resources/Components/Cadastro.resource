*** Settings ***
Documentation      Ações da tela de testes de cadastro

Library            AppiumLibrary

*** Keywords ***
Submit registration
    [Arguments]    ${name}    ${email}    ${pass}    ${level}    	${mensagemRetorno}

    Input Text    xpath=//android.widget.EditText[@resource-id="com.qaxperience.yodapp:id/etUsername"]
    ...    ${name}
    Input Text    xpath=//android.widget.EditText[@resource-id="com.qaxperience.yodapp:id/etEmail"]
    ...    ${email}
    Input Text    xpath=//android.widget.EditText[@resource-id="com.qaxperience.yodapp:id/etPassword"]
    ...    ${pass}

    Click Element    xpath=//android.widget.Spinner[@resource-id="com.qaxperience.yodapp:id/spinnerJob"]
    Wait Until Element Is Visible    xpath=//android.widget.ListView

    Click Element     xpath=//android.widget.TextView[contains(@text, "${level}")]

    Click Element    xpath=//android.widget.Button[@resource-id="com.qaxperience.yodapp:id/btnSubmit"]

    Wait Until Page Contains    ${mensagemRetorno}    5
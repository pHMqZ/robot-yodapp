*** Settings ***
Documentation        Ações e elementos do menu do aplicativo

Library              AppiumLibrary


Resource            ../Resources/Base.resource

Test Setup          Start session

Test Teardown       Finish session

*** Variables ***
${START}    QAX

*** Test Cases ***
Teste de clique simples
    
    Wait Until Page Contains    ${START} 

    Click Text                  ${START} 
    
    ${sideMenu}     Set Variable     xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible    ${sideMenu}    5

    Click Element                    ${sideMenu}

    ${menuItem}    Set Variable      xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="Clique em Botões"]

    Wait Until Element Is Visible    ${menuItem}    5

    Click Element                    ${menuItem}
    
    Wait Until Page Contains         Clique simples    5
    Click Text                       Clique simples
    Wait Until Page Contains         Botão clique simples

    Click Element                    xpath=//*[@resource-id="com.qaxperience.yodapp:id/short_click"]
    Wait Until Page Contains         Isso é um clique simples


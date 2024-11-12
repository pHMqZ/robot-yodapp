*** Settings ***
Documentation        Ações e elementos do menu do aplicativo


Resource            ../Resources/Base.resource

Test Setup          Start session

Test Teardown       Finish session



*** Test Cases ***
Teste de clique simples
    Get started

    Navigate to    Clique em Botões

    Go to item     Clique simples    Botão clique simples

    Click Element                    xpath=//*[@resource-id="com.qaxperience.yodapp:id/short_click"]
    Wait Until Page Contains         Isso é um clique simples


Teste de clique longo
    [Tags]    long
    
    Get started

    Navigate to    Clique em Botões

    Go to item     Clique longo    Botão clique simples

    ${locator}    Set Variable    xpath=//*[@resource-id="com.qaxperience.yodapp:id/short_click"]

    ${positions}    Get Element Location             ${locator}   

    Tap With Positions    	         1000    ${${positions}[x], ${positions}[y]}   
    Wait Until Page Contains         Isso é um clique longo




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





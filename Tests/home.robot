*** Settings ***

Library        AppiumLibrary

Resource      ../Resources/Base.resource

Test Setup        Start session

Test Teardown     Finish session

*** Test Cases ***
Abrir tela principal do aplicativo e realizar clique simples  
    Wait Until Page Contains    Yodapp
    Wait Until Page Contains    QAX

    Click Text                  QAX

    Sleep                        5

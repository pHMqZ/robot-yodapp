*** Settings ***

Library        AppiumLibrary

Resource      ../Resources/Base.resource

Test Setup        Start session

Test Teardown     Finish session

*** Test Cases ***
Abrir tela principal do aplicativo  
    Wait Until Page Contains    Yodapp

    Sleep                        5

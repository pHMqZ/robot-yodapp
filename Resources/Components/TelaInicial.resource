*** Settings ***
Documentation        Ações do menu lateral do aplicativo

Library              AppiumLibrary


*** Variables ***
${START}    QAX


*** Keywords ***

Get started
    Wait Until Page Contains    ${START}    10

    Click Text                  ${START} 

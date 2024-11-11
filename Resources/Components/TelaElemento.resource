*** Settings ***
Documentation        Ações do menu lateral do aplicativo

Library              AppiumLibrary

*** Keywords ***

Go to item 
    [Arguments]    ${item}    ${checkpoint}
    Wait Until Page Contains         ${item}    5
    Click Text                       ${item}
    Wait Until Page Contains         ${checkpoint}
    
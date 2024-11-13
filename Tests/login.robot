*** Settings ***

Resource            ../Resources/Base.resource

Test Setup          Start session

Test Teardown       Finish session



*** Test Cases ***
Login com sucesso
    Get started

    Navigate to    Formulários

    Go to item     Login    Olá Padawan, vamos testar o login?

    Submit login    yoda@qax.com    jedi    Boas vindas, logado você está.

Login com email vazio
    Get started

    Navigate to    Formulários

    Go to item     Login    Olá Padawan, vamos testar o login?

    Submit login    ${EMPTY}    jedi    Email válido você deve informar!

Login com senha vazia
    Get started

    Navigate to    Formulários

    Go to item     Login    Olá Padawan, vamos testar o login?

    Submit login    yoda@qax.com    ${EMPTY}    Uma senha você deve informar!

Login com email incorreto
    Get started

    Navigate to    Formulários

    Go to item     Login    Olá Padawan, vamos testar o login?

    Submit login    vader@qax.com    jedi    Oops! Credenciais incorretas

Login com senha incorreto
    Get started

    Navigate to    Formulários

    Go to item     Login    Olá Padawan, vamos testar o login?

    Submit login    yoda@qax.com    sith    Oops! Credenciais incorretas

Login com email e senha incorretos
    Get started

    Navigate to    Formulários

    Go to item     Login    Olá Padawan, vamos testar o login?

    Submit login    vader@qax.com    sith    Oops! Credenciais incorretas


    
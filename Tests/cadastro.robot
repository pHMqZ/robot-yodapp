*** Settings ***

Resource            ../Resources/Base.resource

Test Setup          Start session

Test Teardown       Finish session



*** Test Cases ***
Cadastro - Padawan
    Get started

    Navigate to    Formulários

    Go to item     Cadastro    Crie sua conta.

    Submit registration    Alceu    alceu@alceu.com    alceu    Padawan    Tudo certo, boas vindas ao Yodapp!

Cadastro - Jedi
    Get started

    Navigate to    Formulários

    Go to item     Cadastro    Crie sua conta.

    Submit registration    Alceu    alceu@alceu.com    alceu    Jedi    Tudo certo, boas vindas ao Yodapp!

Cadastro - Sith
    Get started

    Navigate to    Formulários

    Go to item     Cadastro    Crie sua conta.

    Submit registration    Alceu    alceu@alceu.com    alceu    Sith    Tudo certo, boas vindas ao Yodapp!

Cadastro - Outros
    Get started

    Navigate to    Formulários

    Go to item     Cadastro    Crie sua conta.

    Submit registration    Alceu    alceu@alceu.com    alceu    Outros    Tudo certo, boas vindas ao Yodapp!
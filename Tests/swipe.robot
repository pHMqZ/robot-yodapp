*** Settings ***

Resource            ../Resources/Base.resource

Test Setup          Start session

Test Teardown       Finish session



*** Test Cases ***
Remover item da lista - Mandaloriano
    Get started

    Navigate to    Star Wars

    Go to item     Lista    Lista

    Item exclusion    Mandaloriano

Remover item da lista - Darth Vader
    Get started

    Navigate to    Star Wars

    Go to item     Lista    Lista

    Item exclusion    Darth Vader

Remover item da lista - Princesa Leia
    Get started

    Navigate to    Star Wars

    Go to item     Lista    Lista

    Item exclusion    Princesa Leia

Remover item da lista - Luke Skywalker
    Get started

    Navigate to    Star Wars

    Go to item     Lista    Lista

    Item exclusion    Luke Skywalker

Remover item da lista - Chewbacca
    Get started

    Navigate to    Star Wars

    Go to item     Lista    Lista

    Item exclusion    Chewbacca
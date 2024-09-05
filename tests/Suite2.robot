*** Settings ***
Documentation    My First Test suite for Robot framework
...              This is Conitnued documnetation 
Library    SeleniumLibrary
Library    Screenshot    ./lib
Resource    ../resources/Keywords.resource


*** Variables ***
${PAGEURL}    https://conduit.realworld.how/
${WEBPAGE}    https://example.cypress.io/todo
${BROWSER}    firefox
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${EMAIL}    test456@testu.ai
${ERROR_CLASS}    Hi
@{List_Items}    Books    Cleaning    Groceries    Job    

*** Test Cases ***

Sign Up with valid credentials
    Set Test Documentation    doc TC1
    Navigate to Website    ${PAGEURL}    ${BROWSER}
    Sign Up to Website    ${USERNAME}    ${EMAIL}    ${PASSWORD}
    Get Window Titles
    Close Browser

Cypress ToDo App - Add an item
    Log To Console    ----Test Start----
    Navigate to Website    ${WEBPAGE}    firefox
    Page Should Contain    todos
    Element Text Should Be    //h1    todos
    Add a New ToDo    Book
    Set Focus To Element    //h1
    Sleep    2s
    Close Browser
    Log To Console    ----Test End----

Cypress ToDo App - Remove an item
    Log To Console    ----Test Start----
    Navigate to Website    ${WEBPAGE}    ${BROWSER}
    Page Should Contain    todos
    Element Text Should Be    //h1    todos
    Add a New ToDo    Book
    Remove a ToDo    Book
    ${cnt}    Get Element Count    //input[@type='checkbox' and @class='toggle']
    Should Be Equal As Integers    ${cnt}    2
    Sleep    2s
    Close Browser
    Log To Console    ----Test End----


Cypress ToDo App - Add and Remove an item
    Log To Console    ----Test Start----
    Navigate to Website    ${WEBPAGE}    ${BROWSER}
    Page Should Contain    todos
    Element Text Should Be    //h1    todos
    FOR    ${element}    IN    @{List_Items}
        Log To Console    ${element}
        Add a New ToDo    ${element}
        Page Should Contain    ${element}
    END
    ${ele}    Get WebElements    //input[@type='checkbox' and @class='toggle']
    ${cnt}    Get Length    ${ele}
    Log To Console    ${cnt}
    Should Be Equal As Numbers    ${cnt}    6
    FOR    ${var}    IN    @{List_Items}
        Remove a ToDo     ${var}
    END
    Sleep    2s
    Close Browser
    Log To Console    ----Test End----


Second test Cases
    [Tags]    robot:skip
    Log To Console    I am in my senses as
    Log To Console   Hi there
Third Test Cases
    Log To Console    Great to know yourself
    Log To Console    message
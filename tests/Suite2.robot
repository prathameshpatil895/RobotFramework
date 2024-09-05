*** Settings ***
Documentation    My First Test suite for Robot framework
...              This is Conitnued documnetation 
Library    SeleniumLibrary
Library    Screenshot    ./lib


*** Variables ***
${PAGEURL}    https://conduit.realworld.how/
${WEBPAGE}    https://example.cypress.io/todo
${BROWSER}    firefox
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${EMAIL}    test456@testu.ai
${ERROR_CLASS}    Hi
@{List_Items}    Books    Cleaning    Groceries    Job    

*** Keywords ***
Navigate to Website
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
Sign Up to Website
    [Arguments]    ${username}     ${email}    ${password}  
    Click Element    //a[text()=' Sign up ']
    Wait Until Element Is Visible     xpath://input[@placeholder="Username"]
    Input Text    xpath://input[@placeholder="Username"]     ${username}
    Input Text    xpath://input[@placeholder="Email"]    ${email}
    Input Text    xpath://input[@placeholder="Password"]    ${password}
    Click Element    xpath://button[@type='submit']

Add a New ToDo
    [Arguments]    ${item}
    Input Text    xpath://input[@class='new-todo']    ${item}
    Press Keys    xpath://input[@class='new-todo']    RETURN

Remove a ToDo
    [Arguments]    ${item}
    Select Checkbox    //label[text()='${item}']/preceding-sibling::input[@type='checkbox']
    Checkbox Should Be Selected    //label[text()='${item}']/preceding-sibling::input[@type='checkbox']
    Wait Until Element Is Visible    //button[text()='Clear completed']
    Click Button    //button[text()='Clear completed']
    
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
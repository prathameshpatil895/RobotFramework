*** Settings ***
Documentation    My First Test suite for Robot framework
...              This is Conitnued documnetation 
Library    SeleniumLibrary

*** Keywords ***
Navigate to Website
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}      ${browser}
    Maximize Browser Window
Login to Website
    [Arguments]    ${username}     ${password}
    Input Text    xpath://input[@id="user-name"]     ${username}
    Input Text    xpath://input[@id="password"]    ${password}
    Click Element    xpath://input[@id="login-button"]

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
    
*** Settings ***
Documentation    My First Test suite for Robot framework
...              This is Conitnued documnetation 
Library    SeleniumLibrary

*** Variables ***
${PAGEURL}    https://www.saucedemo.com/
${BROWSER}    firefox
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Keywords ***
Navigate to Website
    Open Browser    ${PAGEURL}  ${BROWSER}
    Maximize Browser Window
Login to Website
    [Arguments]    ${username}     ${password}
    Input Text    xpath://input[@id="user-name"]     ${username}
    Input Text    xpath://input[@id="password"]    ${password}
    Click Element    xpath://input[@id="login-button"]

*** Test Cases ***

Login with valid credentials
    Log    Test start
    Set Test Documentation    doc TC1
    Navigate to Website
    Login to Website    ${USERNAME}    ${PASSWORD}
    Close Browser
    Log    Test end

Login with invalid credentials
    Log    Test start
    Set Test Documentation    doc TC1
    Navigate to Website
    Login to Website    ${USERNAME}    bhu
    Get WebElement    xpath://div[@class='error-message-container error'] | Msg
    Wait Until Element Contains    //div[@class='error-message-container error']    Epic sadface: Username and password do not match any user in this service
    Close Browser
    Log    Test end

Login with invalid empty password
    Log    Test start
    Set Test Documentation    doc TC1
    Navigate to Website
    Login to Website    ${USERNAME}    ${EMPTY}
    Get WebElement    xpath://div[@class='error-message-container error'] | Msg
    Wait Until Element Contains    //div[@class='error-message-container error']    Epic sadface: Password is required
    Close Browser
    Log    Test end

Login with invalid empty username
    Log    Test start
    Set Test Documentation    doc TC1
    Navigate to Website
    Login to Website    ${EMPTY}    Password
    Get WebElement    xpath://div[@class='error-message-container error'] | Msg
    Wait Until Element Contains    //div[@class='error-message-container error']    Epic sadface: Username is required
    Close Browser
    Log    Test end


Login and Add Product to cart
    [Tags]    robot:continue-on-failure
    Log    Test start
    Set Test Documentation    doc TC1
    Navigate to Website
    Login to Website    ${USERNAME}    ${PASSWORD}
    Wait Until Element Contains    //span[text()='Products']    Products
    Click Element    xpath://div[text()='Sauce Labs Backpack']
    Click Element    xpath://button[@id='add-to-cart']
    Wait Until Element Contains    //button[@id='remove']    Remove
    Close Browser
    Log    Test end
Second test Cases
    [Tags]    robot:skip
    Log    I am in my senses as
    Log    Hi there
Third Test Cases
    Log    Great to know yourself
    Log    message
*** Settings ***
Documentation    My First Test suite for Robot framework
...              This is Conitnued documnetation 
Library    SeleniumLibrary

*** Variables ***
${PAGEURL}    https://www.saucedemo.com/
${BROWSER}    firefox
@{LIST_ITEMS}    Food    Car    House    School    Community
@{List_Numbers}    1    2    3    4    5    6    7    8    9    10

*** Keywords ***


*** Test Cases ***

First TC
    FOR    ${counter}    IN RANGE    0    10    2
        Log To Console    ${counter}
    END

Second test Cases
    [Tags]    robot:skip
    Log    I am in my senses as
    Log    Hi there
Third Test Cases
    Log    Great to know yourself
    FOR    ${element}    IN    @{LIST_ITEMS}
        Log To Console   ${element}
    END

Fourth TC
    FOR    ${var}    IN    @{List_Numbers}
        Log To Console   ${var}
        Exit For Loop If    ${var}==6
    END

Fifth TC Timer
    FOR    ${counter}    IN RANGE    10    0    -1
        Log To Console   ${counter}
        Exit For Loop If  ${counter}==0
        Sleep    1s
    END

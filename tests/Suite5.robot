*** Settings ***
Documentation    Test Suite with a custom Library
Library    SeleniumLibrary
Library    ../lib/CustomDriver.py

*** Variables ***

*** Keywords ***


*** Test Cases ***
Test case to test CustomDriver
    Log To Console    HI
    Open Custom Chrome Driver    https://www.google.com
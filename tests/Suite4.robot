*** Settings ***
Documentation    API Test case suite 
Library    RequestsLibrary
Library    Collections
Library    String
Library    SeleniumLibrary

*** Variables ***
${URL}    https://api.ipify.org/?format=json


*** Test Cases ***

API Test case
    Log To Console    ----Test Start----
    GET    https://www.google.com    expected_status=200
    Log To Console    ----Test End------

API Test case GET
    Log To Console    ----Test Start----
    ${response}    GET    ${URL}
    Log To Console    ${response.json()}
    Log To Console    ${response.status_code}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log To Console    ----Test End------

API GET
    ${postcode}    Set Variable    33631
    ${resp}    GET    https://api.zippopotam.us/us/${postcode}
    Log To Console    ${resp.json()}
    ${data}    Set Variable    ${resp.json()}
    Should Be Equal As Integers    200    ${resp.status_code}
    Log To Console    ${data['post code']}
    Should Be Equal As Integers    ${data['post code']}    ${postcode}
    Should Be Equal As Strings    ${data['country']}    United States
    Log To Console    ${data['places']}[0][place name]
    List Should Contain Value    ${data['places']}[0]    state
    Should Be Equal As Strings    ${data['places']}[0][state]     Florida

# API Test case POST
#     TRY
#         Log To Console    __Test Start__
#         ${res}    GET    http://localhost:3000/dogs
#         Status Should Be    200
#         ${payload}    Create Dictionary    name=Jane    age=25
#         Log To Console    ${payload}
#         ${resp}    POST    http://localhost:3000/dogs    json=${payload}
#      EXCEPT    "Fail"
    
#     END


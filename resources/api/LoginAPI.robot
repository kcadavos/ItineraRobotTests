*** Settings ***
Documentation    This is the API resource file for Itinera Login functionality.
Library    RequestsLibrary  #for api testing

*** Variables ***
${API_BASE_URL}   https://itineraioapi-ebdthgaebndcddam.westus2-01.azurewebsites.net/
${LoginEndpoint}   User/Login


*** Keywords ***

Get Token
    [Arguments]     ${USERNAME}    ${PASSWORD}
    &{req_body}=     Create Dictionary    email=${USERNAME}    password=${PASSWORD}
    ${response}=    POST    ${API_BASE_URL}${LoginEndpoint}    json=&{req_body}    expected_status=200
    RETURN   ${response.json()}
    
Compare API And UI Value
    [Arguments]    ${api_value}    ${ui_value}
    Should Be Equal    ${api_value}    ${ui_value}

Get User Name   
    [Arguments]     ${USERNAME}   
    ${response}=    GET    ${API_BASE_URL}User/GetUserInfoByEmail/${USERNAME}     expected_status=200
    ${data}=   Set Variable   ${response.json()}
    RETURN     ${data}[name]
 
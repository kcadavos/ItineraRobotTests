*** Settings ***
Documentation    This is the API test suite for Itinera Login functionality.
Library    RequestsLibrary  #for api testing
Resource   ../../resources/api/LoginAPI.robot
*** Variables ***

&{HEADERS}    Content-Type=application/json
${USERNAME}    karencadavos@gmail.com
${PASSWORD}    123

*** Test Cases ***
Login Test
    Get Token    ${USERNAME}    ${PASSWORD}

User Info  
    ${namefromAPI}=    Get User Name      ${USERNAME}  
    Log To Console    ${namefromAPI} 
    Compare API And UI Value    ${namefromAPI}    Karen Anne
  
# *** Keywords ***

# Get Token
#     [Arguments]     ${USERNAME}    ${PASSWORD}
#     &{req_body}=     Create Dictionary    email=${USERNAME}    password=${PASSWORD}
#     ${response}=    POST    ${API_URL}${LoginEndpoint}    json=&{req_body}    expected_status=200
#     # Log To Console   ${response.json()}
#     Should Not Be Empty    ${response.json()}
    
# Compare API And UI Value
#     [Arguments]    ${api_value}    ${ui_value}
#     Should Be Equal    ${api_value}    ${ui_value}

# Get User Name   
#     [Arguments]     ${USERNAME}   
#     ${response}=    GET    ${API_URL}User/GetUserInfoByEmail/${USERNAME}     expected_status=200
#     ${data}=   Set Variable   ${response.json()}
#     RETURN     ${data}[name]
 


*** Settings ***
Documentation    This is the API test suite for Itinera Login functionality.
Resource   ../../resources/api/LoginAPI.robot
*** Variables ***
&{HEADERS}    Content-Type=application/json
${USERNAME}    karencadavos@gmail.com
${PASSWORD}    123

*** Test Cases ***
Verify Token Received
    ${response}=    Get Token    ${USERNAME}    ${PASSWORD}
    Should Not Be Empty    ${response}[token]

Verify User Name 
    ${namefromAPI}=    Get User Name      ${USERNAME}  
    Log To Console    ${namefromAPI} 
    Compare API And UI Value    ${namefromAPI}    Karen Anne


Get User Name
    [Arguments]     ${USERNAME}
    ${namefromAPI}=    Get User Name      ${USERNAME}  
    return Username    ${namefromAPI}
  


